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
	<c:if test="${not empty borrado}">
	  <div id="alert" class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Eliminación realizada con éxito!</strong>
	    <span class="block sm:inline">${borrado}</span>
	  </div>
	</c:if>
	  </div>
	
<!--  Apartid de aquí -->	

<div class="w-full max-w-md mx-auto mt-8">
<button class="fixed bottom-4 mb-5 right-4 z-10 flex items-center justify-center text-white bg-ffc36d border-0 py-2 px-8 focus:outline-none hover:bg-yellow-300 rounded text-lg">
			<svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/></svg>
			<a href="/">Volver</a>
		</button>
<h2 class="text-xl font-bold">Listado de comentarios de todos los hoteles</h2>
	<hr>
	<c:forEach var="comentario" items="${hotelesConComentarios}">
		<h2 class="text-l font-bold">${comentario.hotele.nombreHotel}</h2>
		<hr>
		<div class="flex items-center bg-white shadow-md rounded-md overflow-hidden">
			<div class="w-1/3">
				<a href="/hotel/info/${comentario.hotele.idHotel }">
					<c:if test="${empty hotel.img}">
        				<img class="h-full rounded-t-lg object-cover" src="/recursos/${comentario.hotele.img}" alt="imagen-hotel-${hotel.ciudadHotel}"/>
      				</c:if>
       			</a>
			</div>
			<div class="w-2/3 p-4">
				<p class="text-sm text-gray-500">Comentario de ${comentario.usuario.username} el ${comentario.fechaComentario}</p>
				<p class="text-base">${comentario.mensaje}</p>
			</div>
			<div class="w-3/3 p-4">
				<form action="<c:url value='/comentario/procederEliminar/${comentario.idComentario}'/>" method="POST">
            		 <input type="hidden" name="idComentario" value="${comentario.idComentario}">
            		<button type="submit" class="flex mx-auto text-white bg-red-500 border-0 py-2 px-8 focus:outline-none hover:bg-red-600 rounded text-lg">Eliminar</button>
          		</form>
          	</div>
		</div>
	</c:forEach>
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