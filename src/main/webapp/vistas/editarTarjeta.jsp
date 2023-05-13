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
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body class="bg-gray-100">
	<jsp:include page="navbar.jsp"></jsp:include>
	
	
	<div  class="w-4/5 mx-auto">
	<c:if test="${not empty mensaje}">
	  <div id="alert"  class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Atención!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	
<!--  Apartid de aquí -->	
<div class="p-8 mt-10 bg-white">

<div class="flex flex-col items-center justify-center h-full">


<button class="fixed bottom-4 mb-5 right-4 z-10 flex items-center justify-center text-white bg-ffc36d border-0 py-2 px-8 focus:outline-none hover:bg-yellow-300 rounded text-lg">
			<svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/></svg>
			<a href="/">Volver</a>
		</button>
		

    		 <div
            class="relative"
            x-show="card === 'front'"
            x-transition:enter="transition ease-out duration-300"
            x-transition:enter-start="opacity-0 transform scale-90"
            x-transition:enter-end="opacity-100 transform scale-100"
          >
            <img class="w-full h-auto" src="https://www.computop-paygate.com/Templates/imagesaboutYou_desktop/images/svg-cards/card-visa-front.png" alt="front credit card">
            <div class="front bg-transparent text-lg w-full text-white px-12 absolute left-0 bottom-12">
              <p class="number mb-5 sm:text-xl" x-text="cardNumber !== '' ? cardNumber : '0000 0000 0000 0000'"></p>
              <div class="flex flex-row justify-between">
                <p x-text="cardholder !== '' ? cardholder : 'Card holder'"></p>
                <div class="">
                  <span x-text="expired.month"></span>
                  <span x-show="expired.month !== ''">/</span>
                  <span x-text="expired.year"></span>
                </div>
              </div>
            </div>
          </div>
  <h3 class="text-3xl font-bold text-gray-800 mb-4">Propietario de la tarjeta: ${tarjetaEditar.usuario.username}</h3>
</div>


<form class="w-full max-w-lg mx-auto" method="post" action="/tarjeta/editar">
  <input type="hidden" name="idTarjetaBancaria" value="${tarjetaEditar.idTarjetaBancaria}" />
  
  <div class="mb-4">
    <label class="block text-gray-700 font-bold mb-2" for="cvv">CVV:</label>
    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" type="number" name="cvv" value="${tarjetaEditar.cvv}" />
  </div>

  <div class="mb-4">
    <label class="block text-gray-700 font-bold mb-2" for="fechaCaducidad">Fecha de caducidad:</label>
    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" type="date" name="fechaCaducidad" value="${tarjetaEditar.fechaCaducidad}" />
  </div>

  <div class="mb-4">
    <label class="block text-gray-700 font-bold mb-2" for="nombreTitular">Nombre del titular:</label>
    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" type="text" name="nombreTitular" value="${tarjetaEditar.nombreTitular}" />
  </div>

  <div class="mb-4">
    <label class="block text-gray-700 font-bold mb-2" for="numeroTarjeta">Número de tarjeta:</label>
    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" type="text" name="numeroTarjeta" value="${tarjetaEditar.numeroTarjeta}" />
  </div>

  <div class="mb-4">
    <input type="hidden" name="usuario" value="${tarjetaEditar.usuario.username}" />
  </div>

  <div class="flex items-center justify-center">
    <input class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit" value="Guardar cambios" />
  </div>
</form>
<div class="flex items-center justify-center mt-3">
  <a href="/usuario/misTarjetas/${tarjetaEditar.usuario.username}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Volver atrás</a>
</div>

</div>






<!-- No borrar </div> -->
	</div>
	
<script>
  // Obtener el elemento del alert
  const alert = document.getElementById('alert');

  // Ocultar el alert después de 3 segundos (3000 ms)
  setTimeout(function() {
    alert.style.display = 'none';
  }, 3000);
  
</script>
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