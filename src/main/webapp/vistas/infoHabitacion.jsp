<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>

	</title>
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css"rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
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
	</div>
	
<!--  Apartid de aquí -->	

<div class="w-4/5 mx-auto">
<button class="fixed bottom-4 mb-5 right-4 z-10 flex items-center justify-center text-white bg-ffc36d border-0 py-2 px-8 focus:outline-none hover:bg-yellow-300 rounded text-lg">
			<svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/></svg>
			<a href="/">Volver</a>
		</button>
<div class="container mx-auto px-4 py-8 max-w-4xl">
  <div class="max-w-400 mx-auto flex items-center justify-center">
    <div class="flex flex-col justify-between bg-white rounded-lg shadow-lg">
      <div>
        <c:if test="${empty habitacion.img}">
			<img src="${pageContext.request.contextPath}/img/hotel-test.png" class="h-auto w-full object-cover rounded-t-lg" style="max"alt="Room image">
		</c:if>
		<c:if test="${not empty habitacion.img}">
			<img src="/recursos/${habitacion.img}" class="h-auto w-full object-cover rounded-t-lg" style="max"alt="Room image">
		</c:if>
        
        <div class="px-4 py-5 sm:px-6">
          <h2 class="text-2xl font-bold text-gray-800">${habitacion.tipoHabitacion}</h2>
          <p class="mt-1 text-sm text-gray-500">${habitacion.nombreHabitacion}</p>
        </div>
        <div class="border-t border-gray-200 px-4 py-5 sm:px-6">
          <h3 class="text-lg font-medium text-gray-900">Detalles de la habitación</h3>
          <dl class="mt-2 grid grid-cols-1 gap-x-4 gap-y-8 sm:grid-cols-2">
            <div class="sm:col-span-1">
              <dt class="text-sm font-medium text-gray-500">ID de la habitación</dt>
              <dd class="mt-1 text-sm text-gray-900">${ habitacion.idHabitacion }</dd>
            </div>
            <div class="sm:col-span-1">
              <dt class="text-sm font-medium text-gray-500">Precio por noche</dt>
              <dd class="mt-1 text-sm text-gray-900">$${ habitacion.precioNoche }</dd>
            </div>
            <div class="sm:col-span-1">
              <dt class="text-sm font-medium text-gray-500">Nombre del hotel</dt>
              <dd class="mt-1 text-sm text-gray-900">${ habitacion.hotele.nombreHotel }</dd>
            </div>
            <div class="sm:col-span-1">
              <dt class="text-sm font-medium text-gray-500">Disponible</dt>
              <dd class="mt-1 text-sm text-gray-900"><span class="px-2 py-1 text-white font-bold rounded-full ${habitacion.disponible == 1 ? 'bg-green-500' : 'bg-red-500'}">${habitacion.disponible == 1 ? 'Disponible' : 'No disponible'}</span></dd>
            </div>
          </dl>
        </div>
      </div>
          <div class="mt-2 flex justify-center space-x-2 mb-4">
<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERADMIN')">
	<form method="GET" action="/habitacion/editar/${habitacion.idHabitacion }">
            
	     <button type="submit"  class="flex mx-auto text-white bg-green-500 border-0 py-2 px-8 focus:outline-none hover:bg-green-600 rounded text-lg">
	                EDITAR
	        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 ml-2 -mr-1" viewBox="0 0 20 20" fill="currentColor">
				<path d="M14.293 5.293a1 1 0 00-1.414 0L6 12.586V15a1 1 0 001 1h2.414l7.293-7.293a1 1 0 000-1.414l-2.707-2.707zm-1.414 2.828L12.586 7 14 5.586l.879.879-1.414 1.414zm-4.657 4.95L4 17V19h2.05l7.378-7.377-2.828-2.828z"/>
			</svg>
	    </button>
	</form>
	
	<form method="POST" action="/habitacion/eliminar/${habitacion.idHabitacion }">
      	<button type="submit" class="flex mx-auto text-white bg-red-500 border-0 py-2 px-8 focus:outline-none hover:bg-red-600 rounded text-lg">
             ELIMINAR
             <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 ml-2 -mr-1" viewBox="0 0 20 20" fill="currentColor">
	  			<path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM6.707 5.293a1 1 0 011.414 0L10 8.586l1.879-1.879a1 1 0 111.414 1.414L11.414 10l2.293 2.293a1 1 0 01-1.414 1.414L10 11.414l-1.879 1.879a1 1 0 01-1.414-1.414L8.586 10 6.293 7.707a1 1 0 010-1.414z" clip-rule="evenodd"/>
			</svg>
       	</button>
	</form>
</sec:authorize>
</div>      


	</div>

<!-- No borrar </div> -->
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