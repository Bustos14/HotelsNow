<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<div class="w-full max-w-md mx-auto mt-8"> 
  <form action="/habitacion/alta" method="post" enctype="multipart/form-data" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
  <div class="mb-4">
  <input type="hidden" name="hotelId" value="${hotel.idHotel}">
      <label class="block text-gray-700 text-sm font-bold mb-2" for="nombre-habitacion">
        Nombre habitación
      </label>
      <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="nombre-habitacion" name="nombreHabitacion" type="text" placeholder="Ingrese el de la habitación">
    </div>
    <div class="mb-4">
      <label class="block text-gray-700 text-sm font-bold mb-2" for="precio-noche">
        Precio por noche
      </label>
      <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="precio-noche" name="precioNoche" type="number" placeholder="Ingrese el precio por noche">
    </div>
    <div class="mb-4">
      <label class="block text-gray-700 text-sm font-bold mb-2" for="tipo-habitacion">
  Tipo de habitación
</label>
<select name="tipoHabitacion" id="tipo-habitacion" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
  <option value="">Seleccione el tipo de habitación</option>
  <c:forEach items="${tipo}" var="tipoHabitacion">
    <option value="${tipoHabitacion}">${tipoHabitacion}</option>
  </c:forEach>
</select>

    <label class="block text-gray-700 text-sm font-bold mb-2" for="img">
        Imagen de referencia
      </label>
      <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="img" name="file" type="file">
    </div> 
    <!-- 
    <div class="mb-4">
  <label class="block text-gray-700 text-sm font-bold mb-2" for="disponible">
    Disponible
  </label>
  <div class="relative inline-block w-10 mr-2 align-middle select-none">
    <input type="checkbox" name="disponible" id="disponible" value="1" class="toggle-checkbox absolute block w-6 h-6 rounded-full bg-white border-4 appearance-none cursor-pointer focus:outline-none transition-transform duration-200 ease-in-out">
    <label for="disponible" class="toggle-label block overflow-hidden h-6 rounded-full bg-gray-300 cursor-pointer"></label>
  </div>
  <label for="disponible" class="text-xs text-gray-700">Si / No</label>
</div>
	-->

    <div class="flex items-center justify-between">
      <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow">Alta Habitación</button>
    </div>
  </form>
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