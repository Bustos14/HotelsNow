package com.edix.hotelsnow.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edix.hotelsnow.dao.UsuarioDao;
import com.edix.hotelsnow.entitybeans.Usuario;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {
	
	@Autowired
	private UsuarioDao udao;
	
	@GetMapping("/perfil/{username}")
	public String irPerfil(@PathVariable("username") String username, Model model) {
		
		model.addAttribute("usuario", udao.buscarUsuario(username));
		
		return "userPerfil";
	}
	
	@PostMapping("/modificarPerfil")
	public String modificarPerfil(Usuario usuario, RedirectAttributes attr) {
	    Usuario usuarioExistente = udao.buscarUsuario(usuario.getUsername());
	  
	    usuarioExistente.setContrasena(usuarioExistente.getContrasena());
	    usuarioExistente.setNombre(usuario.getNombre());
	    usuarioExistente.setApellidos(usuario.getApellidos());
	    usuarioExistente.setFechaNacimiento(usuario.getFechaNacimiento());
	    
	    if(udao.modificarUsuario(usuarioExistente) == 1) {
			attr.addFlashAttribute("mensaje", "Usuario actualizado");
		} else {
			attr.addFlashAttribute("mensaje", "No se ha podido actualizar usuario");
		}

	    return "redirect:/usuario/perfil/"+usuario.getUsername();
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
