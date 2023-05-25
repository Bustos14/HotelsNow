package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.TarjetasBancaria;


public interface TarjetaBancariaDao {

	
	/**
	 * Crea y almacena una nueva tarjeta bancaria en la base de datos.
	 *
	 * @param tarjeta la tarjeta bancaria a crear y almacenar
	 * @return El ID de la nueva tarjeta bancaria creada y almacenada
	 */
	int nuevaTarjeta(TarjetasBancaria tarjeta);

	/**
	 * Modifica una tarjeta bancaria existente en la base de datos.
	 *
	 * @param tarjeta la tarjeta bancaria a modificar y actualizar
	 * @return El número de filas afectadas por la operación de actualización (debe ser 1 si la actualización fue exitosa)
	 */
	int modificarTarjeta(TarjetasBancaria tarjeta);

	/**
	 * Elimina una tarjeta bancaria de la base de datos con el ID especificado.
	 *
	 * @param idTarjeta el ID de la tarjeta bancaria a eliminar
	 * @return el número de filas afectadas por la operación de eliminación (debe ser 1 si la eliminación fue exitosa)
	 */
	int eliminarTarjeta(int idTarjeta);

	/**
	 * Busca y devuelve una tarjeta bancaria especÃ­fica de la base de datos con el ID especificado.
	 *
	 * @param idTarjeta el ID de la tarjeta bancaria a buscar
	 * @return la tarjeta bancaria encontrada, o null si no se encuentra ninguna tarjeta bancaria con ese ID
	 */
	TarjetasBancaria buscarUna(int idTarjeta);

	/**
	 * Devuelve una lista de todas las tarjetas bancarias almacenadas en la base de datos.
	 *
	 * @return una lista de todas las tarjetas bancarias, o una lista vacía si no hay tarjetas bancarias en la base de datos
	 */
	List<TarjetasBancaria> todas();

	/**
	 * Devuelve una lista de todas las tarjetas bancarias asociadas con el nombre de usuario especificado.
	 *
	 * @param username el nombre de usuario asociado con las tarjetas bancarias a buscar
	 * @return una lista de todas las tarjetas bancarias asociadas con el nombre de usuario especificado, o una lista vacía si no se encuentra ninguna tarjeta bancaria con ese nombre de usuario
	 */
	List<TarjetasBancaria> findByUsername(String username);

	
}
