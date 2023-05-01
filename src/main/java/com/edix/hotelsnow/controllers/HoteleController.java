package com.edix.hotelsnow.controllers;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
import com.edix.hotelsnow.dao.UsuarioDao;
import com.edix.hotelsnow.entitybeans.Habitacione;
import com.edix.hotelsnow.entitybeans.Hotele;
import com.edix.hotelsnow.entitybeans.Usuario;

@Controller
@RequestMapping("/hotel")
public class HoteleController {
	
	@Autowired
	private HoteleDao hdao;
	@Autowired
	private HabitacioneDao habdao;
	@Autowired
	private UsuarioDao udao;
	
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
	 * Método usado para devolver la lista de todos los hoteles.
	 * 
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @return vista listado de todos los hoteles
	 */
	@GetMapping("/all")
	public String listadoHoteles(Model model) {
		model.addAttribute("listaHoteles", hdao.mostrarTodos());
		return "listadoHoteles";
	}
	
	/**
	 * Método usado para devolver la vista de altaHotel
	 * 
	 * @return -> Nos envía a la vista para dar alta al hotel
	 */
	@GetMapping("/alta")
	public String irAltaHotel(Model model) {
		// Añadimos la lista de provincias al modelo
        model.addAttribute("provincias", getProvincias());
        
		return "altaHotel";
	}
	
	/**
	 * Método para realizar el alta de un hotel
	 * 
	 * @param h -> Es el hotel que recibimos del formulario
	 * @param attr -> lo usamos para redirigir información, cuando se usa POST
	 * @return -> Si todo va bien nos redirige a la página principal y vemos como se ha creado
	 * 				en cambio, si no, nos redirige de nuevo al formulario de alta
	 */
	@PostMapping("/alta")
	public String altaHotel(@ModelAttribute Hotele h, RedirectAttributes attr, @RequestParam("file") MultipartFile image) {
	
		  if(!image.isEmpty()) { 
			String rutaAbsoluta = "C:\\Hotel\\recursos\\";
			try {
				Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		        String username = auth.getName();
		        Usuario u = udao.buscarUsuario(username);
				byte[] bytesImg = image.getBytes();
				Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + image.getOriginalFilename());
				Files.createDirectories(rutaCompleta.getParent());
				Files.write(rutaCompleta, bytesImg);

				byte disponible = 1;
				
				h.setDisponible(disponible);
				h.setImg(image.getOriginalFilename());
				h.setUsuario(u);
				if(hdao.altaHotel(h)!=null) {
					attr.addFlashAttribute("mensaje", "Hotel creado correctamente");
					return "redirect:/";
				}
			}catch(Exception e) {
				e.printStackTrace();
			}		
		}
		
		return "redirect:/altaHotel";
	}
	
	/**
	 * Método para eliminar un hotel con el id como parámetro
	 * 
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
	
	/**
	 * Método para obtener la vista con la información de un hotel buscado por id como parámetro
	 * 
	 * @param idHotel -> Parametro para realizar la busqueda del hotel
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @param session -> Usado para meter en sesión atributos que depués nos harán falta
	 * @return -> Devolvemos la vista infoHotel
	 */
	@GetMapping("/info/{id}")
	public String irInfo(@PathVariable("id") int idHotel, Model model, HttpSession session) {
		if(hdao.buscarUno(idHotel)!=null) {
			model.addAttribute("hotel", hdao.buscarUno(idHotel));
			List<Habitacione> habitacioneList = habdao.findByHotele_IdHotel(idHotel);
			System.out.println(habitacioneList);
			session.setAttribute("idHotel", idHotel);
			model.addAttribute("listaHabs", habitacioneList);
			model.addAttribute("mensaje", "Aquí tienes la información del hotel: "+hdao.buscarUno(idHotel).getNombreHotel());
			return "infoHotel";
		}
		
		model.addAttribute("mensaje", "No ha sido posible ir a información del hotel");
		return "/";
	}
	
	/**
	 * Método para devolver la vista editar hotel
	 * 
	 * @param idHotel -> Parámetro para realizar la busqueda del hotel
	 * @param model -> Usado para poder pasar atributos a las vistas
	 * @return -> Devuelve la vista editarHotel
	 */
	@GetMapping("/editar/{id}")
	public String irEditar(@PathVariable("id") int idHotel, Model model) {
		Hotele h = hdao.buscarUno(idHotel);
		model.addAttribute("hotel",h);
		// Añadimos la lista de provincias al modelo
        model.addAttribute("provincias", getProvincias());
		
		return "editarHotel";
	}
	
	/**
	 * Método para hacer efectivo el editar Hotel
	 * 
	 * @param hotelEditar -> Es la entidad que hemos pasado por los parametros del formulario de editar
	 * @param attr -> Para redirigir después de un POST
	 * @param image -> Para tratar la imagen del formulario
	 * @return -> Devuelve la vista de editar y así comprobamos que los cambios se han realizado exitosamente.
	 */
	@PostMapping("/editar")
	public String editarHotel(@ModelAttribute Hotele hotelEditar, RedirectAttributes attr , @RequestParam("file") MultipartFile image) {
		
		Hotele h = hdao.buscarUno(hotelEditar.getIdHotel());
		
		h.setNombreHotel(hotelEditar.getNombreHotel());
		h.setCiudadHotel(hotelEditar.getCiudadHotel());
		h.setCorreoElectronicoHotel(hotelEditar.getCorreoElectronicoHotel());
		h.setDireccionHotel(hotelEditar.getDireccionHotel());
		h.setDisponible(hotelEditar.getDisponible());
		h.setTelefonoHotel(hotelEditar.getTelefonoHotel());
		String rutaAbsoluta = "C:/Hotel/recursos";
		try {
			byte[] bytesImg = image.getBytes();
			Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + image.getOriginalFilename());
			Files.createDirectories(rutaCompleta.getParent());
			Files.write(rutaCompleta, bytesImg);
			h.setImg(image.getOriginalFilename());
			if(hdao.modificarHotel(h)) {
				attr.addFlashAttribute("mensaje", "Producto modificado con éxito");
			}
			attr.addFlashAttribute("mensaje", "Producto imposible de modificar");
		}catch(Exception e) {
			e.printStackTrace();
		}	
		
		return "redirect:/";
	}
	
}
