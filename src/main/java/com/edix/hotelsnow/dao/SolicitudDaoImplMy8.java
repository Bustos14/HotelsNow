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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SolicitudHotele buscarUno(int idSolicitud) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SolicitudHotele altaSolicitud(SolicitudHotele solicitud) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean denegarSolicitud(int idSolicitud) {
		// TODO Auto-generated method stub
		return false;
	}
	

}
