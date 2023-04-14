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

<h2 class="text-2xl font-bold mb-4">Usuarios con rol CLIENTE</h2>
<table class="w-full">
  <thead>
    <tr class="bg-gray-200">
      <th class="py-2 px-4">Nombre de usuario</th>
      <th class="py-2 px-4">Nombre</th>
      <th class="py-2 px-4">Apellidos</th>
      <th class="py-2 px-4">Fecha de nacimiento</th>
      <th class="py-2 px-4">Fecha de registro</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="usuario" items="${usuarios}">
      <tr class="border-b hover:bg-gray-100">
        <td class="py-2 px-4 text-center align-middle">${usuario.username}</td>
        <td class="py-2 px-4 text-center align-middle">${usuario.nombre}</td>
        <td class="py-2 px-4 text-center align-middle">${usuario.apellidos}</td>
        <td class="py-2 px-4 text-center align-middle">${usuario.fechaNacimiento}</td>
        <td class="py-2 px-4 text-center align-middle">${usuario.fechaRegistro}</td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<h2 class="text-2xl font-bold mb-4">Usuarios con rol ADMIN</h2>
<table class="w-full">
  <thead>
    <tr class="bg-gray-200">
      <th class="py-2 px-4">Nombre de usuario</th>
      <th class="py-2 px-4">Nombre</th>
      <th class="py-2 px-4">Apellidos</th>
      <th class="py-2 px-4">Fecha de nacimiento</th>
      <th class="py-2 px-4">Fecha de registro</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="usuario" items="${admins}">
      <tr class="border-b hover:bg-gray-100">
        <td class="py-2 px-4 text-center align-middle">${usuario.username}</td>
        <td class="py-2 px-4 text-center align-middle">${usuario.nombre}</td>
        <td class="py-2 px-4 text-center align-middle">${usuario.apellidos}</td>
        <td class="py-2 px-4 text-center align-middle">${usuario.fechaNacimiento}</td>
        <td class="py-2 px-4 text-center align-middle">${usuario.fechaRegistro}</td>
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