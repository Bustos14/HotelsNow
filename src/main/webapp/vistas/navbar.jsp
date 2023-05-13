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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body>

<nav class="bg-white border-gray-200 px-2 sm:px-4 py-2.5 rounded dark:bg-gray-900">
	  <div class="container flex flex-wrap items-center justify-between mx-auto">
		  <a href="/" class="flex items-center">
		      <img src="${pageContext.request.contextPath}/img/hotel-test.png" class="h-6 mr-3 sm:h-9" alt="logo HotelsNow">
		      <span class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">HotelsNow</span>
		  </a>
		  

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
			        <button type="submit" class="inline-block rounded py-2 px-3 mr-1 text-white bg-ffc36d hover:bg-yellow-300 focus:bg-yellow-400">Cerrar sesión</button>
			      </form>
			    </li>
			  </sec:authorize>
			  <sec:authorize access="!isAuthenticated()">
			    <li>
			      <a href="/login" class="inline-block rounded py-2 px-4 text-ffc36d bg-white mr-2" style="box-shadow: 0px 0px 0px 2px #ffc36d;">Inicia sesión</a>
			    </li>
			    <li>
			      <a href="/registro" class="inline-block rounded py-2 px-4 text-white bg-ffc36d hover:bg-yellow-300 focus:bg-yellow-400">Regístrate</a>
			    </li>
			  </sec:authorize>

			</ul>
			
			
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERADMIN')">
            <button id="dropdownNavbarLink" data-dropdown-toggle="dropdownNavbar" 
            class="inline-block rounded py-2 px-4 text-ffc36d bg-white mr-2" style="box-shadow: 0px 0px 0px 2px #ffc36d;">Opciones 
            </button>
            <!-- Dropdown menu -->
            	<div id="dropdownNavbar" class="z-10 hidden font-normal bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600">
                <ul class="py-2 text-sm text-gray-700 dark:text-gray-400" aria-labelledby="dropdownLargeButton">
                  <li>
                    <a href="/hotel/alta" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Alta hotel</a>
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
                  <li>
                  	<sec:authorize access="hasAnyRole('ROLE_SUPERADMIN')">
                    	<a href="/comentario/verComentarios" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Ver comentarios</a>
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