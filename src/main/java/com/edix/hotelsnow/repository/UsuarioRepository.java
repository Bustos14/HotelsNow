package com.edix.hotelsnow.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.edix.hotelsnow.entitybeans.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, String>{
	
	@Query("SELECT u FROM Usuario u JOIN u.roles r WHERE r.nombre = ?1")
	List<Usuario> findByRol(String nombreRol);
}
