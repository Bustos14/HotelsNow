<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>
		Detalles del hotel
	</title>
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css"
	rel="stylesheet">
</head>
<body class="bg-gray-100">
	<jsp:include page="navbar.jsp"></jsp:include>
	
	<div class="w-4/5 mx-auto">
	
	<div class="container mx-auto mt-8 max-w-3xl">
	
		<div class="bg-white rounded-lg shadow overflow-hidden">
			<div class="px-4 py-5 sm:px-6">
				<h2 class="text-lg leading-6 font-medium text-gray-900">
					Detalles del hotel <span class="text-lg font-bold">${hotel.nombreHotel}</span>
				</h2>
				<p class="mt-1 max-w-2xl text-sm text-gray-500">
					Aqu� puedes encontrar la informaci�n detallada del hotel.
				</p>
			</div>
			<div class="border-t border-gray-200">
				<dl>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
						<img class="h-auto max-w-lg rounded-lg" src="/recursos/${hotel.img}" alt="image description">
					</div>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
						<dt class="text-sm font-medium text-gray-500">
							Nombre:
						</dt>
						<dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-1">
							<c:out value="${hotel.nombreHotel}" />
						</dd>
					</div>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
						<dt class="text-sm font-medium text-gray-500">
							Ciudad:
						</dt>
						<dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-1">
							<c:out value="${hotel.ciudadHotel}" />
						</dd>
					</div>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
						<dt class="text-sm font-medium text-gray-500">
							Direcci�n:
						</dt>
						<dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-1">
							<c:out value="${hotel.direccionHotel}" />
						</dd>
					</div>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
						<dt class="text-sm font-medium text-gray-500">
							Tel�fono:
						</dt>
						<dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-1">
							<c:out value="${hotel.telefonoHotel}" />
						</dd>
					</div>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
						<dt class="text-sm font-medium text-gray-500">
							Correo Electr�nico:
						</dt>
						<dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-1">
							<c:out value="${hotel.correoElectronicoHotel }" />
						</dd>
					</div>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
					    <dt class="text-sm leading-5 font-medium text-gray-500">
					    	Disponibilidad
					    </dt>
					    <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-1">
					        <span class="${hotel.disponible == 1 ? 'bg-green-200 text-green-800' : 'bg-red-200 text-red-800'} font-bold py-1 px-3 rounded-full">
					            ${hotel.disponible == 1 ? 'Disponible' : 'No disponible'}
					        </span>
					    </dd>
					</div>
					<form method="GET" action = "/habitacion/alta/${hotel.idHotel}">
					<button type="submit"
					 class="inline-flex items-center justify-center px-3 py-2 text-sm font-medium text-white bg-blue-700 rounded-lg hover:bg-blue-800 
					 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
					 Nueva habitaci�n 
			        <svg aria-hidden="true" class="w-4 h-4 ml-2 -mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
			           <path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>	
			       	</svg>
		    		</button>
					</form>
      			 		
					<ul>
					 <c:forEach items="${listaHabs}" var="hab">
						  <li>
						  <a href="/habitacion/info/${hab.idHabitacion}"> 
						  ${hab.nombreHabitacion}
						  ${hab.nombreHabitacion} - ${hab.tipoHabitacion} - ${hab.precioNoche} - 
						    <c:if test="${hab.disponible == 1}">
						     <span class="bg-green-200 text-green-800 font-bold py-1 px-3 rounded-full">
					            Disponible
					        </span>

						    </c:if>
						    <c:if test="${hab.disponible == 0}">
						     <span class="bg-red-200 text-red-800 font-bold py-1 px-3 rounded-full">
					          	No disponinble
					        </span>
						    </c:if>
						    </a>
						  </li>
					</c:forEach>
					
				</ul>
				</dl>
				
				</div>
				</div>
				</div>
				</div>
									
	
	

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
</body>
</html>