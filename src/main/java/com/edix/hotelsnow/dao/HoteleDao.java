package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.Hotele;
import com.edix.hotelsnow.entitybeans.Usuario;

public interface HoteleDao {

	/**
	 * @return -> Devuelve la lista con todos los hoteles
	 */
	List<Hotele> mostrarTodos();
	
	Hotele buscarUno(int idHotel);
	
	/**
	 * @param disponible -> Es el parámetro que se desea buscar, pudiendo ser 0 -> no disponible; 1-> disponible
	 * @return -> Lista con los hoteles que coincidien con la disponibilidad, pasada por parámetro
	 */
	List<Hotele> findByDisponible(byte disponible);
	
	/**
	 * @param hotel -> hotel que se quiere crear, esta información viene del formulario -> JSP
	 * 
	 * @return -> Si se puede crear el hotel, devolvemos el hotel que hemos creado, por el contrario, devolvemos null
	 */
	Hotele altaHotel(Hotele hotel);
	
	/**
	 * @param idHotel -> Es el id que corresponde al hotel que se desea eliminar
	 * @return -> devuelve true si se ha podido eliminar el hotel, false si no ha sido posible eliminar
	 */
	boolean eliminarHotel(int idHotel);
	
	/**
	 * @param hotel -> Es el hotel que se desea modificar
	 * @return -> Devolvemos true si ha sido posible modificar el hotel, false en caso de no poder modificar
	 */
	boolean modificarHotel(Hotele hotel);
	
	/**
	 * @param ciudadHotel -> Es la ciudad en la que se desean buscar hoteles
	 * @return -> Devolvemos una lista con los hoteles que están en la  ciudad buscada
	 */
	List<Hotele> findByCiudadHotele(String ciudadHotel);
	/**
	 * @param admin -> El usuario administrador asociado al hotel
	 * @return -> Devolvemos una lista con los hoteles con ese propietario
	 */
	List<Hotele> buscarPorUsuario(Usuario usuario);
	
}
