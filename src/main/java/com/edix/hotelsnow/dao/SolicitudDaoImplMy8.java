package com.edix.hotelsnow.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edix.hotelsnow.entitybeans.Hotele;
import com.edix.hotelsnow.entitybeans.SolicitudHotele;
import com.edix.hotelsnow.repository.HoteleRepository;
import com.edix.hotelsnow.repository.SolicitudRepository;

@Repository
public class SolicitudDaoImplMy8 implements SolicitudDao{

	@Autowired
	private SolicitudRepository srepo;

	@Override
	public List<SolicitudHotele> mostrarTodas() {
		return srepo.findAll();
	}

	@Override
	public SolicitudHotele buscarUno(int idSolicitud) {
		return srepo.findById(idSolicitud).orElse(null);
	}

	@Override
	public SolicitudHotele altaSolicitud(SolicitudHotele solicitud) {
		if(buscarUno(solicitud.getIdHotelSolicitado())==null) {
			return srepo.save(solicitud);
		}
		return null;
	}

	@Override
	public boolean denegarSolicitud(int idSolicitud) {
		SolicitudHotele solicitud = buscarUno(idSolicitud);
		if(solicitud!=null) {
			srepo.delete(solicitud);
			return true;
		}
		return false;
	}
	

}
