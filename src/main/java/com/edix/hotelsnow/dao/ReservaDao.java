package com.edix.hotelsnow.dao;

import java.util.List;

import com.edix.hotelsnow.entitybeans.Reserva;
import com.edix.hotelsnow.entitybeans.Usuario;

public interface ReservaDao {

	List<Reserva> buscarTodas();
	Reserva buscarUna (int IdReserva);
	Reserva confirmarResera(Reserva reserva);
	boolean cancelarReserva(int idReserva);
	Reserva buscarPorUsuario (Usuario usuario);
	
}
