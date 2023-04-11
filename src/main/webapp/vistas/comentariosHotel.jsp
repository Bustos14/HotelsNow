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
	
	<div class="w-4/5 mx-auto">
	<c:if test="${not empty mensaje}">
	  <div class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">�Atenci�n!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	
<!--  Apartid de aqu� -->	


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
    <button class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded">
    	<a href="/comentario/altaComentario">Nuevo comentario</a>
    </button>
</div>
<div class="mt-4 text-center">
    <button class="bg-gray-500 hover:bg-gray-600 text-white font-bold py-2 px-4 rounded">
    	<a href="/">Ir inicio</a>
    </button>
</div>







<!-- No borrar </div> -->
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
</body>
</html>