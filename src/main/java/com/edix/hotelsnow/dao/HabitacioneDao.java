package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.Habitacione;
import com.edix.hotelsnow.entitybeans.Hotele;

public interface HabitacioneDao {

	List<Habitacione> todasHabitaciones();
	Habitacione buscarUna(int idHabitacion);
	Habitacione altaHabitacione(Habitacione habitacion);
	boolean eliminarHabitacion(int idHabitacion);
	boolean modificarHabitacion(Habitacione habitacion);
	List<Habitacione> findByHotele_IdHotel(int idHotel);
	
}
