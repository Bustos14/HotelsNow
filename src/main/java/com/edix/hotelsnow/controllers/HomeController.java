package com.edix.hotelsnow.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edix.hotelsnow.Utils;
import com.edix.hotelsnow.dao.HabitacioneDao;
import com.edix.hotelsnow.dao.HoteleDao;
import com.edix.hotelsnow.dao.RoleDao;
import com.edix.hotelsnow.dao.UsuarioDao;
import com.edix.hotelsnow.entitybeans.Hotele;
import com.edix.hotelsnow.entitybeans.Role;
import com.edix.hotelsnow.entitybeans.Usuario;

@Controller
public class HomeController {
	
	@Autowired
	private HoteleDao hdao;
	@Autowired
	private RoleDao rdao;
	@Autowired
	private UsuarioDao udao;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private HabitacioneDao habdao;
	@Autowired
	private Utils utils;
	/** 
	 * Método para devolver la vista index
	 * 
	 * @param model para enviar la lista de los hoteles
	 * @param session guardado de sesión
	 * @return vista Index (mostramos los hoteles en cards)
	 */
	@GetMapping
	public String inicio(Model model, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        
		String username = auth.getName();
		Usuario uActual = udao.buscarUsuario(username);
		if(uActual != null) {
			session.setAttribute("username", username);
			Role rol = uActual.getRoles().get(0);
			if(rol.getNombre().equals("ROLE_ADMIN")) {
				model.addAttribute("listaHoteles", hdao.buscarPorUsuario(uActual));
			}else {
				model.addAttribute("listaHoteles", hdao.mostrarTodos());
			}
		}else{
			model.addAttribute("listaHoteles", hdao.mostrarTodos());
		}
		
        model.addAttribute("user", username);
		return "index";
	}
	
	/**
	 * Método para devolver la vista SobreNosotros
	 * 
	 * @return Devuelve la vista sobre nosotros
	 */
	@GetMapping("/sobreNosotros")
	public String sobreNosotros() {
		return "sobreNosotros";
	}
	
	/**
	 * Método para devolver la vista contacto
	 * 
	 * @return -> Devuelve la vista contacto
	 */
	@GetMapping("/contacto")
	public String contacto() {
		return "contacto";
	}
	
	/**
	 * Método para devolver la vista servicios
	 * 
	 * @return Devuelve la vista servicios 
	 */
	@GetMapping("/servicios")
	public String servicios() {
		return "servicios";
	}
	
	/**
	 * Método para devolver la vista de registro
	 *  
	 * @param model Usado para poder pasar atributos a las vistas
	 * @return Devuelve la vista de registro
	 */
	@GetMapping("/registro")
	public String registro(Model model) {
		List<Role> lRoles = new ArrayList<Role>();
		Role rol = new Role();
		lRoles.add(rol);
		model.addAttribute("roles", lRoles );
		return "/registro";
	}
	
	/**
	 * Método de registrar un usuario pero sólo para usuarios que tengan el ROL Administrador
	 * 
	 * @param model Usado para poder pasar atributos a las vistas
	 * @param usuario La entidad que registramos en el formulario
	 * @param ratt Para redirigir despuÃ©s de un método POST
	 * @return Redirige al login
	 */
	@PostMapping("/registro")
	public String proregistrar( Model model, Usuario usuario, RedirectAttributes ratt) {
		Role rol = rdao.findById(3);
		usuario.addRol(rol);
		usuario.setEnabled(true);
		usuario.setFechaRegistro(new Date());
		usuario.setContrasena(passwordEncoder.encode(usuario.getContrasena()));
		if(!utils.mayorEdad(usuario.getFechaNacimiento())) {
			model.addAttribute("mensaje", "Debes ser mayor de edad, para registrarte");
			return "/registroUsuario";
		}
		if(utils.mayorEdad(usuario.getFechaNacimiento())) {
			if (udao.registro(usuario)) {
		 		return "redirect:/login";
		 	}
		 	else {
		 		model.addAttribute("mensaje", "ya existe como usuario");
		 		return "registro";
		 	}
		}else {
			model.addAttribute("mensaje", "Debe ser mayor de edad");
			return "registro";

		}
	}

	/**
	 * Método para ir al formulario
	 * 
	 * @return -> Devuelve la vista del formulario de login
	 */
	@GetMapping("/login")
	public String mostrarLogin() {
		return "formLogin";
	}
	
	/**
	 * Realiza una búsqueda de hoteles según el tipo y criterio de búsqueda proporcionados.
	 *
	 * @param tipo         el tipo de búsqueda (nombre o ciudad)
	 * @param inputSearch  el criterio de búsqueda
	 * @param model        el objeto Model para agregar el resultado de la búsqueda
	 * @return el nombre de la vista a la que se redirige después de la búsqueda (en este caso, "index")
	 */
	@GetMapping("/search")
	public String busqueda(@RequestParam(name="tipo") String tipo, @RequestParam(name="inputSearch")String inputSearch, Model model) {
		List<Hotele> listaHoteles= new ArrayList<Hotele>();
		if(tipo.equals("Nombre")) {
			
			listaHoteles = hdao.findByNombreHotele(inputSearch);
			System.out.println(listaHoteles);
		}else if(tipo.equals("Ciudad")) {
			if(!inputSearch.isEmpty()) {
				System.out.println(inputSearch);
				listaHoteles = hdao.findByCiudadHotele(inputSearch);
			}else {
				listaHoteles = hdao.mostrarTodos();
			}
		}
		model.addAttribute("listaHoteles", listaHoteles);
		return "index";
	}
	
	/**
	 * Realiza una búsqueda de hoteles por tipo.
	 *
	 * @param tipo   el tipo de habitación a buscar
	 * @param model  el objeto Model para agregar el resultado de la búsqueda
	 * @return el nombre de la vista a la que se redirige después de la búsqueda (en este caso, "index")
	 */
	
	@GetMapping("/tipo/{tipo}")
	public String buscarPorTipo(@PathVariable ("tipo") String tipo, Model model) {
		List<Hotele> listaHoteles= habdao.findByHabTipo(tipo);
		if(tipo.equals("Todos")) {
			listaHoteles =  hdao.mostrarTodos();
		}
		model.addAttribute("listaHoteles", listaHoteles);
		return "index";
	}
	@InitBinder
	public void initBinder(WebDataBinder webdataBinder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		webdataBinder
		.registerCustomEditor(Date.class, new CustomDateEditor(sdf, false));
	}
		
}
