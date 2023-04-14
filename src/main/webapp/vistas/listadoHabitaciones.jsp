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

	</title>
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


<div class="container mx-auto mt-6 relative overflow-x-auto shadow-md sm:rounded-lg">
    <table class="w-full text-sm text-left text-blue-100 dark:text-blue-100">
        <thead class="text-xs text-white uppercase bg-blue-600 dark:text-white">
            <tr>
				<th scope="col" class="px-6 py-3">
					ID de habitación
				</th>
				<th scope="col" class="px-6 py-3">
					Precio por noche
				</th>
				<th sscope="col" class="px-6 py-3">
					Tipo de habitación
				</th>
				<th scope="col" class="px-6 py-3">
					Nombre del hotel
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="habitacion" items="${listadoHabitaciones}">
				<tr class="bg-blue-500 border-b border-blue-400">
					<td class="px-6 py-4">${habitacion.idHabitacion}</td>
					<td class="px-6 py-4">${habitacion.precioNoche}</td>
					<td class="px-6 py-4">${habitacion.tipoHabitacion}</td>
					<td class="px-6 py-4">${habitacion.hotele.nombreHotel}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
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