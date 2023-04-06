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
	 * @param model -> para enviar la lista de los hoteles
	 * @return vista Index (mostramos los hoteles en cards)
	 */
	@GetMapping
	public String inicio(Model model) {
		model.addAttribute("listaHoteles", hdao.mostrarTodos());
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("user", username);
		return "index";
	}
	
	@GetMapping("/sobreNosotros")
	public String sobreNosotros() {
		return "sobreNosotros";
	}
	
	@GetMapping("/contacto")
	public String contacto() {
		return "contacto";
	}
	
	@GetMapping("/servicios")
	public String servicios() {
		return "servicios";
	}
	
	/*
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/registro")
	public String registro(Model model) {
		List<Role> lRoles = new ArrayList<Role>();
		Role rol = new Role();
		rol.setIdRol(1);
		rol.setNombre("SuperAdmin");
		lRoles.add(rol);
		model.addAttribute("roles", lRoles );
		return "/registro";
	}
	
	/**
	 * Método de registrar un usuario pero sólo para usuarios que tengan el ROL Administrador
	 * 
	 * @param rol
	 * @param model
	 * @param usuario
	 * @param ratt
	 * @return
	 */
	/**
	 * Método de registrar un usuario pero sólo para usuarios que tengan el ROL Administrador
	 * 
	 * @param rol
	 * @param model
	 * @param usuario
	 * @param ratt
	 * @return
	 */
	@PostMapping("/registro")
	public String proregistrar( Model model, Usuario usuario, RedirectAttributes ratt) {

		Role rol = new Role();
		rol.setIdRol(1);
		rol.setNombre("SuperAdmin");
		usuario.addRol(rol);
	
		usuario.setEnabled(true);
		usuario.setFechaRegistro(new Date());
		usuario.setFechaNacimiento(new Date());
		usuario.setApellidos(usuario.getNombre());
		usuario.setContrasena(passwordEncoder.encode(usuario.getContrasena()));
		if (udao.registro(usuario)) {
	 		return "redirect:/login";
	 	}
		/*if(!mayorEdad(usuario.getFechaNacimiento())) {
			model.addAttribute("mensaje", "Debes ser mayor de edad, para registrarte");
			return "/registroUsuario";
		}
		if(mayorEdad(usuario.getFechaNacimiento())) {
			
		 	else {
		 		model.addAttribute("mensaje", "ya existe como usuario");
		 		return "/registroUsuario";
		 		
		 	}
		}else {
			model.addAttribute("mensaje", "Debe ser mayor de edad");
			return "/registroUsuario";

		}*/
	 	return "registro";
	}
	/**
	 * Método para ir al formulario
	 * 
	 * @return
	 */
	@GetMapping("/login")
	public String mostrarLogin() {
		return "formLogin";
	}
	/**
	 * Método encargado de procesar el login, comprueba si existe y si es así manda a la url que estabamos buscando
	 * 
	 * @param username
	 * @param password
	 * @param redirectAttributes
	 * @param misession
	 * @return
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
		public boolean mayorEdad(Date feNac) {
			 Date fechaActual = new Date();
		        long edadEnMilisegundos = fechaActual.getTime() - feNac.getTime();
		        long edadEnAnios = edadEnMilisegundos / (365 * 24 * 60 * 60 * 1000L);
		        return edadEnAnios >= 18;
		}
		
}
