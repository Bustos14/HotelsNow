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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edix.hotelsnow.dao.HoteleDao;
import com.edix.hotelsnow.dao.RoleDao;
import com.edix.hotelsnow.dao.UsuarioDao;
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
	
	/** 
	 * Método para devolver la vista index
	 * 
	 * @param model -> para enviar la lista de los hoteles
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
	 * @return -> Devuelve la vista sobre nosotros
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
	 * @return -> Devuelve la vista servicios 
	 */
	@GetMapping("/servicios")
	public String servicios() {
		return "servicios";
	}
	
	/**
	 * Método para devolver la vista de registro
	 *  
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @return -> Devuelve la vista de registro
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
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @param usuario -> La entidad que registramos en el formulario
	 * @param ratt -> Para redirigir después de un método POST
	 * @return -> Redirige al login
	 */
	@PostMapping("/registro")
	public String proregistrar( Model model, Usuario usuario, RedirectAttributes ratt) {
		Role rol = rdao.findById(3);
		usuario.addRol(rol);
		usuario.setEnabled(true);
		usuario.setFechaRegistro(new Date());
		usuario.setFechaNacimiento(new Date());
		usuario.setApellidos(usuario.getNombre());
		usuario.setContrasena(passwordEncoder.encode(usuario.getContrasena()));
		
		if(!mayorEdad(usuario.getFechaNacimiento())) {
			model.addAttribute("mensaje", "Debes ser mayor de edad, para registrarte");
			return "/registroUsuario";
		}
		if(mayorEdad(usuario.getFechaNacimiento())) {
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
	 * Método encargado de procesar el login, comprueba si existe y si es así manda a la url que estabamos buscando
	 * 
	 * @param username -> Parametro con el username para acceder a la aplicación
	 * @param password -> Parametro con el password para acceder a la aplicación
	 * @param redirectAttributes -> Para redirigir después de un POST
	 * @param misession -> Para poder meter en sesión ese usuario y ser reconocido durante el tiempo que dure la conexión.
	 * @return -> Devuelve la vista de inicio
	 */
	@PostMapping("/login")
    public String login(@RequestParam("email") String username,
                        @RequestParam("password") String password,
                        RedirectAttributes redirectAttributes, HttpSession misession) {
        if (username.equals("usuario") && password.equals("clave")) {
            SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(username, password, new ArrayList<>()));
            Usuario uSession = (Usuario) misession.getAttribute("invitado");
            return "redirect:/";
        } else {

            redirectAttributes.addFlashAttribute("error", "Nombre de usuario o contraseña incorrectos.");
            return "redirect:/login";
        }
    }
	//Método necesario para formatear fechas
		@InitBinder
		public void initBinder(WebDataBinder webdataBinder) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			webdataBinder
			.registerCustomEditor(Date.class, new CustomDateEditor(sdf, false));
		}
		
		/**
		 * Determina si una persona es mayor de edad a partir de su fecha de nacimiento.
		 *
		 * @param feNac la fecha de nacimiento de la persona
		 * @return true si la persona es mayor de edad, false si es menor de edad
		 */
		public boolean mayorEdad(Date feNac) {
			Date fechaActual = new Date();
			
	        long edadEnMilisegundos = fechaActual.getTime() - feNac.getTime();
		    // Convierte la diferencia a años dividiéndola por el número de milisegundos en un año.
	        long edadEnAnios = edadEnMilisegundos / (365 * 24 * 60 * 60 * 1000L);
	        return edadEnAnios >= 18;
		}
		
}
