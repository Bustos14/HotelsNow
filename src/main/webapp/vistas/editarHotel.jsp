<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Detalles del hotel ${hotel.nombreHotel}</title>
	
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>

	<br />
	<br />
	<br />
	<br />
	<div class="w-4/5 mx-auto">
	<c:if test="${not empty mensaje}">
	  <div class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Atención!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	
<!--  Apartid de aquí -->	

<div class="w-4/5 mx-auto">
    <div class="container mx-auto mt-8 max-w-3xl">
        <div class="bg-white rounded-lg shadow overflow-hidden">
            <div class="px-4 py-5 sm:px-6">
                <h2 class="text-lg leading-6 font-medium text-gray-900">
                    Detalles del hotel <span class="text-lg font-bold">${hotel.nombreHotel}</span>
                </h2>
                <p class="mt-1 max-w-2xl text-sm text-gray-500">
                    Aquí puedes modificar la información detallada del hotel.
                </p>
            </div>
            <div class="border-t border-gray-200">
                <form method="POST" action="/hotel/editar">
                    <input type="hidden" name="idHotel" value="${hotel.idHotel}">
                    <div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
                        <label for="nombre" class="block text-sm font-medium text-gray-700">
                            Nombre
                        </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-1">
                            <input type="text" name="nombreHotel" id="nombre" value="${hotel.nombreHotel}" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
                        </div>
                    </div>
                    
                    
                    <div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
                        <label for="ciudadHotel" class="block text-sm font-medium text-gray-700">
                            Ciudad del hotel
                        </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-1">
                            <input type="text" name="ciudadHotel" id="ciudadHotel" value="${hotel.ciudadHotel}" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
                        </div>
                    </div>
                    
                    
                    <div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
                        <label for="correoElectronicoHotel" class="block text-sm font-medium text-gray-700">
                            Correo electronico del hotel
                        </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-1">
                            <input type="text" name="correoElectronicoHotel" id="correoElectronicoHotel" value="${hotel.correoElectronicoHotel}" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
                        </div>
                    </div>
                    
                    
                    <div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
                        <label for="direccionHotel" class="block text-sm font-medium text-gray-700">
                            Dirección del hotel
                        </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-1">
                            <input type="text" name="direccionHotel" id="direccionHotel" value="${hotel.direccionHotel}" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
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
                    
                    
                    <div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
                        <label for="telefonoHotel" class="block text-sm font-medium text-gray-700">
                            Telefono del hotel
                        </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-1">
                            <input type="text" name="telefonoHotel" id="telefonoHotel" value="${hotel.telefonoHotel}" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
</body>
</html>