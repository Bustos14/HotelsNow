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
	 * @param attr -> Usado para redirigir despues de un POST
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
				return "redirect:/hotel/info/"+h.getIdHotel();
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
	@PostMapping("/comentarios/eliminar/{id}")
	public String eliminarComentario(@PathVariable("id") int idComentario) {
		if(cdao.buscarUno(idComentario)!=null) {
			if(cdao.eliminarComentairo(idComentario)) {
				return "redirect:/usuario/misComentarios";
			}
		}
		
		return "redirect:/usuario/misComentarios";
	}
	
	/**
	 * Método para obtener todos los comentarios y poder pintarlos en la vista
	 * 
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @return -> Se devuelve la vista para que el superAdmin pueda gestionar los comentarios de la web.
	 */
	@GetMapping("/verComentarios")
	public String verTodosComentariosSuperAdmin(Model model) {
		
		model.addAttribute("hotelesConComentarios", cdao.mostrarTodos());
		model.addAttribute("mensaje", "Todos los comentarios");
		
		return "listadoComentarios";
	}
	
	/**
	 * Método usado para eliminar un comentario del hotel desde la vista del superadmin
	 * 
	 * @param idComentario -> Parámetro para poder localizar el comentario por id
	 * @param attr -> Se usa para poder redirigir información despues de usar un POST
	 * @return -> Devuelve la vista donde mostramos los comentarios en tarjetas
	 */
	@PostMapping("/procederEliminar/{id}")
	public String eliminarComentarioSuperAdmin(@RequestParam("idComentario") int idComentario, RedirectAttributes attr) {
		
		if(cdao.buscarUno(idComentario) != null) {
			cdao.eliminarComentairo(idComentario);
			attr.addFlashAttribute("borrado", "Comentario con id : "+ idComentario + " ha sido eliminado");
		} else {
			attr.addFlashAttribute("borrado", "Comentario imposible de eliminar");			
		}
		
		
		return "redirect:/comentario/verComentarios";
	}
	

	/**
	 * Método usado para el formateo e interpretración de fechas.
	 * @param webdataBinder -> DataBinder especial para el enlace de datos desde parámetros de solicitud web a objetos JavaBean.
	 *
	 */
	
	@InitBinder
	public void initBinder(WebDataBinder webdataBinder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		webdataBinder
		.registerCustomEditor(Date.class, new CustomDateEditor(sdf, false));
	}
}
