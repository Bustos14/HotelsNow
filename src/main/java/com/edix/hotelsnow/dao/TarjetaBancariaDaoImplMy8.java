package com.edix.hotelsnow.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edix.hotelsnow.entitybeans.TarjetasBancaria;
import com.edix.hotelsnow.repository.TarjetaBancariaRepository;


@Repository
public class TarjetaBancariaDaoImplMy8 implements TarjetaBancariaDao{
	@Autowired
	private TarjetaBancariaRepository trepo;
	
	@Override
	public int nuevaTarjeta(TarjetasBancaria tarjeta) {
		int filas = 0;
		try {
			trepo.save(tarjeta);
			filas = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filas;
	}

	@Override
	public int modificarTarjeta(TarjetasBancaria tarjeta) {
		int filas = 0;
		TarjetasBancaria mod = null;
		try {
			mod = trepo.getOne(tarjeta.getIdTarjetaBancaria());
			mod = tarjeta;
			trepo.save(mod);
			filas = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filas;
	}

	@Override
	public int eliminarTarjeta(int idTarjeta) {

		TarjetasBancaria t = trepo.findById(idTarjeta).orElse(null);
		
		if(t != null) {
			trepo.delete(t);
			return 1;
		}
		
		return 0;
	}

	@Override
	public TarjetasBancaria buscarUna(int idTarjeta) {
		return trepo.findById(idTarjeta).orElse(null);
	}

	@Override
	public List<TarjetasBancaria> todas() {
		return trepo.findAll();
	}

	@Override
	public List<TarjetasBancaria> findByUsername(String username) {
		return trepo.findByUsuario_Username(username);
	}
}
