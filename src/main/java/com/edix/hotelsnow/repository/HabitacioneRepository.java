package com.edix.hotelsnow.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.edix.hotelsnow.entitybeans.Habitacione;
import com.edix.hotelsnow.entitybeans.Hotele;

public interface HabitacioneRepository extends JpaRepository<Habitacione, Integer>{

	List<Habitacione> findByHotele_IdHotel(int idHotel);

	 @Query("SELECT DISTINCT hab.hotele FROM Habitacione hab WHERE hab.tipoHabitacion LIKE %:tipo%")
	 List<Hotele> findAllHotelesConHabitacionesTipo(@Param("tipo") String tipo);
}
