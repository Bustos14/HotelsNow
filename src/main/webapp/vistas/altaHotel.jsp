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
		Alta hotel
	</title>
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css"
	rel="stylesheet">
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

<div class="w-full max-w-md mx-auto mt-8">
  <form action="/hotel/alta" method="post" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4" enctype="multipart/form-data">
    <div class="mb-4">
      <label class="block text-gray-700 text-sm font-bold mb-2" for="nombre-hotel">
        Nombre del hotel
      </label>
      <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="nombre-hotel" name="nombreHotel" type="text" placeholder="Ingrese el nombre del hotel">
    </div>
    <div class="mb-4">
    <label class="block text-gray-700 text-sm font-bold mb-2" for="ciudad-hotel">
        Ciudad del hotel
    </label>
    <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="ciudad-hotel" name="ciudadHotel">
        <c:forEach items="${provincias}" var="provincia">
            <option value="${provincia}">${provincia}</option>
        </c:forEach>
    </select>
	</div>
    <div class="mb-4">
      <label class="block text-gray-700 text-sm font-bold mb-2" for="direccion-hotel">
        Dirección del hotel
      </label>
      <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="direccion-hotel" name="direccionHotel" type="text" placeholder="Ingrese la dirección del hotel">
    </div>    
    <div class="mb-4">
      <label class="block text-gray-700 text-sm font-bold mb-2" for="correo-electronico-hotel">
        Correo electrónico del hotel
      </label>
      <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="correo-electronico-hotel" name="correoElectronicoHotel" type="email" placeholder="Ingrese el correo electrónico del hotel">
    </div>
    <div class="mb-4">
      <label class="block text-gray-700 text-sm font-bold mb-2" for="telefono-hotel">
        Teléfono del hotel
      </label>
      <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="telefono-hotel" name="telefonoHotel" type="text" placeholder="Ingrese el teléfono del hotel">
       <label class="block text-gray-700 text-sm font-bold mb-2" for="img">
        Imagen de referencia
      </label>
      <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="img" name="file" type="file">
    </div>
     <!--  
    <div class="mb-4">
      <label class="block text-gray-700 text-sm font-bold mb-2" for="disponible">
        Disponibilidad del hotel
      </label>          
      	<select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="disponible" name="disponible">
        <option value="1">Disponible</option>
        <option value="0">No disponible</option>
      </select> 
      
    </div>
    -->
    <div class="flex items-center justify-between">
      <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow">Alta Hotel</button>
     </div>
     </form>
     </div>
    
      


<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
</body>
</html>