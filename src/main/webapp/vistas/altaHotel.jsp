<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>
		Alta hotel
	</title>
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body class="bg-gray-100">

	<jsp:include page="navbar.jsp"></jsp:include>



<div class="w-full max-w-md mx-auto mt-8">
<button class="fixed bottom-4 mb-5 right-4 z-10 flex items-center justify-center text-white bg-ffc36d border-0 py-2 px-8 focus:outline-none hover:bg-yellow-300 rounded text-lg">
			<svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/></svg>
			<a href="/">Volver</a>
		</button>
<c:if test="${not empty mensaje}">
	  <div id="alert" class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Atención!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	
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
      <button type="submit" class="flex mx-auto text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">Alta Hotel</button>
     </div>
     </form>
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