package com.edix.hotelsnow.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.edix.hotelsnow.entitybeans.Hotele;
import com.edix.hotelsnow.entitybeans.Usuario;

public interface HoteleRepository extends JpaRepository<Hotele, Integer>{

	
	 @Query("SELECT h FROM Hotele h WHERE h.usuario.username = :username")
	 List<Hotele> findAllByUsuarioUsername(@Param("username") String username);
	/**
	 * @param correoElectronicoHotel -> buscamos por el correo electronico
	 * @return -> Devuelve el hotel que conicide con el correoelectronico que le hemos pasado por parámetro
	 */
	Hotele findByCorreoElectronicoHotel(String correoElectronicoHotel);
	
	/**
	 * @param ciudadHotel -> buscamos hoteles por la  ciudad pasada por parámetro
	 * @return -> Devuelve una lista con los hoteles que coinciden con la ciudad pasada por parámetro
	 */
	List<Hotele> findByCiudadHotel(String ciudadHotel);
	
	
    /**
     * @param disponible -> pasamos por parámetro un estado, 0 para no disponible, 1 para disponible
     * @return -> Devolvemos una lista con los hoteles que tienen la disponibilidad que se busca,
     * 				ya sea disponible o no disponible.
     */
    List<Hotele> findByDisponible(byte disponible);
    
    
   
	
}
