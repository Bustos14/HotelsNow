package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.SolicitudHotele;

public interface SolicitudDao {

	/**
	 * Devuelve una lista de todas las solicitudes de hoteles almacenadas en la base de datos.
	 *
	 * @return una lista de todas las solicitudes de hoteles, o una lista vacía si no hay solicitudes de hoteles en la base de datos
	 */
	List<SolicitudHotele> mostrarTodas();

	/**
	 * Busca y devuelve una solicitud de hotel especÃ­fica de la base de datos.
	 *
	 * @param idSolicitud el ID de la solicitud a buscar
	 * @return  la solicitud encontrada, o null si no se encuentra ninguna solicitud con ese ID
	 */
	SolicitudHotele buscarUno(int idSolicitud);

	/**
	 * Crea y almacena una nueva solicitud de hotel en la base de datos.
	 *
	 * @param solicitud la solicitud de hotel a crear y almacenar
	 * @return la solicitud de hotel creada y almacenada
	 */
	SolicitudHotele altaSolicitud(SolicitudHotele solicitud);

	/**
	 * Niega una solicitud de hotel específica de la base de datos.
	 *
	 * @param idSolicitud el ID de la solicitud a negar
	 * @return true si se negó la solicitud, o false si no se encontró ninguna solicitud con ese ID
	 */
	boolean denegarSolicitud(int idSolicitud);


}
