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
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<h1>${user}</h1>
	<c:if test="${not empty mensaje}">
	  <div id="alert" class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Atención!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	
	<button id="dropdownDefaultButton" data-dropdown-toggle="dropdown" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none
	 focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
	  type="button">Buscar por:<svg class="w-4 h-4 ml-2" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg></button>
	<div class="p-16">
	<div id="dropdown" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700">
	    <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownDefaultButton">
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

	<div
		class="p-10 grid grid-cols-1 sm:grid-cols-1 md:grid-cols-1 lg:grid-cols-3 xl:grid-cols-3 gap-5">

		<c:forEach var="hotel" items="${listaHoteles}">
		
    <div class="bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 sm:w-full">
 
        <a href="/hotel/info/${hotel.idHotel }">
        	<c:if test="${empty hotel.img}">
			  <img class="rounded-t-lg" src="${pageContext.request.contextPath}/img/hotel-test.png" alt="imagen-hotel-${hotel.ciudadHotel}" style="max-width: 100%; height: 300px; width: 100%;"/>
			</c:if>
			<c:if test="${not empty hotel.img}">
			   <img class="rounded-t-lg" src="/recursos/${hotel.img}" alt="imagen-hotel-${hotel.ciudadHotel}" style="max-width: 100%; height: 300px; width: 100%;"/>
			</c:if>
        </a>
        <div class="p-5">
            <a href="/hotel/info/${hotel.idHotel }">
                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white" >${hotel.nombreHotel} </h5>
            </a>
            <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">${hotel.ciudadHotel}</p>
            <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">${hotel.direccionHotel}</p>
            
            <div class="mt-2 flex justify-start space-x-2 mb-4">
            
            <div class="flex p-2">
            <form method="GET" action="/hotel/info/${hotel.idHotel }">
    			<button type="submit" class="inline-flex items-center justify-center px-4 py-2 text-sm font-medium text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
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
						 <button type="submit" class="inline-flex items-center justify-center px-4 py-2 text-sm font-medium text-white bg-red-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">	
						 	Eliminar
						 </button>
					  </form>
					  <a href="/hotel/eliminar/" class="block px-4 py-2 text-gray-800 hover:bg-gray-100">Eliminar</a>
					</div>
					
					</div>
				</sec:authorize>

			</div>

           	</div>           	
        </div>
    </div>

		</c:forEach>
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