<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		  
 		<form method="GET" action="/search">
		    <div class="flex">
		        <label for="search-dropdown" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white"></label>
		           <select class="flex-shrink-0 z-10 inline-flex items-center py-2.5
		         px-4 text-sm font-medium text-center text-gray-900 bg-gray-100 border border-gray-300 rounded-l-lg hover:bg-gray-200 focus:ring-4
		         focus:outline-none focus:ring-gray-100 dark:bg-gray-700 dark:hover:bg-gray-600 dark:focus:ring-gray-700 dark:text-white dark:border-gray-600" 
					id="ciudad-hotel" name="tipo">
			        <option value="Nombre">Nombre</option>
			        <option value="Ciudad">Ciudad</option>
			    </select>
		        <div class="relative w-full">
		            <input type="search" id="search-dropdown" name="inputSearch" class="block p-2.5 w-full z-20 text-sm text-gray-900 bg-gray-50 rounded-r-lg border-l-gray-50 border-l-2 border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-l-gray-700  dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:border-blue-500" placeholder="Burcar por..." required>
		            <button type="submit" class="absolute top-0 right-0 p-2.5 text-sm font-medium text-white bg-blue-700 rounded-r-lg border border-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
		                <svg aria-hidden="true" class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
		                <span class="sr-only">Search</span>
		            </button>
		        </div>
		    </div>
		</form>

		  <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="navbar-sticky">
		  
		    <ul class="md:flex md:items-center">
			    <li>
			      <a href="/" class="block py-2 px-4 text-gray-700 hover:text-gray-900">Home</a>
			    </li>
			    <li>
			      <a href="/servicios" class="block py-2 px-4 text-gray-700 hover:text-gray-900">Servicios</a>
			    </li>
			    <li>
			      <a href="/sobreNosotros" class="block py-2 px-4 text-gray-700 hover:text-gray-900">Sobre nosotros</a>
			    </li>
			    <li>
			      <a href="/contacto" class="block py-2 px-4 text-gray-700 hover:text-gray-900">Contacto</a>
			    </li>
			     <sec:authorize access="isAuthenticated()">
			     <li>			     
				  <a href="/usuario/perfil/${username }" class="block py-2 px-4 text-gray-700 hover:text-gray-900">
				    Perfil
				  </a>
				  </li>
			    <li>
			      <form action="/logout" method="post">
			        <button type="submit" class="block py-2 px-4 text-gray-700 hover:text-gray-900">Cerrar sesión</button>
			      </form>
			    </li>
			  </sec:authorize>
			  <sec:authorize access="!isAuthenticated()">
			    <li>
			      <a href="/login" class="block py-2 px-4 text-gray-700 hover:text-gray-900">Inicia sesión</a>
			    </li>
			    <li>
			      <a href="/registro" class="block py-2 px-4 text-gray-700 hover:text-gray-900">Regístrate</a>
			    </li>
			  </sec:authorize>

			</ul>
			
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERADMIN')">
            <button id="dropdownNavbarLink" data-dropdown-toggle="dropdownNavbar" 
            class="flex items-center justify-between w-full py-2 pl-3 pr-4 text-gray-900 
            rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 md:w-auto dark:text-white md:dark:hover:text-blue-500 dark:focus:text-white 
            dark:border-gray-700 dark:hover:bg-gray-700 md:dark:hover:bg-transparent">Opciones <svg class="w-5 h-5 ml-1" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg></button>
            <!-- Dropdown menu -->
            	<div id="dropdownNavbar" class="z-10 hidden font-normal bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600">
                <ul class="py-2 text-sm text-gray-700 dark:text-gray-400" aria-labelledby="dropdownLargeButton">
                  <li>
                    <a href="/solicitud/altaSolicitud" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Alta hotel</a>
                  </li>
                   <li>
                  	<sec:authorize access="hasAnyRole('ROLE_SUPERADMIN')">
                    	<a href="/solicitud/altaSolicitud" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Alta solicitudes</a>
                    </sec:authorize>
                  </li>
                  <li>
                	<sec:authorize access="hasAnyRole('ROLE_SUPERADMIN')">
                    	<a href="/usuario/verTodos" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Ver usuarios</a>
                    </sec:authorize>                    
                  </li>
                  <li>
                  	<sec:authorize access="hasAnyRole('ROLE_SUPERADMIN')">
                    	<a href="/reserva/verTodas" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Ver reservas</a>
                    </sec:authorize>
                  </li>
                   <li>
                  	<sec:authorize access="hasAnyRole('ROLE_SUPERADMIN')">
                    	<a href="/usuario/verSolicitudes" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Ver solicitudes</a>
                    </sec:authorize>
                  </li>
                </ul>
                <div class="py-1">
                  <a href="/logout" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-400 dark:hover:text-white">Salir</a>
                </div>
                </li>
            </div>
            </sec:authorize>
		  	</ul>
		  </div>
    <div class="hidden w-full md:block md:w-auto" id="navbar-dropdown">
      <ul class="flex flex-col font-medium p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
      
      </ul>
   	 </div>
	  </div>
</nav>


<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>

</body>
</html>