package com.edix.hotelsnow.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edix.hotelsnow.dao.TarjetaBancariaDao;
import com.edix.hotelsnow.dao.UsuarioDao;
import com.edix.hotelsnow.entitybeans.TarjetasBancaria;
import com.edix.hotelsnow.entitybeans.Usuario;

@Controller
@RequestMapping("/tarjeta")
public class TarjetaBancariaController {

	@Autowired
	private TarjetaBancariaDao tdao;
	
	@Autowired
	private UsuarioDao udao;
	
	/**
	 * Método que nos muestra la vista alta tarjeta.
	 * @return Devolvemos la vista altaTarjeta
	 */
	@GetMapping("/alta")
	public String irAltaTarjeta() {
		
		
		return "altaTarjeta";
	}
	
	
	/**
	 * Método que nos muestra todas las tarjetas que se han creado.
	 * 
	 * @param model Usado para poder pasar atributos a las vistas.
	 * @return Devuelve todas las tarjetas.
	 */
	@GetMapping("/tarjetas")
	public String todasTarjetas(Model model) {
		
		model.addAttribute("todasTarjetas", tdao.todas());
		
		return "tarjetas";
	}

	
	
	
	/**
	 * Método para mostrar la información de una tarjeta buscada por id.
	 * 
	 * @param id Parametro para buscar la tarjeta
	 * @param model Usado para poder pasar atributos a las vistas
	 * @return Devolvemos la vista con la información de la tarjeta
	 */
	@GetMapping("/verTarjeta/{id}")
	public String irDetalleTarjeta(@PathVariable("id") int id, Model model) {
		
		TarjetasBancaria detalleTarjeta = tdao.buscarUna(id);
		
		model.addAttribute("tarjetaBancaria", detalleTarjeta);
		
		return "detalleTarjeta";
	}
	
	

	/**
	 * Método para eliminar una tarjeta.
	 * 
	 * @param auth Para obtener el usuario
	 * @param idTarjeta Parametro para buscar la tarjeta a elimianr
	 * @return Devolvemos la vista de mis tarjetas
	 */
	@GetMapping("/eliminar/{id}")
	public String eliminar(Authentication auth,@PathVariable("id") int idTarjeta) {
		
		Usuario usuario = udao.buscarUsuario(auth.getName());
		String userName = usuario.getUsername();
		
		System.out.println(userName);
		System.out.println(usuario);
		
		for(TarjetasBancaria ele : tdao.todas()) {
			if(ele.getIdTarjetaBancaria() == idTarjeta) {
				usuario.removeTarjeta(idTarjeta);
				//udao.modUsuario(usuario);
				tdao.eliminarTarjeta(idTarjeta);
			}
		}
		
		return "redirect:/usuario/misTarjetas/"+userName;
	}
	
	/**
	 * Método para llevar a cabo el alta de una tarjeta
	 * 
	 * @param auth Para obtener el usuario que realiza el alta de la tarjeta
	 * @param tarjeta Es la entidad que se rellena con los parametros del formulario de alta
	 * @param attr Para redirigir despues de un POST
	 * @return Devuelve la vista de mistarjetas para que las veamos
	 */
	@PostMapping("/alta")
	public String altaTarjeta(Authentication auth,TarjetasBancaria tarjeta, RedirectAttributes attr) {
		
		Usuario usuario = udao.buscarUsuario(auth.getName());	
		
		
		if(tdao.nuevaTarjeta(tarjeta) != 0) {
			tarjeta.setUsuario(usuario);
			usuario.addTarjetA(tarjeta);
			//udao.modUsuario(usuario);
			attr.addFlashAttribute("mensaje", "Tarjeta bancaria dada de alta");
		} else {

			attr.addFlashAttribute("mensaje", "Error al crear la tarjeta");
		}		
		
		return "redirect:/usuario/misTarjetas/"+auth.getName();
	}
	
	
	@GetMapping("/editar/{idTarjetaBancaria}")
	public String irEditarTarjertaBancari(@PathVariable("idTarjetaBancaria") int idTarjetaBancaria, Model model) {

		model.addAttribute("tarjetaEditar", tdao.buscarUna(idTarjetaBancaria));
		
		return "editarTarjeta";
	}
	
	
	/**
	 * Método para editar la tarjeta
	 * 
	 * @param tarjeta Entidad que queremos modificar, parametros pasados por el formulario de editar
	 * @param attr Para redirigir despues de un POST
	 * @param auth Para obtener el usuario
	 * @return -> Devolvemos la vista mis tarjetas para corroborar los cambios
	 */
	@PostMapping("/editar")
	public String editarTarjeta(@ModelAttribute TarjetasBancaria tarjeta, RedirectAttributes attr, Authentication auth) {
				
		//Obtenemos la tarjeta existente
		TarjetasBancaria tarjetaExistente = tdao.buscarUna(tarjeta.getIdTarjetaBancaria());
		
		if(tarjetaExistente == null) {
			attr.addFlashAttribute("mensaje", "tarjeta no encontrada");
		} else {			
			//Actualizamos los campos necesarios
			tarjetaExistente.setNumeroTarjeta(tarjeta.getNumeroTarjeta());
			tarjetaExistente.setNombreTitular(tarjeta.getNombreTitular());
			tarjetaExistente.setFechaCaducidad(tarjeta.getFechaCaducidad());
			tarjetaExistente.setCvv(tarjeta.getCvv());
			tarjetaExistente.setUsuario(tarjeta.getUsuario());
			
			tdao.modificarTarjeta(tarjetaExistente);
			
					
			attr.addFlashAttribute("mensaje", "Tarjeta modificada con Ã©xito");
		
		}
	
		return "redirect:/usuario/misTarjetas/"+auth.getName();
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder webdataBinder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		webdataBinder
		.registerCustomEditor(Date.class, new CustomDateEditor(sdf, false));
	}
}
