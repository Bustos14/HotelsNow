package com.edix.hotelsnow.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.edix.hotelsnow.dao.ReservaDao;

@Controller
public class ReservaController {

	@Autowired
	ReservaDao rdao;
}
