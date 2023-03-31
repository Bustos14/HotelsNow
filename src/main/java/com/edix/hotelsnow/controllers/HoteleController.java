package com.edix.hotelsnow.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edix.hotelsnow.dao.HoteleDao;
import com.edix.hotelsnow.entitybeans.Hotele;

@Controller
@RequestMapping("/hotel")
public class HoteleController {
	
	@Autowired
	private HoteleDao hdao;
	
	/**
	 * @param model
	 * @return vista listado de todos los hoteles
	 */
	@GetMapping("/all")
	public String listadoHoteles(Model model) {
		model.addAttribute("listaHoteles", hdao.mostrarTodos());
		return "listadoHoteles";
	}
	
	
	/**
	 * @param idHotel -> Es el id del hotel que se desea buscar
	 * @param model -> Con model, podemos enviar información a nuestros jsp, en este caso pasamos el hotel que hemos buscado
	 * @return -> devuelve la vista verHotel.
	 */
	@GetMapping("/verUno/{id}")
	String verHotel(@PathVariable("id") int idHotel, Model model) {
		Hotele h = hdao.buscarUno(idHotel);
		model.addAttribute("hotel", h);
		// Mensaje para comprobar funcionamiento
		System.out.println("El hotel se llama: "+h.getNombreHotel());
		return "verHotel";
	}
}
