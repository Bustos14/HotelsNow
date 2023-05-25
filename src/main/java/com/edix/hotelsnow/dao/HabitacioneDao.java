package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.Habitacione;
import com.edix.hotelsnow.entitybeans.Hotele;

public interface HabitacioneDao {

	/**
	 * Devuelve una lista de todas las habitaciones almacenadas en la base de datos.
	 *
	 * @return una lista de todas las habitaciones, o una lista vac�a si no hay habitaciones en la base de datos
	 */
	List<Habitacione> todasHabitaciones();

	/**
	 * Busca y devuelve una habitaci�n espec�fica de la base de datos.
	 *
	 * @param idHabitacion el ID de la habitaci�n a buscar
	 * @return la habitaci�n encontrada, o null si no se encuentra ninguna habitaci�n con ese ID
	 */
	Habitacione buscarUna(int idHabitacion);

	/**
	 * Crea una nueva habitaci�n y la agrega a la base de datos.
	 *
	 * @param habitacion la habitaci�n a crear y agregar
	 * @return la habitaci�n creada
	 */
	Habitacione altaHabitacione(Habitacione habitacion);

	/**
	 * Elimina una habitaci�n espec�fica de la base de datos.
	 *
	 * @param idHabitacion el ID de la habitaci�n a eliminar
	 * @return true si se elimin� la habitaci�n, o false si no se encontr� ninguna habitaci�n con ese ID
	 */
	boolean eliminarHabitacion(int idHabitacion);

	/**
	 * Modifica una habitaci�n existente en la base de datos.
	 *
	 * @param habitacion la habitaci�n modificada
	 * @return true si se actualiz� la habitaci�n correctamente, o false si no se encontr� ninguna habitaci�n con ese ID
	 */
	boolean modificarHabitacion(Habitacione habitacion);

	/**
	 * Busca y devuelve una lista de habitaciones relacionadas con un hotel espec�fico.
	 *
	 * @param idHotel el ID del hotel para buscar habitaciones relacionadas
	 * @return una lista de habitaciones relacionadas con el hotel, o una lista vaci� si no hay habitaciones relacionadas con ese hotel
	 */
	List<Habitacione> findByHotele_IdHotel(int idHotel);

	/**
	 * Busca y devuelve una lista de hoteles con habitaciones de un tipo espec�fico
	 *
	 * @param tipo es el tipo de la habitacion.
	 * @return  una lista de hoteles con habitaciones de un tipo espec�fico
	 */
	List<Hotele> findByHabTipo(String tipo);
	
}
