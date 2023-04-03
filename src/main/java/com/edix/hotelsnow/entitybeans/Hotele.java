package com.edix.hotelsnow.entitybeans;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the hoteles database table.
 * 
 */
@Entity
@Table(name="hoteles")
@NamedQuery(name="Hotele.findAll", query="SELECT h FROM Hotele h")
public class Hotele implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_hotel")
	private int idHotel;

	@Column(name="ciudad_hotel")
	private String ciudadHotel;

	// Le añado la claúsula unique = true, para evitar duplicados
	@Column(name="correo_electronico_hotel", unique = true)
	private String correoElectronicoHotel;

	@Column(name="direccion_hotel")
	private String direccionHotel;

	private byte disponible;

	@Column(name="nombre_hotel")
	private String nombreHotel;
	@Column (name="img")
	private String img;

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Column(name="telefono_hotel")
	private String telefonoHotel;

	public Hotele() {
	}

	public int getIdHotel() {
		return this.idHotel;
	}

	public void setIdHotel(int idHotel) {
		this.idHotel = idHotel;
	}

	public String getCiudadHotel() {
		return this.ciudadHotel;
	}

	public void setCiudadHotel(String ciudadHotel) {
		this.ciudadHotel = ciudadHotel;
	}

	public String getCorreoElectronicoHotel() {
		return this.correoElectronicoHotel;
	}

	public void setCorreoElectronicoHotel(String correoElectronicoHotel) {
		this.correoElectronicoHotel = correoElectronicoHotel;
	}

	public String getDireccionHotel() {
		return this.direccionHotel;
	}

	public void setDireccionHotel(String direccionHotel) {
		this.direccionHotel = direccionHotel;
	}

	public byte getDisponible() {
		return this.disponible;
	}

	public void setDisponible(byte disponible) {
		this.disponible = disponible;
	}

	public String getNombreHotel() {
		return this.nombreHotel;
	}

	public void setNombreHotel(String nombreHotel) {
		this.nombreHotel = nombreHotel;
	}

	public String getTelefonoHotel() {
		return this.telefonoHotel;
	}

	public void setTelefonoHotel(String telefonoHotel) {
		this.telefonoHotel = telefonoHotel;
	}

}