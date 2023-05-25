package com.edix.hotelsnow;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ImgConfig implements WebMvcConfigurer{

	/**
	 * Agrega manejadores de recursos personalizados al registro.
	 *
	 * Este método se utiliza para configurar manejadores de recursos en una aplicación Spring MVC.
	 * Agrega un manejador de recursos personalizado que mapea las solicitudes con el patrón de URL "/recursos/**"
	 * a la ubicación de recursos especificada en el sistema de archivos.
	 *
	 * @param registry el ResourceHandlerRegistry al cual se agregará el manejador de recursos personalizado
	 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/recursos/**").addResourceLocations("file:/C:/Hotel/recursos/");
	}

	
}
