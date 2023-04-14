<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Detalles del hotel ${hotel.nombreHotel}</title>
	
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	
	<div class="w-4/5 mx-auto">
	<c:if test="${not empty mensaje}">
	  <div id="alert" class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Atención!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	
<!--  Apartid de aquí -->	

<div class="w-4/5 mx-auto">
    <div class="container mx-auto mt-8 max-w-3xl" >
        <div class="bg-white rounded-lg shadow overflow-hidden">
            <div class="px-4 py-5 sm:px-6">
                <h2 class="text-lg leading-6 font-medium text-gray-900">
                    Detalles de la habitación <span class="text-lg font-bold">${habitacion.nombreHabitacion}</span>
                </h2>
                <p class="mt-1 max-w-2xl text-sm text-gray-500">
                    Aquí puedes modificar la información detallada de la habitación
                </p>
            </div>
            <div class="border-t border-gray-200">
                <form method="POST" action="/habitacion/editar" enctype="multipart/form-data">
                    <input type="hidden" name="idHotel" value="${habitacion.hotele.idHotel}">
                        <figure class="max-w-lg">
				  			<img class="h-auto max-w-full rounded-lg" src="/recursos/${habitacion.img}" alt="image description" value="/recursos/${habitacion.img }">
				  			<figcaption class="mt-2 text-sm text-center text-gray-500 dark:text-gray-400">Imagen anterior</figcaption>
						</figure>	
                    <div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
                        <div class="mt-1 sm:mt-0 sm:col-span-1">
                            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white" for="img">Nueva imagen</label>
							<input class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" name="file" id="img" type="file">
                        </div>
                    </div>
                    <div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
                        <label for="nombre" class="block text-sm font-medium text-gray-700">
                            Nombre
                        </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-1">
                            <input type="text" name="nombreHotel" id="nombre" value="${habitacion.nombreHabitacion}" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
                        </div>
                    </div> 
                    <div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
                        <label for="tipoHabitacion" class="block text-sm font-medium text-gray-700">
                            Tipo de habitación
                        </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-1">
                            <input type="text" name="tipoHabitacion" id="tipoHabitacion" value="${habitacion.tipoHabitacion}" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
                        </div>
                    </div>
                    
                    
                    <div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
                        <label for="precioNoche" class="block text-sm font-medium text-gray-700">
                            Precio por noche
                        </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-1">
                            <input type="text" name="precioNoche" id="precioNoche" value="${habitacion.precioNoche}" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
                        </div>
                    </div>
                    
                    
                    <div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
                        <label for="disponible" class="block text-sm font-medium text-gray-700">
                            Disponibilidad
                        </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-1">
						    <select name="disponible" id="disponible" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
						        <option value="1" ${hotel.disponible == 1 ? 'selected' : ''}>Disponible</option>
						        <option value="0" ${hotel.disponible == 0 ? 'selected' : ''}>No disponible</option>
						    </select>
						</div>
                    </div>
                    <div class="mt-2 flex justify-center space-x-2 mb-4">
                        <button type="submit" class="inline-flex items-center justify-center px-3 py-2 text-sm font-medium text-white bg-green-700 rounded-lg hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                            Guardar cambios
                        </button>
                    </div>
                </form>
                <dl>
                    <!-- Resto del código para mostrar detalles del hotel -->
                </dl>
            </div>
        </div>
    </div>
</div>




<!-- No borrar </div> -->
	</div>
	
	<script>
  // Obtener el elemento del alert
  const alert = document.getElementById('alert');

  // Ocultar el alert después de 3 segundos (3000 ms)
  setTimeout(function() {
    alert.style.display = 'none';
  }, 3000);
  
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
</body>
</html>