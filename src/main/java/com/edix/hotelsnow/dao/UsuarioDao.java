package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.Usuario;

public interface UsuarioDao {
	boolean registro(Usuario usuario);
	Usuario buscarUsuario(String username);
	int modificarUsuario(Usuario usuario);
	List<Usuario> buscarPorRol(String nombreRol);
}
