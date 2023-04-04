package com.edix.hotelsnow.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edix.hotelsnow.entitybeans.Usuario;
import com.edix.hotelsnow.repository.UsuarioRepository;


@Repository
public class UsuarioDaoImplMy8 implements UsuarioDao{
	@Autowired
	UsuarioRepository urepo;
	
	
	@Override
	public boolean registro(Usuario usuario) {
		if(usuario!=null) {
			System.out.println("No es nulo");
		}
		Usuario u = urepo.findById(usuario.getUsername()).orElse(null);
		if (u == null) {
			System.out.println("Usuario registrado");
				urepo.save(usuario);
				return true;
		}
		return false;
	}
	
}
