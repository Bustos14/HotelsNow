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

<h2 class="text-2xl font-bold mb-4">Listado de solicitudes alta hoteles</h2>
<button class="fixed bottom-4 mb-5 right-4 z-10 flex items-center justify-center text-white bg-ffc36d border-0 py-2 px-8 focus:outline-none hover:bg-yellow-300 rounded text-lg">
			<svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/></svg>
			<a href="/">Volver</a>
		</button>
<table class="w-full">
  <thead>
    <tr class="bg-gray-200">
      <th class="py-2 px-4">Nombre de usuario</th>
      <th class="py-2 px-4">Nombre del Hotel</th>
      <th class="py-2 px-4">Ciudad del Hotel</th>
      <th class="py-2 px-4">Dirección del hotel</th>
      <th class="py-2 px-4">Correo electrónico del Hotel</th>
      <th class="py-2 px-4">Acción</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="solicitud" items="${solicitudes}">
      <tr class="border-b hover:bg-gray-100">
        <td class="py-2 px-4 text-center align-middle">${solicitud.usuario.username}</td>
        <td class="py-2 px-4 text-center align-middle">${solicitud.nombreHotel}</td>
        <td class="py-2 px-4 text-center align-middle">${solicitud.ciudadHotel}</td>
        <td class="py-2 px-4 text-center align-middle">${solicitud.direccionHotel}</td>
        <td class="py-2 px-4 text-center align-middle">${solicitud.correoElectronicoHotel}</td>
        <td class="py-2 px-4 text-center align-middle">
          <form action="<c:url value='/solicitud/accion'/>" method="post">
            <input type="hidden" name="id_solicitud" value="${solicitud.idHotelSolicitado}" />
            <button type="submit" name="accion" value="aceptar" class="flex mx-auto mt-5 text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">Aceptar</button>
            <button type="submit" name="accion" value="denegar" class="flex mx-auto mt-5 text-white bg-red-500 border-0 py-2 px-8 focus:outline-none hover:bg-red-600 rounded text-lg">Denegar</button>
          </form>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>



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