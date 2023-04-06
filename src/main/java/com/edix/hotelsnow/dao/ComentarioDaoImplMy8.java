package com.edix.hotelsnow.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edix.hotelsnow.entitybeans.Comentario;
import com.edix.hotelsnow.repository.ComentarioRepository;

@Repository
public class ComentarioDaoImplMy8 implements ComentarioDao{
	
	@Autowired
	private ComentarioRepository crep;

	@Override
	public Comentario crearComentario(Comentario comentario) {
		if(buscarUno(comentario.getIdComentario())==null) {
			return crep.save(comentario);
		}
		return null;
	}

	@Override
	public Comentario buscarUno(int idComentario) {
		return crep.findById(idComentario).orElse(null);
	}

	@Override
	public List<Comentario> mostrarTodos() {
		return crep.findAll();
	}

	@Override
	public boolean eliminarComentairo(int idComentario) {
		Comentario c = buscarUno(idComentario);
		if(c != null) {
			crep.delete(c);
			return true;
		}
		return false;		
	}

	@Override
	public boolean modificarComentairo(Comentario comentario) {
		if(buscarUno(comentario.getIdComentario()) != null) {
			crep.save(comentario);
			return true;
		}
		return false;
	}

	@Override
	public List<Comentario> findByHotele_IdHotel(int idHotel) {
		if(crep.findByHotele_IdHotel(idHotel) != null) {
			return crep.findByHotele_IdHotel(idHotel);
		}
		return null;
	}

}
