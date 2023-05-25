package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.Usuario;

public interface UsuarioDao {
	
	/**
	 * Registra un nuevo usuario en la base de datos.
	 *
	 * @param  usuario el usuario a registrar
	 * @return  true si el registro fue exitoso, false si no fue exitoso (por ejemplo, si el nombre de usuario ya est� en uso)
	 */
	boolean registro(Usuario usuario);

	/**
	 * Busca y devuelve un usuario espec�fico de la base de datos con el username de usuario especificado.
	 *
	 * @param  username el nombre de usuario del usuario a buscar
	 * @return  el usuario encontrado, o null si no se encuentra ning�n usuario con ese nombre de usuario
	 */
	Usuario buscarUsuario(String username);

	/**
	 * Modifica un usuario existente en la base de datos.
	 *
	 * @param  usuario el usuario a modificar y actualizar
	 * @return  el n�mero de filas afectadas por la operaci�n de actualizaci�n (debe ser 1 si la actualizaci�n fue exitosa)
	 */
	int modificarUsuario(Usuario usuario);

	/**
	 * Devuelve una lista de todos los usuarios en la base de datos con el rol especificado.
	 *
	 * @param  nombreRol el nombre del rol de los usuarios a buscar
	 * @return  una lista de todos los usuarios con el rol especificado, o una lista vac�a si no se encuentran usuarios con ese rol
	 */
	List<Usuario> buscarPorRol(String nombreRol);

	/**
	 * Elimina un usuario de la base de datos con el nombre de usuario especificado.
	 *
	 * @param  username el nombre de usuario del usuario a eliminar
	 * @return  true si la eliminaci�n fue exitosa, false si no fue exitosa (por ejemplo, si no se encontr� ning�n usuario con ese nombre de usuario)
	 */
	boolean eliminarUsuario(String username);

}
