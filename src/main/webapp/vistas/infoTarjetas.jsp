<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>R

	</title>
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body class="bg-gray-100">
	<jsp:include page="navbar.jsp"></jsp:include>
	
	
	<div  class="w-4/5 mx-auto">
	<c:if test="${not empty mensaje}">
	  <div id="alert" class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Atención!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	
<!--  Apartid de aquí -->	
	<button class="fixed bottom-4 mb-5 right-4 z-10 flex items-center justify-center text-white bg-ffc36d border-0 py-2 px-8 focus:outline-none hover:bg-yellow-300 rounded text-lg">
		<svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/></svg>
		<a href="/">Volver</a>
	</button>


<div class="text-center ml-2 inline-block">
    <button class="flex mx-auto mt-5 text-white bg-green-500 border-0 py-2 px-8 focus:outline-none hover:bg-green-600 rounded text-lg">
    	<a href="/tarjeta/alta">Nueva tarjeta</a>
    </button>
</div>
<div class="flex mt-10 flex-wrap">

  
    <c:forEach var="tarjeta" items="${todasTarjetas}">
    <div class="bg-white max-w-sm rounded overflow-hidden shadow-lg" style="margin: 2px;">
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
          <ul class="flex">
            <li class="mx-2">
              <img class="w-16" src="https://www.computop-paygate.com/Templates/imagesaboutYou_desktop/images/computop.png" alt="" />
            </li>
            <li class="mx-2">
              <img class="w-14" src="https://www.computop-paygate.com/Templates/imagesaboutYou_desktop/images/verified-by-visa.png" alt="" />
            </li>
            <li class="ml-5">
              <img class="w-7" src="https://www.computop-paygate.com/Templates/imagesaboutYou_desktop/images/mastercard-id-check.png" alt="" />
            </li>
          </ul>
        <div class="mt-4 p-4">
          	<h1 class="text-xl font-semibold text-gray-700 text-center">Tarjeta de crédito</h1>
         <div class="p-4">
		  <div class="my-3">
		    <label class="text-gray-700 font-bold" for="nombreTitular">Nombre del titular: </label>
		    <span class="text-gray-700" id="nombreTitular">${tarjeta.nombreTitular}</span>
		  </div>
		  <div class="my-3">
		    <label class="text-gray-700 font-bold" for="numeroTarjeta">Número de tarjeta: </label>
		    <span class="text-gray-700" id="numeroTarjeta">${tarjeta.numeroTarjeta}</span>
		  </div>
		  <div class="my-3 flex flex-col">
		    <label class="text-gray-700 font-bold" for="fechaCaducidad">Fecha de caducidad: </label>
		    <span class="text-gray-700" id="fechaCaducidad">${tarjeta.fechaCaducidad}</span>
		  </div>
		  <div class="my-3">
		    <label class="text-gray-700 font-bold" for="cvv">CVV: </label>
		    <span class="text-gray-700" id="cvv">${tarjeta.cvv}</span>
		  </div>
		  <a href="/tarjeta/editar/${tarjeta.idTarjetaBancaria}" class="inline-block w-auto mx-auto text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">Editar</a>
		  <a href="/tarjeta/eliminar/${tarjeta.idTarjetaBancaria}" class="inline-block w-auto mx-auto text-white bg-red-500 border-0 py-2 px-8 focus:outline-none hover:bg-red-600 rounded text-lg ml-4">Eliminar</a>
		</div>
       </div>
       </div>
    </c:forEach>


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