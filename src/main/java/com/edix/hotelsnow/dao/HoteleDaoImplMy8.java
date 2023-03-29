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
	
	@Override
	public List<Hotele> mostrarTodos() {
		return hrep.findAll();
	}

}
