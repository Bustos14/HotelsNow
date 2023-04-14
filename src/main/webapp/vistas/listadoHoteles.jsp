<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Lista de Hoteles</title>
	<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

	<jsp:include page="navbar.jsp"></jsp:include>
	
	
	<div class="w-4/5 mx-auto">
	<c:if test="${not empty mensaje}">
	  <div id="alert" class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Atención!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	
	
<div class="container mx-auto mt-6 relative overflow-x-auto shadow-md sm:rounded-lg">
    <table class="w-full text-sm text-left text-blue-100 dark:text-blue-100">
        <thead class="text-xs text-white uppercase bg-blue-600 dark:text-white">
            <tr>
					<th scope="col" class="px-6 py-3">
						Nombre
					</th>
					<th scope="col" class="px-6 py-3">
						Dirección
					</th>
					<th scope="col" class="px-6 py-3">
						Ciudad
					</th>
					<th scope="col" class="px-6 py-3">
						Email
					</th>
					<th scope="col" class="px-6 py-3">
						Telefono
					</th>
					<th scope="col" class="px-6 py-3">
						Disponibilidad
					</th>
		</tr>
		<c:forEach var="hotel" items="${listaHoteles}">
			<tr class="bg-blue-500 border-b border-blue-400">
				<td class="px-6 py-4">${hotel.nombreHotel}</td>
				<td class="px-6 py-4">${hotel.direccionHotel}</td>
				<td class="px-6 py-4">${hotel.ciudadHotel}</td>
				<td class="px-6 py-4">${hotel.correoElectronicoHotel}</td>
				<td class="px-6 py-4">${hotel.telefonoHotel}</td>
				<td class="px-6 py-4">
					<c:if test="${hotel.disponible == 1}">
					   Disponible
					</c:if>
					<c:if test="${hotel.disponible == 0}">
					   No disponible
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
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
