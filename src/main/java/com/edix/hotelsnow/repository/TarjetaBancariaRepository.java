package com.edix.hotelsnow.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.edix.hotelsnow.entitybeans.TarjetasBancaria;

public interface TarjetaBancariaRepository extends JpaRepository<TarjetasBancaria, Integer>{


	 List<TarjetasBancaria> findByUsuario_Username(String username);
}
