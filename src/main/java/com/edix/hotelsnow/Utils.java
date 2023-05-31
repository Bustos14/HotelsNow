package com.edix.hotelsnow;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

@Repository
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
			    // Convierte la diferencia a años dividiéndola por el número de milisegundos en un año.
		        long edadEnAnios = edadEnMilisegundos / (365 * 24 * 60 * 60 * 1000L);
		        return edadEnAnios >= 18;
			}
			
			
			/**
			 * Listado de ciudades disponibles
			 *
			 * @return retorna un listado de ciudades
			 */
			 public List<String> getProvincias() {
		    	   return Arrays.asList("�lava", "Albacete", "Alicante", "Almer�a", "Asturias", "�vila", "Badajoz", "Barcelona",
		                   "Burgos", "C�ceres", "C�diz", "Cantabria", "Castell�n", "Ciudad Real", "C�rdoba", "Cuenca",
		                   "Gerona", "Granada", "Guadalajara", "Guip�zcua", "Huelva", "Huesca", "Islas Baleares", "Ja�n",
		                   "La Coruña", "La Rioja", "Las Palmas", "Le�n", "L�rida", "Lugo", "Madrid", "M�laga", "Murcia",
		                   "Navarra", "Orense", "Palencia", "Pontevedra", "Salamanca", "Santa Cruz de Tenerife", "Segovia",
		                   "Sevilla", "Soria", "Tarragona", "Teruel", "Toledo", "Valencia", "Valladolid", "Vizcaya",
		                   "Zamora", "Zaragoza");
		    }
}
