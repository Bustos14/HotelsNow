package com.edix.hotelsnow.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edix.hotelsnow.dao.HabitacioneDao;

@Controller
@RequestMapping("/habitacion")
public class HabitacionController {
	
	@Autowired
	private HabitacioneDao hdao;

}
