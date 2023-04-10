package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.TarjetasBancaria;


public interface TarjetaBancariaDao {

	
	int nuevaTarjeta(TarjetasBancaria tarjeta);
	int modificarTarjeta(TarjetasBancaria tarjeta);
	int eliminarTarjeta(int idTarjeta);
	TarjetasBancaria buscarUna(int idTarjeta);
	List<TarjetasBancaria> todas();
	List<TarjetasBancaria> findByUsername(String username);
	
}
