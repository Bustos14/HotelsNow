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
	
<!--  Apartid de aquí -->	

<h2 class="text-2xl font-bold mb-4">Usuarios con rol CLIENTE</h2>
<button class="fixed bottom-4 mb-5 right-4 z-10 flex items-center justify-center text-white bg-ffc36d border-0 py-2 px-8 focus:outline-none hover:bg-yellow-300 rounded text-lg">
			<svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/></svg>
			<a href="/">Volver</a>
		</button>

<table class="w-full bg-white">
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
<table class="w-full bg-white">
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