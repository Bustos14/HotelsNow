<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<title>
		Detalles del hotel
	</title>
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body class="bg-gray-100">
	<jsp:include page="navbar.jsp"></jsp:include>
	
	
	
	<c:if test="${not empty mensaje}">
	  <div id="alert" class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Atención!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	<div class="p-8 w-4/5 mx-auto">
		<button class="fixed bottom-4 mb-5 right-4 z-10 flex items-center justify-center text-white bg-ffc36d border-0 py-2 px-8 focus:outline-none hover:bg-yellow-300 rounded text-lg">
			<svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/></svg>
			<a href="/">Volver</a>
		</button>
	
	
		<div class="rounded-lg  overflow-hidden">
	<div class="flex items-center bg-white shadow-md rounded-md overflow-hidden">
			<div class="w-2/3">
				<div class="container mx-auto px-20">
						<div style='background-color:rgb(255, 255, 255)'>
								<div class="mt-10 relative max-w-xl p-8 mx-auto mb-8 text-purple-800 bg-white rounded-md shadow-2xl" style="cursor: auto;">
								  <div class="items-center text-center xs:flex xs:text-left xs:space-x-10">
								  <c:if test="${empty hotel.img}">
								      <img class="rounded-lg shadow-md imgContainer w-24 h-full mx-auto mb-4 -mt-12 transform -translate-y-2 xs:mb-0 xs:mt-0 xs:mx-none md:w-32" src="${pageContext.request.contextPath}/img/hotel-test.png"  alt="${hotel.nombreHotel}" height="122" width="300px">
									</c:if>
									<c:if test="${not empty hotel.img}">
									      <img class="rounded-lg shadow-md imgContainer w-24 h-full mx-auto mb-4 -mt-12 transform -translate-y-2 xs:mb-0 xs:mt-0 xs:mx-none md:w-32" src="/recursos/${hotel.img}" alt="${hotel.nombreHotel}" height="122" width="300px">
									</c:if>
								
								    <div class="flex-1 leading-chillaxed">
						      <div class="mb-4">
								      <h2 class="text-lg leading-6 font-medium text-gray-900">
													Detalles del hotel <strong class="block text-lg">${hotel.nombreHotel}</strong>
												</h2>
												<p class="mt-1 max-w-2xl text-sm text-gray-500">
													Aquí puedes encontrar la información detallada del hotel.
												</p>
								      </div>
								      <ul>
								        <li>
								          <a href="tel:+31620842105" class="inline-block h-12 -my-4 xs:h-auto underline hover:no-underline">
								            <svg class="inline-block w-4 h-4 mr-3 opacity-40" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
								              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path>
								            </svg>${hotel.telefonoHotel}
								          </a>
								        </li>
								        <li>
								          <svg class="inline-block w-4 h-4 mr-3 opacity-40" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
								            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
								          </svg>
								          <a class="inline-block h-12 -my-4 xs:h-auto underline hover:no-underline" href="mailto:john@doe.com">${hotel.correoElectronicoHotel }</a>
								        </li>
								        <li>
								        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 22" stroke-width="1.5" stroke="currentColor" class="inline-block w-5 h-3 mr-3 -mt-1 opacity-40">
										  <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 11-6 0 3 3 0 016 0z" />
										  <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1115 0z" />
										</svg>
								          <p class="inline-block h-12 -my-4 xs:h-auto underline hover:no-underline" ><c:out value="${hotel.ciudadHotel}" /></p>
								        </li>
								      </ul>
								    </div>
								  </div>
								  <div class="absolute ${hotel.disponible == 1 ? 'bg-green-200 text-green-800' : 'bg-red-200 text-red-800'} bottom-0 left-0 w-full h-2 "></div>
								</div>
								</div>
			</div>	

			</div>
			<div class="w-1/3 p-4">
			<div  class="flex flex-wrap">
			<div class="w-full h-3/4 overflow-y-auto max-h-96">
				  <c:forEach var="comentario" items="${hotelesConComentarios}">
				    <h2 class="text-l font-bold">Autor: ${comentario.usuario.username}</h2>
				    <hr>
				    <div class="flex items-center bg-white shadow-md rounded-md overflow-hidden">
				      <div class="w-1/3">
				        <img class="h-full rounded-t-lg object-cover" src="/recursos/${hotel.img}" alt="imagen-hotel-${hotel.ciudadHotel}" />
				      </div>
				      <div class="w-2/3 p-3">
				        <p class="text-sm text-gray-500"> Fecha: ${comentario.fechaComentario}</p>
				        <p class="text-base">${comentario.mensaje}</p>
				      </div>
				    </div>
				  </c:forEach>
				</div>
				<div class=" w-full h-1/4" >
					<jsp:include page="altaComentario.jsp"></jsp:include>
				</div>
			</div>
			</div>		
		</div>
		<div class="container mx-auto mt-6 relative overflow-x-auto shadow-md sm:rounded-lg border-2  p-4 bg-white">
