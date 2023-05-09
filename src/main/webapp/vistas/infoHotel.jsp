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
	
	<div class="w-4/5 mx-auto">
	
	<c:if test="${not empty mensaje}">
	  <div id="alert" class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Atención!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	
		<button class="fixed bottom-4 mb-5 right-4 z-10 flex items-center justify-center text-white bg-ffc36d border-0 py-2 px-8 focus:outline-none hover:bg-yellow-300 rounded text-lg">
			<svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/></svg>
			<a href="/">Volver</a>
		</button>
	
	
		<div class="bg-white rounded-lg shadow overflow-hidden">
	<div class="flex items-center bg-white shadow-md rounded-md overflow-hidden">
			<div class="w-2/3">
			<div class="container mx-auto mt-8 max-w-3xl">
				<div class="bg-white rounded-lg shadow overflow-hidden">
			<div class="px-4 py-5 sm:px-6">
				<h2 class="text-lg leading-6 font-medium text-gray-900">
					Detalles del hotel <span class="text-lg font-bold">${hotel.nombreHotel}</span>
				</h2>
				<p class="mt-1 max-w-2xl text-sm text-gray-500">
					Aquí puedes encontrar la información detallada del hotel.
				</p>
			</div>
			<div class="border-t border-gray-200">
				<dl>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
						<img class="h-auto max-w-lg rounded-lg" src="/recursos/${hotel.img}" alt="image description">
					</div>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
						<dt class="text-sm font-medium text-gray-500">
							Nombre:
						</dt>
						<dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-1">
							<c:out value="${hotel.nombreHotel}" />
						</dd>
					</div>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
						<dt class="text-sm font-medium text-gray-500">
							Ciudad:
						</dt>
						<dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-1">
							<c:out value="${hotel.ciudadHotel}" />
						</dd>
					</div>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
						<dt class="text-sm font-medium text-gray-500">
							Dirección:
						</dt>
						<dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-1">
							<c:out value="${hotel.direccionHotel}" />
						</dd>
					</div>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
						<dt class="text-sm font-medium text-gray-500">
							Teléfono:
						</dt>
						<dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-1">
							<c:out value="${hotel.telefonoHotel}" />
						</dd>
					</div>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
						<dt class="text-sm font-medium text-gray-500">
							Correo Electrónico:
						</dt>
						<dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-1">
							<c:out value="${hotel.correoElectronicoHotel }" />
						</dd>
					</div>
					<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
					    <dt class="text-sm leading-5 font-medium text-gray-500">
					    	Disponibilidad
					    </dt>
					    <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-1">
					        <span class="${hotel.disponible == 1 ? 'bg-green-200 text-green-800' : 'bg-red-200 text-red-800'} font-bold py-1 px-3 rounded-full">
					            ${hotel.disponible == 1 ? 'Disponible' : 'No disponible'}
					        </span>
					    </dd>
					</div>
		
				</dl>
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
		<div class="container mx-auto mt-6 relative overflow-x-auto shadow-md sm:rounded-lg border-2 border-gray-500 p-4 mb-4">

	<h2 class="text-center text-3xl font-semibold mb-6">Habitaciones</h2>
	
	<form method="GET" action="/habitacion/alta/${hotel.idHotel}">
	    <div class="flex justify-center">
	        <button type="submit"
	                class="flex mx-auto mt-5 text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">
	            Nueva habitación 
	        </button>
	    </div>
	</form>
	<div class="p-10 grid grid-cols-1 sm:grid-cols-1 md:grid-cols-1 lg:grid-cols-3 xl:grid-cols-3 gap-5">
		<c:forEach var="habitacion" items="${listaHabs}">
			<div class="bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 sm:w-full">
				<a href="/habitacion/info/${habitacion.idHabitacion }">
					<img class="rounded-t-lg " src="/recursos/${habitacion.img}" alt="imagen-hotel->${habitacion.nombreHabitacion}" style="max-width: 100%; height: 300px; width: 100%;"/>
				</a> 
				<div class="p-5">      
					<a href="/habitacion/info/${habitacion.idHabitacion}">
						<h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white" >${habitacion.nombreHabitacion} </h5>
					</a>
					<p class="mb-3 font-normal text-gray-700 dark:text-gray-400">${habitacion.tipoHabitacion}</p>
					<p class="mb-3 font-normal text-gray-700 dark:text-gray-400">${habitacion.precioNoche}&euro;</p>
				</div>
<div class="px-4 py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
    <div class="mt-2 flex justify-start">    
        <div class="flex items-center space-x-2">
            <p class="text-gray-600 dark:text-gray-300 text-sm ">
                <span class="${habitacion.disponible == 1 ? 'bg-green-200 text-green-800 ' : 'bg-red-200 text-red-800'} font-bold py-1 px-3 rounded-full">
                    ${habitacion.disponible == 1 ? 'Disponible' : 'No_disponible'}
                </span>
            </p>
            <div class="flex flex-col justify-center">
            <form method="GET" action="/reserva/reservar/${habitacion.idHabitacion}">
                <button type="submit" class="flex mx-auto text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">
                    Reservar
                </button>
            </form>
            <form method="GET" action="/habitacion/info/${habitacion.idHabitacion}">
                <button type="submit" class="flex mx-auto mt-2 text-white bg-green-500 border-0 py-2 px-8 focus:outline-none hover:bg-green-600 rounded text-lg">
                    Detalles
                </button>
            </form>
            </div>
        </div>
    </div>
</div>
			</div>
		</c:forEach>
	</div>
		</div>
	
	
	
	
	
	
	
	
	---------------------------------------------
	
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