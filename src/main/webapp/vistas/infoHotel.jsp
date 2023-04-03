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
					Aquí puedes encontrar la información detallada del hotel.
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
							Dirección:
						</dt>
						<dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-1">
							<c:out value="${hotel.direccionHotel}" />
						</dd>
					</div>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
						<dt class="text-sm font-medium text-gray-500">
							Teléfono:
						</dt>
						<dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-1">
							<c:out value="${hotel.telefonoHotel}" />
						</dd>
					</div>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
						<dt class="text-sm font-medium text-gray-500">
							Correo Electrónico:
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
					<ul>
					 <c:forEach items="${listaHabs}" var="hab">
					 <li>${hab.tipoHabitacion} - ${hab.precioNoche}</li>
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