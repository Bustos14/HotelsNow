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
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body class="bg-gray-100">
	<jsp:include page="navbar.jsp"></jsp:include>
	
	
	<div class="w-4/5 mx-auto">
	<c:if test="${not empty mensaje}">
	  <div id="alert" class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">Â¡AtenciÃ³n!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	
<!--  Apartid de aquÃ­ -->	



<div class="p-8">
<button class="fixed bottom-4 mb-5 right-4 z-10 flex items-center justify-center text-white bg-ffc36d border-0 py-2 px-8 focus:outline-none hover:bg-yellow-300 rounded text-lg">
			<svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/></svg>
			<a href="/">Volver</a>
		</button>
	<div class="p-8 bg-white shadow mt-24">  
		<div class="grid grid-cols-1 md:grid-cols-3">    
			<div class="grid grid-cols-3 text-center order-last md:order-first mt-20 md:mt-0">      
				<div>        
					<p class="font-bold text-gray-700 text-xl"><a href="/usuario/misReservas">${numReservas}</a></p>
					<p class="text-gray-400"><a href="/usuario/misReservas">Reservas</a></p>      
				</div>     
				<div>           
					<p class="font-bold text-gray-700 text-xl"><a href="/usuario/misComentarios">${numComentarios}</a></p>        
					<p class="text-gray-400"><a href="/usuario/misComentarios">Comentarios</a></p>      
				</div>  				
				   <div>           
				      <p class="font-bold text-gray-700 text-xl"><a href="/">${numHoteles}</a></p>        
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				      <p class="text-gray-400"><a href="/">Administrar mis hoteles</a></p>
				</sec:authorize>	    				   
				<sec:authorize access="hasRole('ROLE_CLIENTE') || hasRole('ROLE_SUPERADMIN')">
					  <p class="text-gray-400"><a href="/">Ver lista de hoteles disponibles</a></p>
				</sec:authorize>
				   </div> 			 
			</div>    
			<div class="relative">      
				<div class="w-48 h-48 bg-indigo-100 mx-auto rounded-full shadow-2xl absolute inset-x-0 top-0 -mt-24 flex items-center justify-center text-indigo-500">
					<svg xmlns="http://www.w3.org/2000/svg" class="h-24 w-24" viewBox="0 0 20 20" fill="currentColor">  
					<path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd" /></svg>      
				</div>   
			</div>    
			<div class="space-x-8 flex justify-between mt-32 md:mt-0 md:justify-center">				
				<form action="/usuario/misTarjetas/${usuario.username }" method="get">   
					<button  class="text-white py-2 px-4 uppercase rounded bg-gray-700 hover:bg-gray-800 shadow hover:shadow-lg font-medium transition transform hover:-translate-y-0.5">  Ver mis tarjetas</button>    
				</form> 
				 <form method="post" action="/usuario/modificarPerfil">
					<button disabled id="enviarCambios" class="text-white py-2 px-4 uppercase rounded bg-blue-400 hover:bg-blue-500 shadow hover:shadow-lg font-medium transition transform hover:-translate-y-0.5">  Realizar cambios</button>
			
			</div>  
		</div>  
			<div class="mt-20 text-center border-b pb-12">   
			  <c:forEach var="user" items="usuario">
			   <div class="grid grid-cols-2 gap-4">
  <div>
    <div class="mb-4">
      <label for="nombre" class="block font-bold mb-2 text-indigo-500">Nombre:</label>
      <input disabled id="inputNombre" type="text" name="nombre" id="nombre" value="${usuario.nombre}" 
      class="w-full rounded-lg border-none border-gray-400 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 text-center">
    </div>
    <div class="mb-4">
      <label for="username" class="block font-bold mb-2 text-indigo-500">Username: (no se puede modificar)</label>
      <input readonly id="inputUsername" type="text" name="username" id="username" value="${usuario.username}" 
      class="w-full rounded-lg border-none border-gray-400 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 text-center">
    </div>
    <div class="mb-4">
    	<label reandonly class="block font-bold mb-2 text-indigo-500">HotelsNow</label>
    	<img class="w-10 h-10 mx-auto block" src="${pageContext.request.contextPath}/img/hotel-test.png" alt="Icono de fecha de registro">
    </div>
  </div>
  <div>
    <div class="mb-4">
      <label for="apellidos" class="block font-bold mb-2 text-indigo-500">Apellidos:</label>
      <input disabled id="inputApellidos" type="text" name="apellidos" id="apellidos" value="${usuario.apellidos}" 
      class="w-full rounded-lg border-none border-gray-400 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 text-center">
    </div>
    <div class="mb-4">
      <label for="fechaNacimiento" class="block font-bold mb-2 text-indigo-500">Fecha de nacimiento:</label>
      <input disabled type="text" name="fechaNacimiento" id="fechaNacimiento" value="${usuario.fechaNacimiento}" 
      class="w-full rounded-lg border-none border-gray-400 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 text-gray-700 text-center" disabled>
    </div>
    <div class="mb-4">
      <label for="fechaRegistro" class="block font-bold mb-2 text-indigo-500">Fecha de registro:</label>
      <input disabled type="text" name="fechaRegistro" id="fechaRegistro" value="${usuario.fechaRegistro}" 
      class="w-full rounded-lg border-none border-gray-400 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 text-gray-700 text-center" disabled>
    </div>
  </div>
</div>

			    </form>
			  </c:forEach> 
			</div> 
				<button id="modify" class="flex mx-auto mt-20 text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg transition transform hover:-translate-y-0.5" onclick="cambiarEstadoCampos()">  Modificar</button>
				
	</div>
</div>



<!-- No borrar </div> -->
	</div>
<script>
function cambiarEstadoCampos() {
    var inputNombre = document.getElementById("inputNombre");
    var inputApellidos = document.getElementById("inputApellidos");
    var enviarCambios = document.getElementById("enviarCambios");
    var inputFechaNac = document.getElementById("fechaNacimiento");

    if (inputNombre.disabled) {
        inputNombre.disabled = false;
        inputApellidos.disabled = false;
        enviarCambios.disabled = false;
        inputFechaNac.disabled = false;
    } else {
        inputNombre.disabled = true;
        inputApellidos.disabled = true;
        enviarCambios.disabled = true;
        inputFechaNac.disabled = false;
    }
}
</script>

<script>
  // Obtener el elemento del alert
  const alert = document.getElementById('alert');

  // Ocultar el alert despuÃ©s de 3 segundos (3000 ms)
  setTimeout(function() {
    alert.style.display = 'none';
  }, 3000);
  
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
</body>
</html>