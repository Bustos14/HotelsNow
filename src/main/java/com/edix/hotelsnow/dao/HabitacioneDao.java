package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.Habitacione;
import com.edix.hotelsnow.entitybeans.Hotele;

public interface HabitacioneDao {

	/**
	 * Devuelve una lista de todas las habitaciones almacenadas en la base de datos.
	 *
	 * @return -> una lista de todas las habitaciones, o una lista vacía si no hay habitaciones en la base de datos
	 */
	List<Habitacione> todasHabitaciones();

	/**
	 * Busca y devuelve una habitación específica de la base de datos.
	 *
	 * @param -> idHabitacion el ID de la habitación a buscar
	 * @return -> la habitación encontrada, o null si no se encuentra ninguna habitación con ese ID
	 */
	Habitacione buscarUna(int idHabitacion);

	/**
	 * Crea una nueva habitación y la agrega a la base de datos.
	 *
	 * @param -> habitacion la habitación a crear y agregar
	 * @return -> la habitación creada
	 */
	Habitacione altaHabitacione(Habitacione habitacion);

	/**
	 * Elimina una habitación específica de la base de datos.
	 *
	 * @param -> idHabitacion el ID de la habitación a eliminar
	 * @return -> true si se eliminó la habitación, o false si no se encontró ninguna habitación con ese ID
	 */
	boolean eliminarHabitacion(int idHabitacion);

	/**
	 * Modifica una habitación existente en la base de datos.
	 *
	 * @param -> habitacion la habitación modificada
	 * @return -> true si se actualizó la habitación correctamente, o false si no se encontró ninguna habitación con ese ID
	 */
	boolean modificarHabitacion(Habitacione habitacion);

	/**
	 * Busca y devuelve una lista de habitaciones relacionadas con un hotel específico.
	 *
	 * @param -> idHotel el ID del hotel para buscar habitaciones relacionadas
	 * @return -> una lista de habitaciones relacionadas con el hotel, o una lista vacía si no hay habitaciones relacionadas con ese hotel
	 */
	List<Habitacione> findByHotele_IdHotel(int idHotel);

	
}
