package com.edix.hotelsnow.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edix.hotelsnow.dao.ReservaDao;
import com.edix.hotelsnow.dao.TarjetaBancariaDao;
import com.edix.hotelsnow.dao.UsuarioDao;
import com.edix.hotelsnow.entitybeans.Reserva;
import com.edix.hotelsnow.entitybeans.TarjetasBancaria;
import com.edix.hotelsnow.entitybeans.Usuario;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {
	
	@Autowired
	private UsuarioDao udao;
	
	@Autowired
	private TarjetaBancariaDao tdao;
	@Autowired
	private ReservaDao rdao;
	
	@GetMapping("/perfil/{username}")
	public String irPerfil(@PathVariable("username") String username, Model model) {
		Usuario u = udao.buscarUsuario(username);
		List<Reserva> listaReservas = rdao.buscarPorUsuario(u);
		model.addAttribute("usuario", udao.buscarUsuario(username));
		model.addAttribute("numReservas", listaReservas.size());
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
	
	@GetMapping("/verTodos")
	public String verTodosUsuarios(Model model) {
		
		model.addAttribute("usuarios", udao.buscarPorRol("ROLE_CLIENTE"));
		model.addAttribute("admins", udao.buscarPorRol("ROLE_ADMIN"));
		
		return "listadoUsuarios";
	}
	
	@GetMapping("/misReservas")
	public String verMisReservas(Model model, Authentication auth) {
		
		Usuario user = udao.buscarUsuario(auth.getName());
		
		model.addAttribute("reservas", rdao.buscarPorUsuario(user));
		
		return "infoReservas";
	}
	
	/* TARJETAS */
	@GetMapping("/misTarjetas/{username}")
	public String misTarjetas(Authentication auth, Model model, @PathVariable("username") String username) {
		
		List<TarjetasBancaria> tarjetas = tdao.findByUsername(username);
		
		model.addAttribute("todasTarjetas", tarjetas);
		
		return "infoTarjetas";
	}
	
	
	@GetMapping("/alta")
	public String irAltaTarjeta(Authentication auth, HttpSession session) {

		
		
		return "altaTarjeta";
	}
	
	
	@PostMapping("/alta")
	public String altaTarjeta(Authentication auth, HttpSession sesion, TarjetasBancaria tarjeta, RedirectAttributes attr) {
		
		Usuario usuario = udao.buscarUsuario(auth.getName());
		
		if(tdao.nuevaTarjeta(tarjeta) != 0) {
			tarjeta.setUsuario(usuario);
			usuario.addTarjetA(tarjeta);
			udao.modificarUsuario(usuario);
			attr.addFlashAttribute("mensaje", "Tarjeta bancaria dada de alta");
		} else {
			attr.addFlashAttribute("mensaje", "Error al crear tarjeta bancaria");
		}
		System.out.println("el username : "+usuario.getUsername());
		System.out.println("las tarjetas son : "+usuario.getTarjetasBancarias());
		return "redirect:/usuario/misTarjetas/"+auth.getName();
	
	}
	
	
	/* FIN TARJETAS */
	
	

	
	
	

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
