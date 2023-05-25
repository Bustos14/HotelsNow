package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.Comentario;

public interface ComentarioDao {

	/**
	 * Crea un nuevo comentario y lo agrega a la base de datos.
	 *
	 * @param comentario el comentario a crear y agregar
	 * @return el comentario creado
	 */
	Comentario crearComentario(Comentario comentario);

	/**
	 * Busca y devuelve un comentario específico de la base de datos.
	 *
	 * @param idComentario el ID del comentario a buscar
	 * @return el comentario encontrado, o null si no se encuentra ningún comentario con ese ID
	 */
	Comentario buscarUno(int idComentario);

	/**
	 * Devuelve una lista de todos los comentarios almacenados en la base de datos.
	 *
	 * @return  una lista de comentarios, o una lista vacía si no hay comentarios en la base de datos
	 */
	List<Comentario> mostrarTodos();

	/**
	 * Elimina un comentario específico de la base de datos.
	 *
	 * @param idComentario el ID del comentario a eliminar
	 * @return true si se elimina el comentario, o false si no se encontró ningún comentario con ese ID
	 */
	boolean eliminarComentairo(int idComentario);

	/**
	 * Modifica un comentario existente en la base de datos.
	 *
	 * @param comentario el comentario modificado
	 * @return true si se actualizó el comentario correctamente, o false si no se encontró ningún comentario con ese ID
	 */
	boolean modificarComentairo(Comentario comentario);

	/**
	 * Busca y devuelve una lista de comentarios relacionados con un hotel específico.
	 *
	 * @param idHotel el ID del hotel para buscar comentarios relacionados
	 * @return una lista de comentarios relacionados con el hotel, o una lista vacía si no hay comentarios relacionados con ese hotel
	 */
	List<Comentario> findByHotele_IdHotel(int idHotel);

	/**
	 * Busca y devuelve una lista de comentarios publicados por un usuario específico.
	 *
	 * @param username el nombre de usuario del usuario para buscar comentarios publicados
	 * @return una lista de comentarios publicados por el usuario, o una lista vacía si el usuario no ha publicado comentarios
	 */
	List<Comentario> findByUsuario_Username(String username);

}
