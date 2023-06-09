package com.edix.hotelsnow.entitybeans;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the habitaciones database table.
 * 
 */
@Entity
@Table(name="habitaciones")
@NamedQuery(name="Habitacione.findAll", query="SELECT h FROM Habitacione h")
public class Habitacione implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_habitacion")
	private int idHabitacion;
	
	@Column (name="nombre_habitacion")
	private String nombreHabitacion;
	
	public String getNombreHabitacion() {
		return nombreHabitacion;
	}

	public void setNombreHabitacion(String nombreHabitacion) {
		this.nombreHabitacion = nombreHabitacion;
	}
	@Column(name="precio_noche")
	private BigDecimal precioNoche;

	@Column(name="tipo_habitacion")
	private String tipoHabitacion;

	@Column(name="img")
    private String img;
	
	public byte getDisponible() {
		return disponible;
	}

	public void setDisponible(byte disponible) {
		this.disponible = disponible;
	}

	public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    @Column(name="disponible")
    private byte disponible;
	//uni-directional many-to-one association to Hotele
	@ManyToOne
	@JoinColumn(name="id_hotel")
	private Hotele hotele;

	public Habitacione() {
	}

	public int getIdHabitacion() {
		return this.idHabitacion;
	}

	public void setIdHabitacion(int idHabitacion) {
		this.idHabitacion = idHabitacion;
	}

	public BigDecimal getPrecioNoche() {
		return this.precioNoche;
	}

	public void setPrecioNoche(BigDecimal precioNoche) {
		this.precioNoche = precioNoche;
	}

	public String getTipoHabitacion() {
		return this.tipoHabitacion;
	}

	public void setTipoHabitacion(String tipoHabitacion) {
		this.tipoHabitacion = tipoHabitacion;
	}

	public Hotele getHotele() {
		return this.hotele;
	}

	public void setHotele(Hotele hotele) {
		this.hotele = hotele;
	}

}