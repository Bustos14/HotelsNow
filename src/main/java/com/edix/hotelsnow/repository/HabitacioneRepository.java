package com.edix.hotelsnow.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.edix.hotelsnow.entitybeans.Habitacione;
import com.edix.hotelsnow.entitybeans.Hotele;

public interface HabitacioneRepository extends JpaRepository<Habitacione, Integer>{

	List<Habitacione> findByHotele_IdHotel(int idHotel);

}
