package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.SolicitudHotele;

public interface SolicitudDao {

	List<SolicitudHotele> mostrarTodas();
	
	SolicitudHotele buscarUno(int idSolicitud);

	SolicitudHotele altaSolicitud(SolicitudHotele solicitud);

	boolean denegarSolicitud(int idSolicitud);

}
