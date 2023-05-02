package com.edix.hotelsnow.controllers;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

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

import com.edix.hotelsnow.dao.HabitacioneDao;
import com.edix.hotelsnow.dao.HoteleDao;
import com.edix.hotelsnow.dao.ReservaDao;
import com.edix.hotelsnow.dao.UsuarioDao;
import com.edix.hotelsnow.entitybeans.Habitacione;
import com.edix.hotelsnow.entitybeans.Hotele;
import com.edix.hotelsnow.entitybeans.Reserva;
import com.edix.hotelsnow.entitybeans.Usuario;

@RequestMapping("/reserva")
@Controller
public class ReservaController {

	@Autowired
	ReservaDao rdao;
	@Autowired
	UsuarioDao udao;
	@Autowired
	HoteleDao hdao;
	@Autowired
	HabitacioneDao habdao;
	
	/**
	 * Método que muestra la vista con el formulario de reserva
	 * 
	 * @param session -> Para poder meter en sesión el id de la reserva
	 * @param idHab -> el id que vamos a meter en sesión
	 * @return -> Devuelve la vista de reserva
	 */
	@GetMapping("/reservar/{id}")
	public String reservar(HttpSession session, @PathVariable("id") int idHab) {
		System.out.println(idHab);
		session.setAttribute("idHab", idHab);
		return "reservaForm";
	}
	
	/**
	 * Método por el cual se hace efectivo el reservar
	 * 
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @param entrada -> Parametro para saber la fecha de la entrada en la habitación
	 * @param salida -> Parametro para saber la fecha de salida de la habitación
	 * @param horario -> Parametro para saber la hora de llegada al hotel
	 * @param numero -> Parametro que determina el numero de huespedes en la habitacion
	 * @param session -> Para poder meter en sesión información importante y poder recuperarla cuando sea necesario
	 * @param atrr -> Para redirigir despues de un POST
	 * @return -> Redirigimos al perfil del usuario
	 */
	@PostMapping("/reservar")
	public String reservar(Model model, @RequestParam("entrada") Date entrada, @RequestParam("salida") Date salida, @RequestParam("checkin") String horario, @RequestParam("huesped") String numero, HttpSession session, RedirectAttributes atrr ) {
		Reserva r = new Reserva();
		Integer idHotel = (Integer) session.getAttribute("idHotel");
		System.out.println((Integer) session.getAttribute("idHab"));
		int idHabitacion =  (Integer) session.getAttribute("idHab");
		Integer numeroHuesped = Integer.parseInt(numero);
		Habitacione hab = habdao.buscarUna(idHabitacion);
		BigDecimal cantidadPorNoche = hab.getPrecioNoche();
        if (idHotel == null) {
            return "reservaForm";
        }
        Hotele h = hdao.buscarUno(idHotel);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
		Usuario user = udao.buscarUsuario(username);
		if(entrada.after(salida)) {
			model.addAttribute("mensaje", "La fecha de entrada debe ser anterior a la de salida.");
		}else {
			r.setFechaLlegada(entrada);
			r.setFechaSalida(salida);
		}
		r.setHotele(h);
		r.setUsuario(user);
		r.setNumeroHabitaciones(numeroHuesped);
		Double cNoche = cantidadPorNoche.doubleValue();
		r.setTotalPagar(new BigDecimal(cNoche * (numeroHuesped)));
		rdao.confirmarResera(r);
			atrr.addFlashAttribute("mensaje", "Reserva de la habitación "+hab.getNombreHabitacion()+" del hotel " + h.getNombreHotel() + " con un total de "+r.getTotalPagar()+"€");
		return "redirect:/usuario/perfil/"+user.getUsername();
	}
	
	/**
	 * Método realizado para cancelar uan reserva, buscada por id
	 * 
 	 * @param idReserva -> parametro para buscar la reserva por id
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @return -> Devuelve la vista de misReservas
	 */
	@GetMapping("/cancelar/{id}")
	public String cancelar(@PathVariable("id") int idReserva, Model model) {
		if(rdao.cancelarReserva(idReserva)) {
			model.addAttribute("mensaje", "Reserva cancelada con exito");
		}else {
			model.addAttribute("mensaje", "Error al cancelar. Vuelva a intentarlo mas tarde o contacte con soporte.");
		}
		return "redirect:/usuario/misReservas";
	}
	
	/**
	 * Método para ir a la vista, donde podemos ver todas las reservas
	 * 
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @return -> Devuelve una vista con todas las reservas
	 */
	@GetMapping("/verTodas")
	public String verTodasReservas(Model model) {
		
		model.addAttribute("reservas", rdao.buscarTodas());
		
		return "listadoReservas";
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
