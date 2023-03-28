package com.edix.hotelsnow.entitybeans;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the reservas database table.
 * 
 */
@Entity
@Table(name="reservas")
@NamedQuery(name="Reserva.findAll", query="SELECT r FROM Reserva r")
public class Reserva implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_reserva")
	private int idReserva;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_llegada")
	private Date fechaLlegada;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_salida")
	private Date fechaSalida;

	@Column(name="numero_habitaciones")
	private int numeroHabitaciones;

	@Column(name="total_pagar")
	private BigDecimal totalPagar;

	//uni-directional many-to-one association to Hotele
	@ManyToOne
	@JoinColumn(name="id_hotel")
	private Hotele hotele;

	//uni-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;

	//uni-directional many-to-many association to Habitacione
	@ManyToMany
	@JoinTable(
		name="reservas_habitaciones"
		, joinColumns={
			@JoinColumn(name="id_reserva")
			}
		, inverseJoinColumns={
			@JoinColumn(name="id_habitacion")
			}
		)
	private List<Habitacione> habitaciones;

	public Reserva() {
	}

	public int getIdReserva() {
		return this.idReserva;
	}

	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
	}

	public Date getFechaLlegada() {
		return this.fechaLlegada;
	}

	public void setFechaLlegada(Date fechaLlegada) {
		this.fechaLlegada = fechaLlegada;
	}

	public Date getFechaSalida() {
		return this.fechaSalida;
	}

	public void setFechaSalida(Date fechaSalida) {
		this.fechaSalida = fechaSalida;
	}

	public int getNumeroHabitaciones() {
		return this.numeroHabitaciones;
	}

	public void setNumeroHabitaciones(int numeroHabitaciones) {
		this.numeroHabitaciones = numeroHabitaciones;
	}

	public BigDecimal getTotalPagar() {
		return this.totalPagar;
	}

	public void setTotalPagar(BigDecimal totalPagar) {
		this.totalPagar = totalPagar;
	}

	public Hotele getHotele() {
		return this.hotele;
	}

	public void setHotele(Hotele hotele) {
		this.hotele = hotele;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public List<Habitacione> getHabitaciones() {
		return this.habitaciones;
	}

	public void setHabitaciones(List<Habitacione> habitaciones) {
		this.habitaciones = habitaciones;
	}

}