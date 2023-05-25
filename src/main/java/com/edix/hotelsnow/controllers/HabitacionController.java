package com.edix.hotelsnow.controllers;

import java.nio.file.AccessDeniedException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
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
		return Arrays.asList("Individual","Doble","Triple");
	}

	/**
	 * M�todo usado para pasar mostrar las habitacioens que tenemos dada de alta
	 * 
	 * @param model  Usado para poder pasar atributos a las vistas
	 * @return  Devolvemos la vista listadoHabitaciones
	 */
	@GetMapping("/all")
	public String listadoHabitaciones(Model model) {
		model.addAttribute("listadoHabitaciones", hdao.todasHabitaciones());
		return "listadoHabitaciones";
	}
	
	/**
	 * M�todo usado para mostrar la vista con la informaci�n de una habitaci�n de hotel buscado por idHabitacion
	 * 
	 * @param idHabitacion  Par�metro para buscar por idHabitaci�n entre todas las que tenemos
	 * @param model Usado para poder pasar atributos a las vistas
	 * @return Devuelve la vista con la informaic�n de una habitaci�n buscada por idHabitaci�n
	 */
	@GetMapping("/info/{id}")
	public String verHabitacion(@PathVariable("id") int idHabitacion, Model model) {
		Habitacione h = hdao.buscarUna(idHabitacion);
		model.addAttribute("habitacion", h);
		
		return "infoHabitacion";
	}
	
	/**
	 * M�todo usado para devolver la vista en el que mostraremos un formulario para dar de alta una habitaci�n
	 * 
	 * @param model  Usado para poder pasar atributos a las vistas
	 * @param idHotel Par�metro para saber a que hotel pertenece la habitaci�n que vamos a crear
	 * @return Devuelve la vista altaHabitaci�n donde podremos rellenar el formulario
	 */
	@GetMapping("/alta/{idHotel}")
	public String irAltaHabitacion(Model model, @PathVariable("idHotel")int idHotel) {
		model.addAttribute("hoteles", hodao.mostrarTodos());
		model.addAttribute("tipo", getTiposHabitacion());
		model.addAttribute("hotel", hodao.buscarUno(idHotel));
		return "altaHabitacion";
	}
	
	/**
	 * M�todo usado para devolver la vista de editarHabitaci�n.
	 *  
	 * @param idHabitacion Par�metro para poder buscar la habitaci�n que deseamos modificar
	 * @param model Usado para poder pasar atributos a las vistas
	 * @param session Usado para meter en sesi�n la idHabitaci�n el idHotel
	 * @return Devolvemos la vista editarHabitaci�n, para poder editarla.
	 */
	@GetMapping("/editar/{idHabitacion}")
	public String irEditarHabitacion(@PathVariable("idHabitacion") int idHabitacion, Model model, HttpSession session) {
		
		model.addAttribute("habitacion", hdao.buscarUna(idHabitacion));
		session.setAttribute("idHabitacion", idHabitacion);
		session.setAttribute("idHotel", hdao.buscarUna(idHabitacion).getHotele().getIdHotel());
		return "editarHabitacion";
	}
	
	/**
	 * Método usado para hacer efectivo la modificaci�n realizada en el formulario
	 *  
	 * @param habitacion Es el objeto Habitacione que se crea con los par�metros del formulario
	 * @param session Lo usamos para recuperar los par�metros que nos hacen falta que tenemos en sesi�n.
	 * @param attr Usado para redigir despues de un POST
	 * @param image Para poder tratar los archivos de imagen, que en este caso es de habitaci�n
	 * @return Devuelve la vista de informaci�n de la habitaci�n, para as� poder corroborar los cambios
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
			attr.addFlashAttribute("mensaje", "Habitaci�n modificada con �xito");
		}
		
		return "redirect:/habitacion/info/"+habitacion.getIdHabitacion();
	}
	
	/**
	 * M�todo para hacer efectiva el alta de una habitaci�n nueva
	 * 
	 * @param h   es el modelo de nuestra entidad Habitacione, que se rellena con los campos del formulario
	 * @param attr  Para redirigir despu�s de un metodo POST
	 * @param image  Para tratar los archivos de imagen
	 * @param idHotel  Para poder asignar la habitaci�n al hotel correspondiente
	 * @return  Devuelve al alta de habitaci�n, por si queremos realizar otra alta.
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
					attr.addFlashAttribute("mensaje", "Habitaci�n creada correctamente");
					return "redirect:/";
				}
			}catch(Exception e) {
				e.printStackTrace();
			}		
		}
		
		return "redirect:/habitacion/alta";
	}
	
	/**
	 * M�todo para realizar el delete de una habitaci�n
	 * 
	 * @param idHabitacion  Para poder localizar la habitaci�n a eliminar
	 * @param attr  Para redirigir después de un m�todo POST
	 * @return  Devuelve al home
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
	@InitBinder
	public void initBinder(WebDataBinder webdataBinder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		webdataBinder
		.registerCustomEditor(Date.class, new CustomDateEditor(sdf, false));
	}
	
}
