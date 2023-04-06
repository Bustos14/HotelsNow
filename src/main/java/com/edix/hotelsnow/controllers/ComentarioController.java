package com.edix.hotelsnow.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edix.hotelsnow.dao.ComentarioDao;
import com.edix.hotelsnow.dao.HabitacioneDao;
import com.edix.hotelsnow.dao.HoteleDao;
import com.edix.hotelsnow.dao.UsuarioDao;
import com.edix.hotelsnow.entitybeans.Comentario;
import com.edix.hotelsnow.entitybeans.Hotele;
import com.edix.hotelsnow.entitybeans.Usuario;

@Controller
@RequestMapping("/comentario")
public class ComentarioController {

	@Autowired
	private ComentarioDao cdao;
	
	@Autowired
	private HoteleDao hdao;
	
	@Autowired
	private HabitacioneDao habdao;
	
	@Autowired
	private UsuarioDao udao;
	
	
	
	@GetMapping("/all")
	public String verTodosComentarios(Model model) {
		model.addAttribute("comentarios", cdao.mostrarTodos());
		return "listadoComentarios";
	}
	
	@GetMapping("/altaComentario")
	public String irAltaComentario(Model model, HttpSession session) {
		// Obtener el nombre de usuario del usuario autenticado
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String username = auth.getName();
	    Integer idHotel = (Integer) session.getAttribute("idHotel");
	    if (idHotel == null) {
	        // Manejar el caso en que el atributo no existe en la sesión
	        return "redirect:/";
	    }
    	System.out.println("El id del hotel es = "+idHotel);
    	System.out.println(username);
    	Usuario user = udao.buscarUsuario(username);
	    //Creamos comentario con algunos valores predeterminados
    	Comentario comentarioNuevo = new Comentario();
	    comentarioNuevo.setUsuario(user);
	    
	    model.addAttribute("comentarioNuevo", comentarioNuevo);
	    
		return "altaComentario";
	}
	
	@PostMapping("/altaComentario")
	public String guardarComentario(@RequestParam ("mensaje") String mensaje, RedirectAttributes attr,  HttpSession session) {
		Comentario c = new Comentario();
		Hotele h = hdao.buscarUno(1);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		Usuario user = udao.buscarUsuario(username);
		
		
		
		Date date = new Date();
		c.setUsuario(user);
		c.setMensaje(mensaje);
		c.setFechaComentario(date);
		c.setHotele(h);
		c.setIdComentario(0);
		System.out.println(mensaje + user.getNombre() + h.getNombreHotel() + date);
		if(cdao.crearComentario(c) != null) {
			attr.addFlashAttribute("mensaje", "Comentario creado correctamente");
			return "redirect:/";
		}

		attr.addFlashAttribute("mensaje", "Comentario imposible de crear");
		return "redirect:/alta";
	}
	
	//Método necesario para formatear fechas
	@InitBinder
	public void initBinder(WebDataBinder webdataBinder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		webdataBinder
		.registerCustomEditor(Date.class, new CustomDateEditor(sdf, false));
	}
}
