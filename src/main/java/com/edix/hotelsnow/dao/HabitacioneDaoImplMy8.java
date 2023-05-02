package com.edix.hotelsnow.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edix.hotelsnow.entitybeans.Habitacione;
import com.edix.hotelsnow.entitybeans.Hotele;
import com.edix.hotelsnow.repository.HabitacioneRepository;

@Repository
public class HabitacioneDaoImplMy8 implements HabitacioneDao{

	@Autowired
	private HabitacioneRepository hrep;
	
	@Override
	public List<Habitacione> todasHabitaciones() {
		return hrep.findAll();
	}

	@Override
	public Habitacione buscarUna(int idHabitacion) {
		return hrep.findById(idHabitacion).orElse(null);
	}

	@Override
	public Habitacione altaHabitacione(Habitacione habitacion) {
		return hrep.save(habitacion);
	}

	@Override
	public boolean eliminarHabitacion(int idHabitacion) {
		Habitacione h = buscarUna(idHabitacion);
		if(h != null) {
			hrep.delete(h);
			return true;
		} 
			return false;
	}

	@Override
	public boolean modificarHabitacion(Habitacione habitacion) {
		if(buscarUna(habitacion.getIdHabitacion()) !=null) {
			hrep.save(habitacion);
			return true;
		}
		return false;
	}

	@Override
	public List<Habitacione> findByHotele_IdHotel(int idHotel) {
		if(hrep.findByHotele_IdHotel(idHotel) != null) {
			return hrep.findByHotele_IdHotel(idHotel);
		}
		return null;
	}

	@Override
	public List<Hotele> findByHabTipo(String tipo) {
		return hrep.findAllHotelesConHabitacionesTipo(tipo);
	}

}
