package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.Hotele;
import com.edix.hotelsnow.entitybeans.Usuario;

public interface HoteleDao {

	/**
	 * Devuelve una lista de todos los hoteles almacenados en la base de datos.
	 *
	 * @return una lista de todos los hoteles, o una lista vac�a si no hay hoteles en la base de datos
	 */
	List<Hotele> mostrarTodos();

	/**
	 * Busca y devuelve un hotel espec�fico de la base de datos.
	 *
	 * @param idHotel el ID del hotel a buscar
	 * @return el hotel encontrado, o null si no se encuentra ning�n hotel con ese ID
	 */
	Hotele buscarUno(int idHotel);

	/**
	 * Busca y devuelve una lista de hoteles que tengan la disponibilidad especificada.
	 *
	 * @param disponible el estado de disponibilidad para buscar
	 * @return una lista de hoteles que tengan la disponibilidad especificada, o una lista vacía si no hay hoteles con esa disponibilidad
	 */
	List<Hotele> findByDisponible(byte disponible);

	/**
	 * Crea un nuevo hotel y lo agrega a la base de datos.
	 *
	 * @param hotel el hotel a crear y agregar
	 * @return el hotel creado
	 */
	Hotele altaHotel(Hotele hotel);

	/**
	 * Elimina un hotel espec�fico de la base de datos.
	 *
	 * @param idHotel el ID del hotel a eliminar
	 * @return true si se elimin� el hotel, o false si no se encontr� ning�n hotel con ese ID
	 */
	boolean eliminarHotel(int idHotel);

	/**
	 * Modifica un hotel existente en la base de datos.
	 *
	 * @param hotel el hotel modificado
	 * @return true si se actualiz� el hotel correctamente, o false si no se encontr� ning�n hotel con ese ID
	 */
	boolean modificarHotel(Hotele hotel);

	/**
	 * Busca y devuelve una lista de hoteles que se encuentren en una ciudad espec�fica.
	 *
	 * @param ciudadHotel la ciudad para buscar hoteles
	 * @return una lista de hoteles en la ciudad especificada, o una lista vac�a si no hay hoteles en esa ciudad
	 */
	List<Hotele> findByCiudadHotele(String ciudadHotel);
	/**
	 * Busca y devuelve una lista de hoteles por un nombre especifico.
	 *
	 * @param nombreHotele la ciudad para buscar hoteles
	 * @return una lista de hoteles en la ciudad especificada, o una lista vac�a si no hay hoteles en esa ciudad
	 */
	List<Hotele> findByNombreHotele(String nombreHotele);


	/**
	 * Busca y devuelve una lista de hoteles propiedad de un usuario espec�fico.
	 *
	 * @param usuario el usuario para buscar hoteles propiedad
	 * @return una lista de hoteles propiedad del usuario especificado, o una lista vac�a si el usuario no tiene hoteles propiedad
	 */
	List<Hotele> buscarPorUsuario(Usuario usuario);

	
}
