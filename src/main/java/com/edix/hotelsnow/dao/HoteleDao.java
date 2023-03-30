package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.Hotele;

public interface HoteleDao {

	/**
	 * @return listado de todos los hoteles
	 */
	List<Hotele> mostrarTodos();
}
