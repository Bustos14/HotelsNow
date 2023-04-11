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
	  <div class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">�Atenci�n!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	
<!--  Apartid de aqu� -->	


<table class="mt-6 min-w-full divide-y divide-gray-200">
  <thead class="bg-gray-50">
    <tr>
      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nombre del titular</th>
      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">N�mero de tarjeta</th>
      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Fecha de caducidad</th>
      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">CVV</th>
      <th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Acciones</th>
    </tr>
  </thead>
  <tbody class="bg-white divide-y divide-gray-200">
    <c:forEach var="tarjeta" items="${todasTarjetas}">
      <tr>
        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${tarjeta.nombreTitular}</td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${tarjeta.numeroTarjeta}</td>
        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${tarjeta.fechaCaducidad}</td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${tarjeta.cvv}</td>
        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
          <a href="/usuario/${username}/tarjeta/${tarjeta.idTarjetaBancaria}" class="text-indigo-600 hover:text-indigo-900">Editar</a>
          <a href="/usuario/${username}/eliminar/${tarjeta.idTarjetaBancaria}" class="text-red-600 hover:text-red-900 ml-4">Eliminar</a>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<div class="text-center">
    <button class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded">
    	<a href="/tarjeta/alta">Nueva tarjeta</a>
    </button>
</div>




<!-- No borrar </div> -->
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
</body>
</html>