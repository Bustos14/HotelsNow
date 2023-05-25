package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.Reserva;
import com.edix.hotelsnow.entitybeans.Usuario;

public interface ReservaDao {

	/**
	 * Devuelve una lista de todas las reservas almacenadas en la base de datos.
	 *
	 * @return una lista de todas las reservas, o una lista vac�a si no hay reservas en la base de datos
	 */
	List<Reserva> buscarTodas();

	/**
	 * Busca y devuelve una reserva espec�fica de la base de datos.
	 *
	 * @param idReserva el ID de la reserva a buscar
	 * @return la reserva encontrada, o null si no se encuentra ninguna reserva con ese ID
	 */
	Reserva buscarUna(int idReserva);

	/**
	 * Confirma una reserva existente en la base de datos.
	 *
	 * @param reserva la reserva a confirmar
	 * @return la reserva confirmada
	 */
	Reserva confirmarResera(Reserva reserva);

	/**
	 * Cancela una reserva espec�fica de la base de datos.
	 *
	 * @param idReserva el ID de la reserva a cancelar
	 * @return true si se cancel� la reserva, o false si no se encontr� ninguna reserva con ese ID
	 */
	boolean cancelarReserva(int idReserva);

	/**
	 * Busca y devuelve una lista de reservas realizadas por un usuario espec�fico.
	 *
	 * @param usuario el usuario para buscar reservas realizadas
	 * @return una lista de reservas realizadas por el usuario especificado, o una lista vac�a si el usuario no tiene reservas realizadas
	 */
	List<Reserva> buscarPorUsuario(Usuario usuario);

	
}
