package com.edix.hotelsnow.controllers;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edix.hotelsnow.dao.HabitacioneDao;
import com.edix.hotelsnow.dao.HoteleDao;
import com.edix.hotelsnow.entitybeans.Habitacione;
import com.edix.hotelsnow.entitybeans.Hotele;

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
	
	@GetMapping("/info/{id}")
	public String verHabitación(@PathVariable("id") int idHabitacion, Model model) {
		Habitacione h = hdao.buscarUna(idHabitacion);
		model.addAttribute("habitacion", h);
		
		return "infoHabitacion";
	}
	
	@GetMapping("/alta/{idHotel}")
	public String irAltaHabitacion(Model model, @PathVariable("idHotel")int idHotel) {
		model.addAttribute("hoteles", hodao.mostrarTodos());
		model.addAttribute("tipo", getTiposHabitacion());
		model.addAttribute("hotel", hodao.buscarUno(idHotel));
		return "altaHabitacion";
	}
	
	@GetMapping("/editar/{idHabitacion}")
	public String irEditarHabitacion(@PathVariable("idHabitacion") int idHabitacion, Model model, HttpSession session) {
		
		model.addAttribute("habitacion", hdao.buscarUna(idHabitacion));
		session.setAttribute("idHabitacion", idHabitacion);
		session.setAttribute("idHotel", hdao.buscarUna(idHabitacion).getHotele().getIdHotel());
		return "editarHabitacion";
	}
	
	@PostMapping("/editar")
	public String editarHabitacion(@ModelAttribute Habitacione habitacion, HttpSession session, RedirectAttributes attr, @RequestParam("file") MultipartFile image) {
		
		//Habitacione h = hdao.buscarUna((int)session.getAttribute("idHabitacion"));
		Habitacione h = hdao.buscarUna(habitacion.getIdHabitacion());
		
		h.setNombreHabitacion(habitacion.getNombreHabitacion());
		h.setTipoHabitacion(habitacion.getTipoHabitacion());
		h.setPrecioNoche(habitacion.getPrecioNoche());
		h.setDisponible(habitacion.getDisponible());
		h.setHotele(hodao.buscarUno((int)session.getAttribute("idHotel")));
		String rutaAbsoluta = "C:/Hotel/recursos";
		try {
			byte[] bytesImg = image.getBytes();
			Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + image.getOriginalFilename());
			Files.createDirectories(rutaCompleta.getParent());
			Files.write(rutaCompleta, bytesImg);
			h.setImg(image.getOriginalFilename());
			if(hdao.modificarHabitacion(h)) {
				attr.addFlashAttribute("mensaje", "Habitación modificada con éxito");
			}
			attr.addFlashAttribute("mensaje", "Habitación no modificada");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/habitacion/info/"+habitacion.getIdHabitacion();
	}
	
	@PostMapping("/alta")
	public String altaHabitacion(@ModelAttribute Habitacione h, RedirectAttributes attr, @RequestParam("file") MultipartFile image, @RequestParam("hotelId") int idHotel) {
		if(!image.isEmpty()) { 
			String rutaAbsoluta = "C:\\Hotel\\recursos";
			try {
				byte[] bytesImg = image.getBytes();
				Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + image.getOriginalFilename());
				Files.write(rutaCompleta, bytesImg);

				byte disponible = 1;
				
				Hotele hotel = hodao.buscarUno(idHotel);
				
				h.setHotele(hotel);
				h.setDisponible(disponible);
				h.setImg(image.getOriginalFilename());
				if(hdao.altaHabitacione(h)!=null) {
					attr.addFlashAttribute("mensaje", "Habitación creada correctamente");
					return "redirect:/";
				}
			}catch(Exception e) {
				e.printStackTrace();
			}		
		}
		
		return "redirect:/habitacion/alta";
	}
	
	@PostMapping("/eliminar/{id}")
	public String eliminarHabitacion(@PathVariable("id") int idHabitacion, RedirectAttributes attr) {
		if(hdao.eliminarHabitacion(idHabitacion)) {
			attr.addFlashAttribute("mensaje", "Eliminado, bien hecho");
			return "redirect:/";
		} else  {
			attr.addFlashAttribute("mensaje", "No eliminado, problemas");
			return "redirect:/";
		}
	}
	
}
