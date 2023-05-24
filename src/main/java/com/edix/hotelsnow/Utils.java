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
			    // Convierte la diferencia a a√±os dividi√©ndola por el n√∫mero de milisegundos en un a√±o.
		        long edadEnAnios = edadEnMilisegundos / (365 * 24 * 60 * 60 * 1000L);
		        return edadEnAnios >= 18;
			}
			
			 public List<String> getProvincias() {
		    	   return Arrays.asList("¡lava", "Albacete", "Alicante", "AlmerÌa", "Asturias", "¡Åvila", "Badajoz", "Barcelona",
		                   "Burgos", "C·ceres", "C·diz", "Cantabria", "CastellÛn", "Ciudad Real", "CÛrdoba", "Cuenca",
		                   "Gerona", "Granada", "Guadalajara", "Guip˙zcua", "Huelva", "Huesca", "Islas Baleares", "JaÈn",
		                   "La Coru√±a", "La Rioja", "Las Palmas", "LeÛn", "LÈrida", "Lugo", "Madrid", "M·laga", "Murcia",
		                   "Navarra", "Orense", "Palencia", "Pontevedra", "Salamanca", "Santa Cruz de Tenerife", "Segovia",
		                   "Sevilla", "Soria", "Tarragona", "Teruel", "Toledo", "Valencia", "Valladolid", "Vizcaya",
		                   "Zamora", "Zaragoza");
		    }
}
