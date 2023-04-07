package com.edix.hotelsnow.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.edix.hotelsnow.entitybeans.Reserva;
import com.edix.hotelsnow.entitybeans.Usuario;

@Repository
public class ReservaDaoImplMy8 implements ReservaDao{

	@Override
	public List<Reserva> buscarTodas() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reserva buscarUna(int IdReserva) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reserva confirmarResera(Reserva reserva) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean cancelarReserva(int idReserva) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Reserva buscarPorUsuario(Usuario usuario) {
		// TODO Auto-generated method stub
		return null;
	}

}
