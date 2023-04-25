package com.edix.hotelsnow.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edix.hotelsnow.entitybeans.Hotele;
import com.edix.hotelsnow.repository.HoteleRepository;

@Repository
public class HoteleDaoImplMy8 implements HoteleDao{

	@Autowired
	private HoteleRepository hrep;
	
	/**
	 * Esta implementación de mostrarTodos, nos devuelve una lista con todos los hoteles.
	 */
	@Override
	public List<Hotele> mostrarTodos() {
		return hrep.findAll();
	}

	
	
	/**
	 * Esta implementación de nuevoHotel, recorre la lista de los hoteles y si el correo electronico es igual a algun correo electronico de algun hotel de la bbdd, no lo crea, pero si no coincide
	 * 									  con ningun correo electronico, procedemos a crearlo, evitando tener duplicados en la bbdd.
	 * 										
	 * 									  La entity, tiene al correo electronico como unique = true, por lo que no debería crearlo, pero esto es un filtro previo.
	 */
	@Override
	public Hotele altaHotel(Hotele hotel) {
	    if (buscarUno(hotel.getIdHotel()) == null) {
	        // Si ya existe un hotel con el mismo correo electrónico, devolvemos null
	    	return hrep.save(hotel);
	    } else {
	        // Si no existe, guardamos el nuevo hotel en la base de datos
	        return null;
	    }
	}

	/**
	 * Esta implementación de findByDisponible, busca hoteles con la disponibilidad pasada por parámetro y si no encuentra ningun hotel, devuelve null
	 * 											en cambio, si encuentra, los metémos en una lista y la devolvemos.
	 */
	@Override
	public List<Hotele> findByDisponible(byte disponible) {
		if(hrep.findByDisponible(disponible) != null) {
			// Si la condicion no devuelve null, devolvemos la lista con los hoteles que tienen la propieda disponible que se haya buscado
			return hrep.findByDisponible(disponible);
		}
		// En caso de que la condición no se cumpla, devolvemos null
		return null;
	}



	/**
	 * Esta implementación de buscarUno, busca el hotel que coincida con el id pasado por parámetro,
	 * 										si no encuentra ninguno, devolvemos null.
	 */
	@Override
	public Hotele buscarUno(int idHotel) {
		return hrep.findById(idHotel).orElse(null);
	}



	/**
	 * Esta implementación de eliminarHotel, busca un hotel con el id que se pasa por parámetro y si lo enceuntra lo elimina
	 * 											en el caso de que no lo encuentre, devuelve false;
	 */
	@Override
	public boolean eliminarHotel(int idHotel) {
		Hotele h = hrep.findById(idHotel).orElse(null);
		if(h != null) {
			hrep.delete(h);
			return true;
		}
		return false;
	}



	/**
	 * Esta implementación de modificarHotel, busca un hotel que se pasa por parámetro, y si el id de ese hotel existe, lo midifica
	 * 											si no lo encuentra, no existe, asique devuelve false
	 */
	@Override
	public boolean modificarHotel(Hotele hotel) {
		if(buscarUno(hotel.getIdHotel())!=null) {
			hrep.save(hotel);
			return true;
		}
		return false;		
	}



	@Override
	public List<Hotele> findByCiudadHotele(String ciudadHotel) {
		if(hrep.findByCiudadHotel(ciudadHotel) != null) {
			// Si la condicion no devuelve null, devolvemos la lista con los hoteles que tienen la propieda ciudadHotel que se haya buscado
			return hrep.findByCiudadHotel(ciudadHotel);
		}
		// En caso de que la condición no se cumpla, devolvemos null
		return null;
	}


}
