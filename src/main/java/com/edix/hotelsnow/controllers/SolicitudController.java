package com.edix.hotelsnow.controllers;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
import com.edix.hotelsnow.dao.RoleDao;
import com.edix.hotelsnow.dao.SolicitudDao;
import com.edix.hotelsnow.dao.UsuarioDao;
import com.edix.hotelsnow.entitybeans.Comentario;
import com.edix.hotelsnow.entitybeans.Hotele;
import com.edix.hotelsnow.entitybeans.Role;
import com.edix.hotelsnow.entitybeans.SolicitudHotele;
import com.edix.hotelsnow.entitybeans.Usuario;

@Controller
@RequestMapping("/solicitud")
public class SolicitudController {

	@Autowired
	private ComentarioDao cdao;
	
	@Autowired
	private HoteleDao hdao;
	
	@Autowired
	private HabitacioneDao habdao;
	
	@Autowired
	private UsuarioDao udao;
	
	@Autowired 
	private SolicitudDao sdao;
	
	@Autowired
	private RoleDao rdao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	// Método para obtener una lista de provincias españolas
    private List<String> getProvincias() {
        return Arrays.asList("Álava", "Albacete", "Alicante", "Almería", "Asturias", "Ávila", "Badajoz", "Barcelona",
                "Burgos", "Cáceres", "Cádiz", "Cantabria", "Castellón", "Ciudad Real", "Córdoba", "Cuenca",
                "Gerona", "Granada", "Guadalajara", "Guipúzcoa", "Huelva", "Huesca", "Islas Baleares", "Jaén",
                "La Coruña", "La Rioja", "Las Palmas", "León", "Lérida", "Lugo", "Madrid", "Málaga", "Murcia",
                "Navarra", "Orense", "Palencia", "Pontevedra", "Salamanca", "Santa Cruz de Tenerife", "Segovia",
                "Sevilla", "Soria", "Tarragona", "Teruel", "Toledo", "Valencia", "Valladolid", "Vizcaya",
                "Zamora", "Zaragoza");
    }
    
	/**
	 * Método usado para ir a la vista altaSolicitud
	 * 
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @return -> Devolvemos la vista altaSolicitud
	 */
	@GetMapping("/altaSolicitud")
	public String irAltaComentario(Model model) {
	     model.addAttribute("provincias", getProvincias());
		return "altaSolicitud";
	}
	
	/**
	 * Método usado para realizar efectivo el alta de un comentario
	 * 
	 * @param attr -> Para poder redirigir despues de un POST
	 * @param hotel -> Entidad que se genera a partir de los campos del formulario
	 * @param user -> Persona que realiza el comentario
	 * @return -> Devuelve a la vista de alta comentario por si quisierasmo dejar otro nuevo
	 */
	@PostMapping("/altaSolicitud")
	public String guardarComentario( RedirectAttributes attr, @ModelAttribute Hotele hotel, @ModelAttribute Usuario user) {
		SolicitudHotele sHotel = new SolicitudHotele();
		if(hotel!= null && user != null) {
			sHotel.setIdHotelSolicitado(hotel.getIdHotel());
			sHotel.setCorreoElectronicoHotel(hotel.getCorreoElectronicoHotel());
			sHotel.setDireccionHotel(hotel.getDireccionHotel());
			sHotel.setTelefonoHotel(hotel.getTelefonoHotel());
			sHotel.setCiudadHotel(hotel.getCiudadHotel());
			sHotel.setNombreHotel(hotel.getNombreHotel());
			Role rol = rdao.findById(2);
			user.addRol(rol);
			user.setContrasena(passwordEncoder.encode(user.getContrasena()));
			sHotel.setUsuario(user);
			if(udao.registro(user)) {
				if(sdao.altaSolicitud(sHotel)!=null) {
					return "redirect:/";
				}
			}
		}
		return "altaSolicitud";
	}
	
	
	/**
	 * Método usado para realizar la acción del usuario
	 * 
	 * @param action -> La acción que ha seleccionado (aceptar o denegar)
	 * @param idSolicitud -> con el id buscamos la solicitud que precisa de aceptar o denegar
	 * @return -> Devolvemos la vista verSolicitudes para comprobar que se ha realizado el cambio
	 */
	@PostMapping("/accion")
	public String realizarAccionSolicitud(@RequestParam("accion") String action,@RequestParam("id_solicitud") String idSolicitud ) {
	        if (action != null) {
	        	SolicitudHotele sHotel = sdao.buscarUno(Integer.parseInt(idSolicitud));
	            if (action.equals("aceptar")) {	
	            	byte disponible = 1;
	            	Hotele hotel = new Hotele();
	            	hotel.setCiudadHotel(sHotel.getCiudadHotel());
	            	hotel.setCorreoElectronicoHotel(sHotel.getCorreoElectronicoHotel());
	            	hotel.setDireccionHotel(sHotel.getDireccionHotel());
	            	hotel.setDisponible(disponible);
	            	hotel.setNombreHotel(sHotel.getNombreHotel());
	            	hotel.setTelefonoHotel(sHotel.getTelefonoHotel());
	            	hotel.setUsuario(sHotel.getUsuario());
	            	if(hdao.altaHotel(hotel)!=null) {
	            		if(hotel.getUsuario().getEnabled()!=true) {
	            			hotel.getUsuario().setEnabled(true);
		            		udao.modificarUsuario(hotel.getUsuario());
	            		}
	            		if(sdao.denegarSolicitud(sHotel.getIdHotelSolicitado())==true){
	            			return "redirect:/usuario/verSolicitudes";
	            		}
	            	}
	            } else if (action.equals("denegar")) {
	            	if(sdao.denegarSolicitud(sHotel.getIdHotelSolicitado())==true){
	            		if(udao.eliminarUsuario(sHotel.getUsuario().getUsername())==true){
		            		System.out.println("Solicitud eliminada");
		            	} 
	            	}
	            	
	            }
	        }
            return "redirect:/usuario/verSolicitudes";
	}
	
	//Método necesario para formatear fechas
	@InitBinder
	public void initBinder(WebDataBinder webdataBinder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		webdataBinder
		.registerCustomEditor(Date.class, new CustomDateEditor(sdf, false));
	}
}
