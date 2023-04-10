package com.edix.hotelsnow.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edix.hotelsnow.dao.ReservaDao;

@RequestMapping("/reserva")
@Controller
public class ReservaController {

	@Autowired
	ReservaDao rdao;
	
	@GetMapping("/reservar")
	public String reservar() {
		return "reservaForm";
	}
	
}
