<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bienvenido a HotelsNow</title>
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body >
	<jsp:include page="navbar.jsp"></jsp:include>
	<c:if test="${not empty mensaje}">
	  <div id="alert" class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Atención!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	<div class="p-16">
	<div class="p-8 bg-white shadow mt-24">
		<button id="dropdownDefaultButton" data-dropdown-toggle="dropdown" class="text-white bg-indigo-700 hover:bg-indigo-800 focus:ring-4 focus:outline-none
	 focus:ring-indigo-300 font-medium rounded-lg text-sm px-4 py-2.5 text-center inline-flex items-center dark:bg-indigo-600 dark:hover:bg-indigo-700 dark:focus:ring-indigo-800"
	  type="button">Buscar por:<svg class="w-4 h-4 ml-2" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg></button>
	<div class="p-16">
	<div id="dropdown" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700">
	    <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownDefaultButton">
	       <li>
	        <a class="dropdown-item" href="/tipo/Todos">Todos</a>
	      </li>
	      <li>
	        <a class="dropdown-item" href="/tipo/Individual">Individual</a>
	      </li>
	      <li>
	       <a class="dropdown-item" href="/tipo/Doble">Doble</a>
	      </li>
	      <li>
	        <a class="dropdown-item" href="/tipo/Triple">Triple</a>
	      </li>
	     
	    </ul>
	</div>  
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
		            <input type="search" id="search-dropdown" name="inputSearch" class="block p-2.5 w-full z-20 text-sm text-gray-900 bg-gray-50 rounded-r-lg border-l-gray-50 border-l-2 border border-gray-300 focus:ring-indigo-500 focus:border-indigo-500 dark:bg-gray-700 dark:border-l-gray-700  dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:border-indigo-500" placeholder="Burcar por..." required>
		            <button type="submit" class="absolute top-0 right-0 p-2.5 text-sm font-medium text-white bg-indigo-700 rounded-r-lg border border-indigo-700 hover:bg-indigo-800 focus:ring-4 focus:outline-none focus:ring-indigo-300 dark:bg-indigo-600 dark:hover:bg-indigo-700 dark:focus:ring-indigo-800">
		                <svg aria-hidden="true" class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
		                <span class="sr-only">Search</span>
		            </button>
		        </div>
		    </div>
		</form>
	
	<div class="p-10 grid grid-cols-1 sm:grid-cols-1 md:grid-cols-1 lg:grid-cols-3 xl:grid-cols-3 gap-5">

		<c:forEach var="hotel" items="${listaHoteles}">
	<div >	
	 <div class="cursor-pointer rounded-xl bg-white p-3 shadow-lg hover:shadow-xl">
	 <a href="/hotel/info/${hotel.idHotel }">
        	<c:if test="${empty hotel.img}">
			  <img class="rounded-t-lg" src="${pageContext.request.contextPath}/img/hotel-test.png" alt="imagen-hotel-${hotel.ciudadHotel}" style="max-width: 100%; height: 300px; width: 100%;"/>
			</c:if>
			<c:if test="${not empty hotel.img}">
			   <img class="rounded-t-lg" src="/recursos/${hotel.img}" alt="imagen-hotel-${hotel.ciudadHotel}" style="max-width: 100%; height: 300px; width: 100%;"/>
			</c:if>
       	 </a>
    <div class="relative flex items-end overflow-hidden rounded-xl">
 	
        
        	<div class="mt-1 p-2">
            <a href="/hotel/info/${hotel.idHotel }">
                <h2 class="text-slate-700">${hotel.nombreHotel} </h5>
            </a>
            <p class="mt-1 text-sm text-slate-400">${hotel.ciudadHotel}</p>
            <p class="mt-1 text-sm text-slate-400">${hotel.direccionHotel}</p>
            
            <div class="mt-2 flex justify-start space-x-2 mb-4">
            
            <div class="flex p-2">
            <form method="GET" action="/hotel/info/${hotel.idHotel }">
    			<button type="submit" class="inline-flex items-center justify-center px-4 py-2 text-sm font-medium text-white bg-indigo-700 rounded-lg hover:bg-indigo-800 focus:ring-4 focus:outline-none focus:ring-indigo-300 dark:bg-indigo-600 dark:hover:bg-indigo-700 dark:focus:ring-indigo-800">
      					  INFO 
	        		<svg aria-hidden="true" class="w-4 h-4 ml-2 -mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
	           			<path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
	       			</svg>
    			</button>
			</form>
			</div>
			<div class="flex p-2">
				<sec:authorize access="hasAnyAuthority('ROLE_SUPERADMIN', 'ROLE_ADMIN')">
					<div class="relative inline-block">
					  <button id="dropdown-btn-${hotel.idHotel}" class="py-2 px-4 bg-gray-200 text-sm text-gray-800 font-semibold rounded-lg shadow-md hover:bg-gray-300 focus:outline-none focus:ring-2 focus:ring-gray-400 focus:ring-opacity-75" 
					    onclick="toggleDropdown('dropdown-${hotel.idHotel}')">
					  Acciones
					</button>
					<div class="absolute z-10 mt-2py-2w-48   bg-white rounded-md shadow-xl" 
					    id="dropdown-${hotel.idHotel}" 
					    style="display:none;">
					  <a href="/hotel/editar/${hotel.idHotel}" class="block px-4 py-2 text-gray-800 hover:bg-gray-100">Modificar</a>
					  <form action="/hotel/eliminar/${hotel.idHotel}" method="POST">
						 <button type="submit" class="inline-flex items-center justify-center px-4 py-2 text-sm font-medium text-white bg-red-700 rounded-lg hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-indigo-800">	
						 	Eliminar
						 </button>
					  </form>
					</div>
					
					</div>
				</sec:authorize>

			</div>

           	</div>           	
        </div>
    </div>
</div>
</div>
		</c:forEach>
		</div>
		</div>
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
	
<script>function toggleDropdown(dropdownId) {
	  const dropdown = document.getElementById(dropdownId);
	  dropdown.style.display = dropdown.style.display === "none" ? "block" : "none";
	}

</script>

<script>
  // Obtener el elemento del alert
  const alert = document.getElementById('alert');

  // Ocultar el alert después de 3 segundos (3000 ms)
  setTimeout(function() {
    alert.style.display = 'none';
  }, 3000);
  
</script>
</body>
</html>