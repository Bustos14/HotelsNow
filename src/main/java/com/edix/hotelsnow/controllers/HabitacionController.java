package com.edix.hotelsnow.controllers;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edix.hotelsnow.dao.HabitacioneDao;
import com.edix.hotelsnow.dao.HoteleDao;
import com.edix.hotelsnow.entitybeans.Habitacione;

@Controller
@RequestMapping("/habitacion")
public class HabitacionController {
	
	@Autowired
	private HabitacioneDao hdao;
	
	@Autowired
	private HoteleDao hodao;
	
	private List<String> getTiposHabitacion(){
		return Arrays.asList("individual","doble","tripele");
	}

	@GetMapping("/all")
	public String listadoHabitaciones(Model model) {
		model.addAttribute("listadoHabitaciones", hdao.todasHabitaciones());
		return "listadoHabitaciones";
	}
	
	@GetMapping("/verUna/{id}")
	public String verHabitación(@PathVariable("id") int idHabitacion, Model model) {
		Habitacione h = hdao.buscarUna(idHabitacion);
		model.addAttribute("habitacion", h);
		
		return "infoHabitacion";
	}
	
	@GetMapping("/alta")
	public String irAltaHabitacion(Model model) {
		model.addAttribute("hoteles", hodao.mostrarTodos());
		model.addAttribute("tipo", getTiposHabitacion());
		return "altaHabitacion";
	}
	
	@PostMapping("/alta")
	public String altaHabitacion(@ModelAttribute Habitacione h, RedirectAttributes attr) {
		byte disponible = 1;
		if(hdao.altaHabitacione(h)!=null) {
			attr.addFlashAttribute("mensaje", "Habitación creada correctamente");
			return "redirect:/";
		}
		return "redirect:/habitacion/alta";
	}
}
