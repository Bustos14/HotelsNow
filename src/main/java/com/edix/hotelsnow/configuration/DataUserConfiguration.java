  package com.edix.hotelsnow.configuration;
  
	import javax.sql.DataSource;

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.context.annotation.Bean;
	import org.springframework.context.annotation.Configuration;
	import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
	import org.springframework.security.config.annotation.web.builders.HttpSecurity;
	import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
	import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
	import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
	import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.firewall.StrictHttpFirewall;

	@EnableWebSecurity

	@Configuration
	public class DataUserConfiguration extends WebSecurityConfigurerAdapter {
		@Autowired
		private DataSource dataSource;
		@Autowired
		AuthenticationManagerBuilder auth;
		@Override
		protected void configure(AuthenticationManagerBuilder auth) throws Exception {
			auth.jdbcAuthentication().dataSource(dataSource)
			.usersByUsernameQuery("select username, contrasena, enabled from Usuarios where username=?")
			.authoritiesByUsernameQuery("select u.username, p.nombre from Usuario_Rol ur inner join Usuarios u on u.username = ur.username " +
			"inner join Roles p on p.id_rol = ur.id_rol " +  "where u.username = ?");
			}


	@Override protected void configure(HttpSecurity http) throws Exception {		
		http .csrf().disable() 
		.authorizeRequests() 
		// Los directorios est�ticos no requieren autenticacion 
		.antMatchers("/bootstrap/**", "/img/**", "/css/**", "js/**").permitAll()
		.antMatchers("/rest/demo-bcrypt/**").permitAll()
  
		// Las vistas p�blicas no requieren autenticación
		.antMatchers("/", "/login", "/registro","/search",
				//provisional para probar que funciona
				"/listadoHoteles","/test","/","/sobreNosotros", "/servicios", "/contacto",
				"/hotel/verUno/**", "/hotel/all","/hotel/alta","/hotel/eliminar/**","/hotel/info/**","/hotel/editar/**", 
				"/habitacion/all","/habitacion/info/**","/habitacion/alta/**","/habitacion/eliminar/**",
				"/comentario/all", "/comentario/alta/**","/comentario/alta", "/comentario/comentarios/**",
				"/recursos/**", "/reserva/reservar",
				"/usuario/perfil/**", "/usuario/modificarPerfil", "/usuario/listadoMisComentarios",
				"/tarjeta/editar/**","/tarjeta/editar",
				"/habitacion/editar/**", "/habitacion/editar","/comentario/verComentarios","/comentario/procederEliminar/**",
				"/reserva/verTodas",
				"/recursos/**")
		.permitAll()
		
	//  Las autorizaciones sobre urls para ROLES
		.antMatchers("/habitacion/alta/**").hasAnyAuthority("ROLE_ADMIN", "ROLE_SUPERADMIN")
		.antMatchers("/habitacion/eliminar/**").hasAnyAuthority("ROLE_ADMIN", "ROLE_SUPERADMIN")
		.antMatchers("/habitacion/editar/**").hasAnyAuthority("ROLE_ADMIN", "ROLE_SUPERADMIN")
  
	  // Todas las dem�s URLs de la Aplicaci�n requieren autenticaci�n
		 .anyRequest().authenticated()
		 .and().formLogin().loginPage("/login").defaultSuccessUrl("/").permitAll()  
		 .and().logout().permitAll();
	  
  }

		/**
		 * @return Contrase�a encriptada con BCrypt
		 */
		@Bean
		public PasswordEncoder passwordEncoder() {
			return new BCryptPasswordEncoder();
		}

		@Bean
		public HttpFirewall getHttpFirewall() {
		    return new DefaultHttpFirewall();
		}
		
	}
