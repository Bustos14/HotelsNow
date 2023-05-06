package com.edix.hotelsnow.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edix.hotelsnow.dao.ComentarioDao;
import com.edix.hotelsnow.dao.HabitacioneDao;
import com.edix.hotelsnow.dao.HoteleDao;
import com.edix.hotelsnow.dao.ReservaDao;
import com.edix.hotelsnow.dao.UsuarioDao;
import com.edix.hotelsnow.entitybeans.Comentario;
import com.edix.hotelsnow.entitybeans.Hotele;
import com.edix.hotelsnow.entitybeans.Reserva;
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
	
	@Autowired
	private ReservaDao rdao;
	
	
	
	/**
	 * Método por el cual mostramos la vista donde tendremos un listado de todos los comentarios
	 * 
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @return -> Devuelve la vista listadoComentarios
	 */
	@GetMapping("/all")
	public String verTodosComentarios(Model model) {
		model.addAttribute("comentarios", cdao.mostrarTodos());
		return "listadoComentarios";
	}
	
	/**
	 * Método usado para devolver la vista del formulario para dar de alta un comentario
	 * 
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @param session -> Usado para poder obtener el idHotel que esta en sesión
	 * @return -> Devuelve la vista altaComentario si todo ha ido bien, si no redirige al home
	 */
	@GetMapping("/altaComentario")
	public String irAltaComentario(Model model, HttpSession session) {
		// Obtener el nombre de usuario del usuario autenticado
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String username = auth.getName();
	    Usuario u = udao.buscarUsuario(username);
	    List<Reserva> reserva = rdao.buscarPorUsuario(u); 
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
	
	/**
	 * Método usado en el formulario para hacer efectivo el alta de un comentario
	 * 
	 * @param mensaje -> Es el parámetro que recibimos a través del formulario.
	 * @param attr -> Usado para redirigir despúes de un POST
	 * @param session -> Usado para poder obtener el idHotel que esta en sesión
	 * @return
	 */
	@PostMapping("/altaComentario")
	public String guardarComentario(@RequestParam ("mensaje") String mensaje, RedirectAttributes attr,  HttpSession session) {
		Comentario c = new Comentario();
		Integer idHotel = (Integer) session.getAttribute("idHotel");
        if (idHotel == null) {
            // Manejar el caso en que el atributo no existe en la sesión
            return "redirect:/";
        }
		Hotele h = hdao.buscarUno(idHotel);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		Usuario user = udao.buscarUsuario(username);
		
		
		
		Date date = new Date();
		c.setUsuario(user);
		c.setMensaje(mensaje);
		c.setFechaComentario(date);
		c.setHotele(h);
		c.setIdComentario(0);
		Reserva existeReserva = null;
		List<Reserva> reservaList = rdao.buscarPorUsuario(user);
		for(Reserva r : reservaList) {
			if(r.getHotele().equals(h)) {
				existeReserva = r;
			}
		}
		List<Comentario> comentarioExistente = cdao.findByUsuario_Username(user.getUsername());
		for(Comentario comentario : comentarioExistente) {
			if(comentario.getHotele().equals(h)) {
				attr.addFlashAttribute("mensaje", "Comentario imposible de crear");
				return "redirect:/hotel/info/"+h.getIdHotel();
			}
		}
		if(existeReserva!=null) {
			if(cdao.crearComentario(c) != null && existeReserva.getFechaSalida().before(new Date())) {
				attr.addFlashAttribute("mensaje", "Comentario creado correctamente");
				return "redirect:/comentario/comentarios/"+c.getHotele().getIdHotel();
			}

		}
		attr.addFlashAttribute("mensaje", "Comentario imposible de crear");
		return "redirect:/hotel/info/"+h.getIdHotel();
	}
	
	/**
	 * Método usado para obtener los comentarios por el idHotel del hotel que se busca
	 * 
	 * @param idHotel -> Parámetro para realizar la búsqueda de sus comentarios
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @return -> Devuelve la vista de los comentarios de un hotel buscado por idHotel
	 */
	@GetMapping("/comentarios/{idHotel}")
	public String verComentariosHotel(@PathVariable("idHotel") int idHotel, Model model) {
		
		model.addAttribute("listaComentarios", cdao.findByHotele_IdHotel(idHotel));
		
		return "comentariosHotel";
	}
	
	//Método necesario para formatear fechas
	@InitBinder
	public void initBinder(WebDataBinder webdataBinder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		webdataBinder
		.registerCustomEditor(Date.class, new CustomDateEditor(sdf, false));
	}
}
