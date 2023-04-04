package com.edix.hotelsnow.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.edix.hotelsnow.entitybeans.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, String>{
	
}
