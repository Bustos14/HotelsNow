<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bienvenido a HotelsNow</title>
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css"
	rel="stylesheet">
</head>
<body>


	<jsp:include page="navbar.jsp"></jsp:include>
	
	<c:if test="${not empty mensaje}">
	  <div class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Atención!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>

	

	<div
		class="p-10 grid grid-cols-1 sm:grid-cols-1 md:grid-cols-1 lg:grid-cols-3 xl:grid-cols-3 gap-5">

		<c:forEach var="hotel" items="${listaHoteles}">
		
    <div class="bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 sm:w-full">
        <a href="#">
            <img class="rounded-t-lg " src="/recursos/${hotel.img}" alt="imagen-hotel->${hotel.ciudadHotel}" style="width: 100%; object-fit: cover;"/>
        </a>
        <div class="p-5">
            <a href="/hotel/info/${hotel.idHotel }">
                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">${hotel.nombreHotel}</h5>
            </a>
            <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">${hotel.ciudadHotel}</p>
            <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">${hotel.direccionHotel}</p>
            
            <div class="mt-2 flex justify-start space-x-2 mb-4">
            
            <form method="GET" action="/hotel/info/${hotel.idHotel }">
    			<button type="submit" class="inline-flex items-center justify-center px-3 py-2 text-sm font-medium text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
      					  INFO 
	        		<svg aria-hidden="true" class="w-4 h-4 ml-2 -mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
	           			<path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
	       			</svg>
    			</button>
			</form>

			<form method="GET" action="/hotel/editar/${hotel.idHotel }">
            
	           	<button type="submit" class="inline-flex items-center justify-center px-3 py-2 text-sm font-medium text-white bg-green-700 rounded-lg hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
	                EDITAR
	                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 ml-2 -mr-1" viewBox="0 0 20 20" fill="currentColor">
					  <path d="M14.293 5.293a1 1 0 00-1.414 0L6 12.586V15a1 1 0 001 1h2.414l7.293-7.293a1 1 0 000-1.414l-2.707-2.707zm-1.414 2.828L12.586 7 14 5.586l.879.879-1.414 1.414zm-4.657 4.95L4 17V19h2.05l7.378-7.377-2.828-2.828z"/>
					</svg>
	           	</button>
			</form>
			<form method="POST" action="/hotel/eliminar/${hotel.idHotel }">
	           	<button type="submit" class="inline-flex items-center justify-center px-3 py-2 text-sm font-medium text-white bg-red-700 rounded-lg hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
	                ELIMINAR
	                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 ml-2 -mr-1" viewBox="0 0 20 20" fill="currentColor">
					  <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM6.707 5.293a1 1 0 011.414 0L10 8.586l1.879-1.879a1 1 0 111.414 1.414L11.414 10l2.293 2.293a1 1 0 01-1.414 1.414L10 11.414l-1.879 1.879a1 1 0 01-1.414-1.414L8.586 10 6.293 7.707a1 1 0 010-1.414z" clip-rule="evenodd"/>
					</svg>
	           	</button>
           	</form>
           	</div>           	
        </div>
    </div>

		</c:forEach>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
</body>
</html>