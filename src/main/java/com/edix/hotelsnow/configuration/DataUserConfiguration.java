


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

	@EnableWebSecurity

	@Configuration
	public class DataUserConfiguration extends WebSecurityConfigurerAdapter {
		@Autowired
		private DataSource dataSource;

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
		// Los directorios estáticos no requieren autenticacion 
		.antMatchers("/bootstrap/**", "/img/**", "/css/**", "js/**").permitAll()
		.antMatchers("/rest/demo-bcrypt/**").permitAll()
  
		// Las vistas públicas no requieren autenticación
		.antMatchers("/", "/login", "/logout", "/registro","/search",
				//provisional para probar que funciona
				"/listadoHoteles","/test",
				"/hotel/verUno/**", "/hotel/all","/hotel/alta","/hotel/eliminar/**","/hotel/info/**",
				"/hotel/editar/**", "/recursos/**")
		.permitAll()
		
		//  Las autorizaciones sobre urls para ROLES
		//	.antMatchers("/eliminarProducto/**").hasAnyAuthority("ROLE_ADMIN")
  
	  // Todas las demás URLs de la Aplicación requieren autenticación
	  .anyRequest().authenticated()
	  .and().formLogin().loginPage("/login").permitAll()  
	  .and().logout().permitAll();
	  
  }

		/**
		 * @return Contraseña encriptada con BCrypt
		 */
		@Bean
		public PasswordEncoder passwordEncoder() {
			return new BCryptPasswordEncoder();
		}
		
	}
