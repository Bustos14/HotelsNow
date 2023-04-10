package com.edix.hotelsnow.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edix.hotelsnow.entitybeans.Reserva;
import com.edix.hotelsnow.entitybeans.Usuario;
import com.edix.hotelsnow.repository.ReservaRepository;

@Repository
public class ReservaDaoImplMy8 implements ReservaDao{

	@Autowired
	ReservaRepository rrepo;
	
	@Override
	public List<Reserva> buscarTodas() {
		return rrepo.findAll();
	}

	@Override
	public Reserva buscarUna(int IdReserva) {
		Reserva r = rrepo.findById(IdReserva).orElse(null);
		return r;
	}

	@Override
	public Reserva confirmarResera(Reserva reserva) {
		return null;
	}

	@Override
	public boolean cancelarReserva(int idReserva) {
		Reserva r = buscarUna(idReserva);
		if(r!=null) {
			rrepo.delete(r);
			return true;
		}
		return false;
	}

	@Override
	public List<Reserva> buscarPorUsuario(Usuario usuario) {
		return rrepo.findReservasByUsuario(usuario);
	}


}
