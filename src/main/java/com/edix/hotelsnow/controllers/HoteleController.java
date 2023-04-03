package com.edix.hotelsnow.controllers;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edix.hotelsnow.dao.HoteleDao;
import com.edix.hotelsnow.entitybeans.Hotele;

@Controller
@RequestMapping("/hotel")
public class HoteleController {
	
	@Autowired
	private HoteleDao hdao;
	
	// Método para obtener una lista de provincias españolas
    private List<String> getProvincias() {
        return Arrays.asList("Álava", "Albacete", "Alicante", "Almería", "Asturias", "Ávila", "Badajoz", "Barcelona",
                "Burgos", "Cáceres", "Cádiz", "Cantabria", "Castellón", "Ciudad Real", "Córdoba", "Cuenca",
                "Gerona", "Granada", "Guadalajara", "Guipúzcoa", "Huelva", "Huesca", "Islas Baleares", "Jaén",
                "La Coruña", "La Rioja", "Las Palmas", "León", "Lérida", "Lugo", "Madrid", "Málaga", "Murcia",
                "Navarra", "Orense", "Palencia", "Pontevedra", "Salamanca", "Santa Cruz de Tenerife", "Segovia",
                "Sevilla", "Soria", "Tarragona", "Teruel", "Toledo", "Valencia", "Valladolid", "Vizcaya",
                "Zamora", "Zaragoza");
    }
	
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
	public String verHotel(@PathVariable("id") int idHotel, Model model) {
		Hotele h = hdao.buscarUno(idHotel);
		model.addAttribute("hotel", h);
		// Mensaje para comprobar funcionamiento
		System.out.println("El hotel se llama: "+h.getNombreHotel());
		return "verHotel";
	}
	
	/**
	 * @return -> Nos envía a la vista para dar alta al hotel
	 */
	@GetMapping("/alta")
	public String irAltaHotel(Model model) {
		// Añadimos la lista de provincias al modelo
        model.addAttribute("provincias", getProvincias());
        
		return "altaHotel";
	}
	
	/**
	 * @param h -> Es el hotel que recibimos del formulario
	 * @param attr -> lo usamos para redirigir información, cuando se usa POST
	 * @return -> Si todo va bien nos redirige a la página principal y vemos como se ha creado
	 * 				en cambio, si no, nos redirige de nuevo al formulario de alta
	 */
	@PostMapping("/alta")
	public String altaHotel(@ModelAttribute Hotele h, RedirectAttributes attr/*, @RequestParam("file") MultipartFile image*/) {
	
		/* Implementación cuando tengamos imgs en la bbdd 
		 * 
		 * if(!image.isEmpty()) {
			//Path directorioImagenes = Paths.get("src//main//resources//static/images"); 
			String rutaAbsoluta = "C:/Producto/recursos";
			try {
				byte[] bytesImg = image.getBytes();
				Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + image.getOriginalFilename());
				Files.write(rutaCompleta, bytesImg);
				
				h.setImg(image.getOriginalFilename());
				if(pdao.nuevoProducto(h)==1) {
					attr.addFlashAttribute("mensaje", "Hotel añadido correctamente");
					return "redirect:/";
				}
			}catch(Exception e) {
				e.printStackTrace();
			}

			
		}
		
		return "redirect:/altaHotel";
		
		 * 
		 * */

		byte disponible = 1;
		
		h.setDisponible(disponible);
		if(hdao.altaHotel(h)!=null) {
			attr.addFlashAttribute("mensaje", "Hotel creado correctamente");
			return "redirect:/";
		}
		
		return "redirect:/altaProducto";
	}
	
	/**
	 * @param idHotel -> Es el id del hotel que se desea eliminar
	 * @param attr -> Usado para redirigir el mensaje a la vista
	 * @return -> redireccionamos al home ("/")
	 */
	@PostMapping("/eliminar/{id}")
	public String irEliminarHotel(@PathVariable("id") int idHotel, RedirectAttributes attr) {
		if(hdao.eliminarHotel(idHotel)) {
			attr.addFlashAttribute("mensaje", "Eliminado, bien hecho");
			return "redirect:/";
		} else  {
			attr.addFlashAttribute("mensaje", "No eliminado, problemas");
			return "redirect:/";
		}
	}
	
	@GetMapping("/info/{id}")
	public String irInfo(@PathVariable("id") int idHotel, Model model) {
		if(hdao.buscarUno(idHotel)!=null) {
			model.addAttribute("hotel", hdao.buscarUno(idHotel));
			model.addAttribute("mensaje", "Aquí tienes la información del hotel: "+hdao.buscarUno(idHotel).getNombreHotel());
			return "infoHotel";
		}
		
		model.addAttribute("mensaje", "No ha sido posible ir a información del hotel");
		return "/";
	}
	
	@GetMapping("/editar/{id}")
	public String irEditar(@PathVariable("id") int idHotel, Model model) {
		Hotele h = hdao.buscarUno(idHotel);
		model.addAttribute("hotel",h);
		
		return "editarHotel";
	}
	
	@PostMapping("/editar")
	public String editarHotel(@ModelAttribute Hotele hotelEditar, RedirectAttributes attr /*, @RequestParam("file") MultipartFile image*/) {
		
		Hotele h = hdao.buscarUno(hotelEditar.getIdHotel());
		
		h.setNombreHotel(hotelEditar.getNombreHotel());
		h.setCiudadHotel(hotelEditar.getCiudadHotel());
		h.setCorreoElectronicoHotel(hotelEditar.getCorreoElectronicoHotel());
		h.setDireccionHotel(hotelEditar.getDireccionHotel());
		h.setDisponible(hotelEditar.getDisponible());
		h.setTelefonoHotel(hotelEditar.getTelefonoHotel());
		
		if(hdao.modificarHotel(hotelEditar)) {
			attr.addFlashAttribute("mensaje", "Producto modificado con éxito");
		}
		attr.addFlashAttribute("mensaje", "Producto imposible de modificar");
		
		return "redirect:/";
	}
	
}
