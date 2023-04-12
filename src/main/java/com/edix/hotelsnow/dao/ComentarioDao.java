package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.Comentario;

public interface ComentarioDao {

	Comentario crearComentario(Comentario comentario);
	Comentario buscarUno(int idComentario);
	List<Comentario> mostrarTodos();
	boolean eliminarComentairo(int idComentario);
	boolean modificarComentairo(Comentario comentario);
	List<Comentario> findByHotele_IdHotel(int idHotel);
	List<Comentario> findByUsuario_Username(String username);
}
