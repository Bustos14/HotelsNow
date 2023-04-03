<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.css" rel="stylesheet" />
</head>
<body>

<nav class="bg-white border-gray-200 px-2 sm:px-4 py-2.5 rounded dark:bg-gray-900">
	  <div class="container flex flex-wrap items-center justify-between mx-auto">
		  <a href="/" class="flex items-center">
		      <img src="${pageContext.request.contextPath}/img/hotel-test.png" class="h-6 mr-3 sm:h-9" alt="logo HotelsNow">
		      <span class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">HotelsNow</span>
		  </a>
		  <div class="flex md:hidden ">
		      <button type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-3 md:mr-0 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Inicio sesion</button>
		      <button data-collapse-toggle="navbar-sticky" type="button" class="inline-flex items-center p-2 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="navbar-sticky" aria-expanded="false">
		        <span class="sr-only">Open main menu</span>
		        <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
		        <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd">
		        </path></svg>
		    </button>
		  </div>
		  <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="navbar-sticky">
		    <ul class="md:flex md:items-center">
			    <li>
			      <a href="/" class="block py-2 px-4 text-gray-700 hover:text-gray-900">Home</a>
			    </li>
			    <li>
			      <a href="#" class="block py-2 px-4 text-gray-700 hover:text-gray-900">Servicios</a>
			    </li>
			    <li>
			      <a href="#" class="block py-2 px-4 text-gray-700 hover:text-gray-900">Sobre nosotros</a>
			    </li>
			    <li>
			      <a href="#" class="block py-2 px-4 text-gray-700 hover:text-gray-900">Contacto</a>
			    </li>
		  	</ul>
		  </div>
	  </div>
</nav>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>

</body>
</html>