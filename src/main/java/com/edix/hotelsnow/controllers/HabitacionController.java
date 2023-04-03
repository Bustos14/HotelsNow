package com.edix.hotelsnow.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edix.hotelsnow.dao.HabitacioneDao;
import com.edix.hotelsnow.entitybeans.Habitacione;

@Controller
@RequestMapping("/habitacion")
public class HabitacionController {
	
	@Autowired
	private HabitacioneDao hdao;

	@GetMapping("/all")
	public String listadoHabitaciones(Model model) {
		model.addAttribute("listadoHabitaciones", hdao.todasHabitaciones());
		return "listadoHabitaciones";
	}
	
	@GetMapping("/verUna/{id}")
	public String verHabitación(@PathVariable("id") int idHabitacion, Model model) {
		Habitacione h = hdao.buscarUna(idHabitacion);
		model.addAttribute("habitacion", h);
		
		return "verHabitacion";
	}
}
