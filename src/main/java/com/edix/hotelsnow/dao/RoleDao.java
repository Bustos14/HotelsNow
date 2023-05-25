package com.edix.hotelsnow.dao;

import com.edix.hotelsnow.entitybeans.Role;

public interface RoleDao {

	/**
	 * Busca y devuelve un objeto Role con el ID especificado.
	 *
	 * @param -> idRol el ID del objeto Role a buscar
	 * @return -> un objeto Role con el ID especificado, o null si no se encuentra ningún objeto Role con ese ID
	 */
	Role findById(int idRol);

}
