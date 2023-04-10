package com.edix.hotelsnow.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edix.hotelsnow.dao.UsuarioDao;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {
	
	@Autowired
	private UsuarioDao udao;
	
	@GetMapping("/perfil/{username}")
	public String irPerfil(@PathVariable("username") String username, Model model) {
		
		model.addAttribute("usuario", udao.buscarUsuario(username));
		
		return "userPerfil";
	}
}