<h2 class="text-center text-3xl font-semibold mb-6">Habitaciones</h2>
	<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERADMIN')">
		<form method="GET" action="/habitacion/alta/${hotel.idHotel}">
		    <div class="flex justify-center">
		        <button type="submit"
		                class="flex mx-auto mt-5 text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">
		            Nueva habitación 
		        </button>
		    </div>
		</form>
	</sec:authorize>

	
	<div class="p-10 grid grid-cols-1 sm:grid-cols-1 md:grid-cols-1 lg:grid-cols-3 xl:grid-cols-3 gap-5">
		<c:forEach var="habitacion" items="${listaHabs}">
		
		
<div class="container mx-auto">
						<div style='background-color:rgb(255, 255, 255)'>
								<div class="mt-10 relative max-w-xl p-8 mx-auto mb-8 text-purple-800 bg-white rounded-md shadow-2xl" style="cursor: auto;">
								  <div class="items-center text-center xs:flex xs:text-left xs:space-x-10">
								    <a href="/habitacion/info/${habitacion.idHabitacion }">
								    <c:if test="${empty habitacion.img}">
								    <img class="rounded-t-lg " src="${pageContext.request.contextPath}/img/hotel-test.png" alt="imagen-hotel->${habitacion.nombreHabitacion}" style="max-width: 100%; height: 200px; width: 100%;"/>
									</c:if>
									<c:if test="${not empty habitacion.img}">
									  <img class="rounded-t-lg " src="/recursos/${habitacion.img}" alt="imagen-hotel->${habitacion.nombreHabitacion}" style="max-width: 100%; height: 200px; width: 100%;"/>
									</c:if>
									</a> 
								    <div class="flex-1 leading-chillaxed">
						      <div class="mb-4">
								    	<a href="/habitacion/info/${habitacion.idHabitacion}">
											<h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white" >${habitacion.nombreHabitacion} </h5>
										</a>
								      </div>
								      <ul>
								        <li>
								          <svg class="inline-block w-4 h-4 mr-3 opacity-40" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
											  <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 12l8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25" />
											</svg>
											${habitacion.tipoHabitacion}
								        </li>
								        <li>
								        <svg class="inline-block w-4 h-4 mr-3 opacity-40" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
 											<path stroke-linecap="round" stroke-linejoin="round" d="M21.752 15.002A9.718 9.718 0 0118 15.75c-5.385 0-9.75-4.365-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 003 11.25C3 16.635 7.365 21 12.75 21a9.753 9.753 0 009.002-5.998z" />
									</svg>${habitacion.precioNoche}&euro;
								        </li>
								        <li>
								        <div style="padding:10px">
									        <form method="GET" action="/reserva/reservar/${habitacion.idHabitacion}">
								                <button type="submit" class="flex mx-auto text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">
								                    Reservar
								                </button>
								            </form>
							            </div>
								        </li>
								      </ul>
								    </div>
								  </div>
								  <div class="absolute ${habitacion.disponible == 1 ? 'bg-green-200 text-green-800 ' : 'bg-red-200 text-red-800'} bottom-0 left-0 w-full h-2 "></div>
								</div>
								</div>
			</div>	
		</c:forEach>
	</div>
		</div>
	
</div>
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