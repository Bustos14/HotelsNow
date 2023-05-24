package com.edix.hotelsnow.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.edix.hotelsnow.entitybeans.Reserva;
import com.edix.hotelsnow.entitybeans.Usuario;

public interface ReservaRepository extends JpaRepository<Reserva, Integer>{
	@Query("SELECT r FROM Reserva r WHERE r.usuario = :usuario")
	List<Reserva> findReservasByUsuario(@Param("usuario") Usuario usuario);
	
}
