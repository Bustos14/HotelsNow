package com.edix.hotelsnow;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

public class Utils {

	
	//Javadoc hecho en otros controladores
			@InitBinder
			public void initBinder(WebDataBinder webdataBinder) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				webdataBinder
				.registerCustomEditor(Date.class, new CustomDateEditor(sdf, false));
			}
			
			/**
			 * Determina si una persona es mayor de edad a partir de su fecha de nacimiento.
			 *
			 * @param feNac la fecha de nacimiento de la persona
			 * @return true si la persona es mayor de edad, false si es menor de edad
			 */
			public boolean mayorEdad(Date feNac) {
				Date fechaActual = new Date();
				
		        long edadEnMilisegundos = fechaActual.getTime() - feNac.getTime();
			    // Convierte la diferencia a aÃ±os dividiÃ©ndola por el nÃºmero de milisegundos en un aÃ±o.
		        long edadEnAnios = edadEnMilisegundos / (365 * 24 * 60 * 60 * 1000L);
		        return edadEnAnios >= 18;
			}
			
			
			/**
			 * Listado de ciudades disponibles
			 *
			 * @return retorna un listado de ciudades
			 */
			 public List<String> getProvincias() {
		    	   return Arrays.asList("Álava", "Albacete", "Alicante", "Almería", "Asturias", "Ávila", "Badajoz", "Barcelona",
		                   "Burgos", "Cáceres", "Cádiz", "Cantabria", "Castellón", "Ciudad Real", "Córdoba", "Cuenca",
		                   "Gerona", "Granada", "Guadalajara", "Guipúzcua", "Huelva", "Huesca", "Islas Baleares", "Jaén",
		                   "La CoruÃ±a", "La Rioja", "Las Palmas", "León", "Lérida", "Lugo", "Madrid", "Málaga", "Murcia",
		                   "Navarra", "Orense", "Palencia", "Pontevedra", "Salamanca", "Santa Cruz de Tenerife", "Segovia",
		                   "Sevilla", "Soria", "Tarragona", "Teruel", "Toledo", "Valencia", "Valladolid", "Vizcaya",
		                   "Zamora", "Zaragoza");
		    }
}
