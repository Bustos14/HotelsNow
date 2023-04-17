package com.edix.hotelsnow.entitybeans;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the solicitud_hoteles database table.
 * 
 */
@Entity
@Table(name="solicitud_hoteles")
@NamedQuery(name="SolicitudHotele.findAll", query="SELECT s FROM SolicitudHotele s")
public class SolicitudHotele implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_hotel_solicitado")
	private int idHotelSolicitado;

	@Column(name="ciudad_hotel")
	private String ciudadHotel;

	@Column(name="correo_electronico_hotel")
	private String correoElectronicoHotel;

	@Column(name="direccion_hotel")
	private String direccionHotel;

	@Column(name="nombre_hotel")
	private String nombreHotel;

	@Column(name="telefono_hotel")
	private String telefonoHotel;

	//uni-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="username")
	private Usuario usuario;

	public SolicitudHotele() {
	}

	public int getIdHotelSolicitado() {
		return this.idHotelSolicitado;
	}

	public void setIdHotelSolicitado(int idHotelSolicitado) {
		this.idHotelSolicitado = idHotelSolicitado;
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

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}