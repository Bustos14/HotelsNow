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
	
<!--  Apartid de aquí -->	


<table class="mt-6 min-w-full divide-y divide-gray-200">
  <thead class="bg-gray-50">
    <tr>
      <th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Mensaje</th>
      <th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Fecha de comentario</th>
      <th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Hotel</th>
       <th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Eliminar</th>
    </tr>
  </thead>
  <tbody class="bg-white divide-y divide-gray-200">
    <c:forEach var="comentario" items="${comentarios}">
      <tr>
        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500"><c:out value="${comentario.mensaje}"/></td>
        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500"><c:out value="${comentario.fechaComentario}"/></td>
        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500"><c:out value="${comentario.hotele.nombreHotel}"/></td>
         <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
        <form action="/comentario/comentarios/eliminar/${comentario.idComentario}" method="POST">
         <button type="submit" class="flex mx-auto text-white bg-red-500 border-0 py-2 px-8 focus:outline-none hover:bg-red-600 rounded text-lg mt-5">	
						 	Eliminar
		</button>
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