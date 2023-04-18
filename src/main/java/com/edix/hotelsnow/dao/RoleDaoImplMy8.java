package com.edix.hotelsnow.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edix.hotelsnow.entitybeans.Role;
import com.edix.hotelsnow.repository.RoleRepository;

@Repository
public class RoleDaoImplMy8 implements RoleDao{

	@Autowired
	private RoleRepository rrepo;
	
	@Override
	public Role findById(int idRol) {
		return rrepo.findById(idRol).orElse(null) ;
	}

}
