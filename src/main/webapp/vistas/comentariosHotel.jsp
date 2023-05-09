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
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css" rel="stylesheet">
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
	<c:if test="${not empty borrado}">
	  <div id="alert" class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Eliminación realizada con éxito!</strong>
	    <span class="block sm:inline">${borrado}</span>
	  </div>
	</c:if>
	  </div>
	
<!--  Apartid de aquí -->	
<table class="mt-6 min-w-full divide-y divide-gray-200">
  <thead class="bg-gray-50">
    <tr>
      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID Comentario</th>
      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Comentario</th>
      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Fecha Comentario</th>
      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Hotel</th>
      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Usuario</th>
    </tr>
  </thead>
  <tbody class="bg-white divide-y divide-gray-200">
    <c:forEach items="${listaComentarios}" var="comentario">
      <tr>
        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${comentario.idComentario}</td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${comentario.mensaje}</td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${comentario.fechaComentario}</td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${comentario.hotele.nombreHotel}</td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${comentario.usuario.username}</td>
      </tr>
    </c:forEach>
  </tbody>
</table>
<div class="text-center">
    <button class="mt-10 flex mx-auto text-white bg-green-500 border-0 py-2 px-8 focus:outline-none hover:bg-green-600 rounded text-lg">
    	<a href="/comentario/altaComentario">Nuevo comentario</a>
    </button>
</div>
<div class="mt-4 text-center">
    <button class="flex mx-auto text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">
    	<a href="/">Ir inicio</a>
    </button>
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
