package com.edix.hotelsnow.controllers;

import java.nio.file.AccessDeniedException;
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

	/**
	 * Método usado para pasar mostrar las habitacioens que tenemos dada de alta
	 * 
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @return -> Devolvemos la vista listadoHabitaciones
	 */
	@GetMapping("/all")
	public String listadoHabitaciones(Model model) {
		model.addAttribute("listadoHabitaciones", hdao.todasHabitaciones());
		return "listadoHabitaciones";
	}
	
	/**
	 * Método usado para mostrar la vista con la información de una habitación de hotel buscado por idHabitacion
	 * 
	 * @param idHabitacion -> Parámetro para buscar por idHabitación entre todas las que tenemos
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @return Devuelve la vista con la informaicón de una habitación buscada por idHabitación
	 */
	@GetMapping("/info/{id}")
	public String verHabitacion(@PathVariable("id") int idHabitacion, Model model) {
		Habitacione h = hdao.buscarUna(idHabitacion);
		model.addAttribute("habitacion", h);
		
		return "infoHabitacion";
	}
	
	/**
	 * Método usado para devolver la vista en el que mostraremos un formulario para dar de alta una habitación
	 * 
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @param idHotel -> Parámetro para saber a que hotel pertenece la habitación que vamos a crear
	 * @return -> Devuelve la vista altaHabitación donde podremos rellenar el formulario
	 */
	@GetMapping("/alta/{idHotel}")
	public String irAltaHabitacion(Model model, @PathVariable("idHotel")int idHotel) {
		model.addAttribute("hoteles", hodao.mostrarTodos());
		model.addAttribute("tipo", getTiposHabitacion());
		model.addAttribute("hotel", hodao.buscarUno(idHotel));
		return "altaHabitacion";
	}
	
	/**
	 * Método usado para devolver la vista de editarHabitación.
	 *  
	 * @param idHabitacion -> Parámetro para poder buscar la habitación que deseamos modificar
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @param session -> Usado para meter en sesión la idHabitación el idHotel
	 * @return -> Devolvemos la vista editarHabitación, para poder editarla.
	 */
	@GetMapping("/editar/{idHabitacion}")
	public String irEditarHabitacion(@PathVariable("idHabitacion") int idHabitacion, Model model, HttpSession session) {
		
		model.addAttribute("habitacion", hdao.buscarUna(idHabitacion));
		session.setAttribute("idHabitacion", idHabitacion);
		session.setAttribute("idHotel", hdao.buscarUna(idHabitacion).getHotele().getIdHotel());
		return "editarHabitacion";
	}
	
	/**
	 * Método usado para hacer efectivo la modificación realizada en el formulario
	 *  
	 * @param habitacion -> Es el objeto Habitacione que se crea con los parámetros del formulario
	 * @param session -> Lo usamos para recuperar los parámetros que nos hacen falta que tenemos en sesión.
	 * @param attr -> Usado para redigir despues de un POST
	 * @param image -> Para poder tratar los archivos de imagen, que en este caso es de habitación
	 * @return -> Devuelve la vista de información de la habitación, para así poder corroborar los cambios
	 * @throws Exception -> Excepción producida por la no posible carga de la imagen
	 */
	@PostMapping("/editar")
	public String editarHabitacion(@ModelAttribute Habitacione habitacion, HttpSession session, RedirectAttributes attr, @RequestParam("file") MultipartFile image) throws AccessDeniedException {
		
		//Habitacione h = hdao.buscarUna((int)session.getAttribute("idHabitacion"));
		Habitacione habitacionAuxiliar = hdao.buscarUna(habitacion.getIdHabitacion());
		Hotele hotel = habitacionAuxiliar.getHotele();
		habitacion.setHotele(hotel);
		
		if(image!=null) {
			try {
				String rutaAbsoluta = "C:/Hotel/recursos";
				byte[] bytesImg = image.getBytes();
				Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + image.getOriginalFilename());
				Files.write(rutaCompleta, bytesImg);
				habitacion.setImg(image.getOriginalFilename());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
				habitacion.setImg(habitacionAuxiliar.getImg());
		}
		if(hdao.modificarHabitacion(habitacion)) {
			attr.addFlashAttribute("mensaje", "Habitación modificada con éxito");
		}
		
		return "redirect:/habitacion/info/"+habitacion.getIdHabitacion();
	}
	
	/**
	 * Método para hacer efectiva el alta de una habitación nueva
	 * 
	 * @param h -> h es el modelo de nuestra entidad Habitacione, que se rellena con los campos del formulario
	 * @param attr -> Para redirigir después de un metodo POST
	 * @param image -> Para tratar los archivos de imagen
	 * @param idHotel -> Para poder asignar la habitación al hotel correspondiente
	 * @return -> Devuelve al alta de habitación, por si queremos realizar otra alta.
	 */
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
	
	/**
	 * Método para realizar el delete de una habitación
	 * 
	 * @param idHabitacion -> Para poder localizar la habitación a eliminar
	 * @param attr -> Para redirigir después de un método POST
	 * @return -> Devuelve al home
	 */
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
