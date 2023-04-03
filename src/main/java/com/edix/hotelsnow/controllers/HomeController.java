package com.edix.hotelsnow.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edix.hotelsnow.dao.HoteleDao;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private HoteleDao hdao;

	/** 
	 * @param model -> para enviar la lista de los hoteles
	 * @return vista Index (mostramos los hoteles en cards)
	 */
	@GetMapping
	public String inicio(Model model) {
		model.addAttribute("listaHoteles", hdao.mostrarTodos());
		return "index";
	}
	
	/*
	 * 
	 * Es para probar el jsp formulario
	 * 
	 */
	@GetMapping("/test")
	public String test() {
		return "form";
	}
}
