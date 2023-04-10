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
	    <strong class="font-bold">¡Atención!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	
<!--  Apartid de aquí -->	



<div class="p-16">
	<div class="p-8 bg-white shadow mt-24">  
		<div class="grid grid-cols-1 md:grid-cols-3">    
			<div class="grid grid-cols-3 text-center order-last md:order-first mt-20 md:mt-0">      
				<div>        
					<p class="font-bold text-gray-700 text-xl">22</p>
					<p class="text-gray-400">Reservas</p>      
				</div>     
				<div>           
					<p class="font-bold text-gray-700 text-xl">10</p>        
					<p class="text-gray-400">Comentarios</p>      
				</div>          
				<div>           
					<p class="font-bold text-gray-700 text-xl">89</p>        
					<p class="text-gray-400">Hoteles</p>      
				</div>    
			</div>    
			<div class="relative">      
				<div class="w-48 h-48 bg-indigo-100 mx-auto rounded-full shadow-2xl absolute inset-x-0 top-0 -mt-24 flex items-center justify-center text-indigo-500">
					<svg xmlns="http://www.w3.org/2000/svg" class="h-24 w-24" viewBox="0 0 20 20" fill="currentColor">  
					<path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd" /></svg>      
				</div>   
			</div>    
			<div class="space-x-8 flex justify-between mt-32 md:mt-0 md:justify-center">
				<button  class="text-white py-2 px-4 uppercase rounded bg-blue-400 hover:bg-blue-500 shadow hover:shadow-lg font-medium transition transform hover:-translate-y-0.5">  Modificar</button>    
				<button  class="text-white py-2 px-4 uppercase rounded bg-gray-700 hover:bg-gray-800 shadow hover:shadow-lg font-medium transition transform hover:-translate-y-0.5">  Tarjetas</button>    
			</div>  
		</div>  
			<div class="mt-20 text-center border-b pb-12">   
			<c:forEach var="user" items="usuario">
				<h1 class="text-4xl font-medium text-gray-700"> Nombre : ${usuario.nombre}</h1>    
				<p class="font-light text-gray-600 mt-3">Username : ${usuario.username}</p>    
				<p class="mt-8 text-gray-500"> Apellidos : ${usuario.apellidos}</p>    
				<p class="mt-2 text-gray-500"> Fecha de registro : ${usuario.fechaRegistro}</p>  
			</c:forEach> 
			</div>  
	</div>
</div>



<!-- No borrar </div> -->
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
</body>
</html>