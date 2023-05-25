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

import com.edix.hotelsnow.dao.ComentarioDao;
import com.edix.hotelsnow.dao.HoteleDao;
import com.edix.hotelsnow.dao.ReservaDao;
import com.edix.hotelsnow.dao.SolicitudDao;
import com.edix.hotelsnow.dao.TarjetaBancariaDao;
import com.edix.hotelsnow.dao.UsuarioDao;
import com.edix.hotelsnow.entitybeans.Comentario;
import com.edix.hotelsnow.entitybeans.Hotele;
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
	
	@Autowired
	private ComentarioDao cdao;
	
	@Autowired
	private SolicitudDao sdao;
	@Autowired
	private HoteleDao hdao;
	
	/**
	 * Método usado para mostrar la vista con el perfil de usuario, con username como parametro de búsqueda
	 * 
	 * @param username -> Parámetro para buscar el perfil a mostrar del usuario
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @return -> Devolvemos la vista del perfil de usuario
	 */
	@GetMapping("/perfil/{username}")
	public String irPerfil(@PathVariable("username") String username, Model model) {
		Usuario u = udao.buscarUsuario(username);
		List<Reserva> listaReservas = rdao.buscarPorUsuario(u);
		List<Comentario> listaComentarios = cdao.findByUsuario_Username(username);
		
		if(u.getRoles().get(0).getNombre().equals("ROLE_ADMIN")) {
			List<Hotele> listadoHoteles = hdao.buscarPorUsuario(u);
			model.addAttribute("numHoteles",listadoHoteles.size());	
		}else {
			model.addAttribute("numHoteles",hdao.mostrarTodos().size());	
		}
		
		model.addAttribute("usuario", udao.buscarUsuario(username));
		model.addAttribute("numReservas", listaReservas.size());
		
		model.addAttribute("numComentarios", listaComentarios.size());
		return "userPerfil";
	}
	
	/**
	 * Método que hace efectivo la modificación del perfil de usuario
	 * 
	 * @param usuario -> son los parametros modificados en el formulario de modificar
	 * @param attr -> Para redirigir despues de un POST
	 * @return -> Devolvemos la vista del perfil de usuario
	 */
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
	
	/**
	 * Método para ver todos los usuarios
	 * 
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @return -> Devuelve una vista con todos los usuarios
	 */
	@GetMapping("/verTodos")
	public String verTodosUsuarios(Model model) {
		
		model.addAttribute("usuarios", udao.buscarPorRol("ROLE_CLIENTE"));
		model.addAttribute("admins", udao.buscarPorRol("ROLE_ADMIN"));
		
		return "listadoUsuarios";
	}
	
	/**
	 * Método que devuelve la vista con las solicitudes de alta de hoteles que tenemos pendientes
	 * 
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @return -> Devuelve la vista con todas las solicitudes
	 */
	@GetMapping("/verSolicitudes")
	public String verTodasSolicitudes(Model model) {
		model.addAttribute("solicitudes", sdao.mostrarTodas());
		
		return "listadoSolicitudes";
	}
	
	/**
	 * Método para ver mis reservas
	 * 
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @param auth -> Para obtener el usaurio
	 * @return -> Devuelve la vista con la información de mis reservas
	 */
	@GetMapping("/misReservas")
	public String verMisReservas(Model model, Authentication auth) {
		
		Usuario user = udao.buscarUsuario(auth.getName());
		if(rdao.buscarPorUsuario(user) != null) {
			model.addAttribute("reservas", rdao.buscarPorUsuario(user));
		}
		return "infoReservas";
	}
	
	/**
	 * Método usado para devolver la vista con mis comentarios
	 * 
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @param auth -> Para obetner el usaurio
	 * @return -> Devolvemos la vista con la información de mis comentarios
	 */
	@GetMapping("/misComentarios")
	public String verMisComentarios(Model model, Authentication auth) {
		
		Usuario user = udao.buscarUsuario(auth.getName());
		if(rdao.buscarPorUsuario(user) != null) {
			model.addAttribute("comentarios", cdao.findByUsuario_Username(user.getUsername()));
		} 
		return "infoComentarios";
	}
	
	/* TARJETAS */
	/**
	 * Método usado para devolver la información de las tarjetas con username como parametro
	 * 
	 * @param auth -> Para obtener al usuario
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @param username -> Parametro para buscar las tarjetas del usuario por username
	 * @return -> Devuelve la vista de la información de las tarjetas
	 */
	@GetMapping("/misTarjetas/{username}")
	public String misTarjetas(Authentication auth, Model model, @PathVariable("username") String username) {
		
		List<TarjetasBancaria> tarjetas = tdao.findByUsername(username);
		
		model.addAttribute("todasTarjetas", tarjetas);
		
		return "infoTarjetas";
	}
	
	
	/**
	 * Método par devolver la vista con el formulario de alta de la tarjeta
	 * @return -> Devolvemos la vista del formulario para el altaTarjeta
	 */
	@GetMapping("/alta")
	public String irAltaTarjeta() {

		
		
		return "altaTarjeta";
	}
	
	
	/**
	 * Método realizado para llevar acabo el altaTarjeta
	 * 
	 * @param auth -> Con el obtenemos el usuario que hace el alta tarjeta
	 * @param tarjeta -> La entidad que se rellena con los campos del formulario de alta
	 * @param attr -> Para redirigir despues de un POST
	 * @return -> Devolvemos la visdta de mis tarjetas
	 */
	@PostMapping("/alta")
	public String altaTarjeta(Authentication auth, TarjetasBancaria tarjeta, RedirectAttributes attr) {
		
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
