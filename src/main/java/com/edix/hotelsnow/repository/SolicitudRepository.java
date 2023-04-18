package com.edix.hotelsnow.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.edix.hotelsnow.entitybeans.Hotele;
import com.edix.hotelsnow.entitybeans.SolicitudHotele;

public interface SolicitudRepository extends JpaRepository<SolicitudHotele, Integer>{
}
