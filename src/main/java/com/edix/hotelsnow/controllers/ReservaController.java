package com.edix.hotelsnow.controllers;

import java.math.BigDecimal;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edix.hotelsnow.dao.HoteleDao;
import com.edix.hotelsnow.dao.ReservaDao;
import com.edix.hotelsnow.dao.UsuarioDao;
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
	@GetMapping("/reservar")
	public String reservar() {
		return "reservaForm";
	}
	@PostMapping("/reservar")
	public String reservar(@RequestParam("entrada") Date entrada, @RequestParam("salida") Date salida, @RequestParam("checkin") String horario, @RequestParam("huesped") String numero, HttpSession session ) {
		Reserva r = new Reserva();
		Integer idHotel = (Integer) session.getAttribute("idHotel");
        if (idHotel == null) {
            // Manejar el caso en que el atributo no existe en la sesión
            return "redirect:/";
        }
        Hotele h = hdao.buscarUno(idHotel);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
		Usuario user = udao.buscarUsuario(username);
		r.setFechaLlegada(entrada);
		r.setFechaSalida(salida);
		r.setHotele(h);
		r.setUsuario(user);
		r.setNumeroHabitaciones(Integer.parseInt(numero));
		r.setTotalPagar(new BigDecimal(100.2));
		rdao.confirmarResera(r);
		return "/";
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
