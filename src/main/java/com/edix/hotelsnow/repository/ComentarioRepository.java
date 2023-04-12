package com.edix.hotelsnow.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.edix.hotelsnow.entitybeans.Comentario;

public interface ComentarioRepository extends JpaRepository<Comentario, Integer>{

	List<Comentario> findByHotele_IdHotel(int idHotel);
	List<Comentario> findByUsuario_Username(String username);
}
