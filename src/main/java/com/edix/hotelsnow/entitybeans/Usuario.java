package com.edix.hotelsnow.entitybeans;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the usuarios database table.
 * 
 */
@Entity
@Table(name="usuarios")
@NamedQuery(name="Usuario.findAll", query="SELECT u FROM Usuario u")
public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_usuario")
	private int idUsuario;

	private String apellidos;

	private String contrasena;

	private String email;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_nacimiento")
	private Date fechaNacimiento;

	private String nombre;

	//uni-directional many-to-one association to Role
	@ManyToOne
	@JoinColumn(name="id_rol")
	private Role role;

	//uni-directional many-to-many association to TarjetasBancaria
	@ManyToMany
	@JoinTable(
		name="usuarios_tarjetas_bancarias"
		, joinColumns={
			@JoinColumn(name="id_usuario")
			}
		, inverseJoinColumns={
			@JoinColumn(name="id_tarjeta_bancaria")
			}
		)
	private List<TarjetasBancaria> tarjetasBancarias;

	public Usuario() {
	}

	public int getIdUsuario() {
		return this.idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getApellidos() {
		return this.apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getContrasena() {
		return this.contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getFechaNacimiento() {
		return this.fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<TarjetasBancaria> getTarjetasBancarias() {
		return this.tarjetasBancarias;
	}

	public void setTarjetasBancarias(List<TarjetasBancaria> tarjetasBancarias) {
		this.tarjetasBancarias = tarjetasBancarias;
	}

}