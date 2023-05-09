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
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	
	
	<div class="w-4/5 mx-auto">
	<c:if test="${not empty mensaje}">
	  <div id="alert" class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Atención!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	
<!--  Apartid de aquí -->	

 <body>
    <div class="m-4">
      <div class="credit-card w-full sm:w-auto shadow-lg mx-auto rounded-xl bg-white" x-data="creditCard">
        <header class="flex flex-col justify-center items-center">
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
        </header>
        <div class="mt-4 p-4">
          <h1 class="text-xl font-semibold text-gray-700 text-center">Card payment</h1>
          <form method="POST" action="/tarjeta/alta">
          <div class="">
            <div class="my-3">
              <input
                type="text"
                name="nombreTitular"
                class="block w-full px-5 py-2 border rounded-lg bg-white shadow-lg placeholder-gray-400 text-gray-700 focus:ring focus:outline-none"
                placeholder="Nombre del Titular"
                maxlength="22"
                x-model="cardholder"
              />
            </div>
            <div class="my-3">
              <input
              	name="numeroTarjeta"
                type="number"
                class="block w-full px-5 py-2 border rounded-lg bg-white shadow-lg placeholder-gray-400 text-gray-700 focus:ring focus:outline-none"
                placeholder="Numero de la tarjeta"
                maxlength="20"
                x-model="cardholder"
              />
            </div>
            <div class="my-3">
              <input
              	name="usuario"
              	readonly
                type="text"
                class="block w-full px-5 py-2 border rounded-lg bg-white shadow-lg placeholder-gray-400 text-gray-700 focus:ring focus:outline-none"
                value="${username }"
                x-model="cardNumber"
                x-on:keydown="format()"
                x-on:keyup="isValid()"
                maxlength="19"
              />
            </div>
            <div class="my-3 flex flex-col">
              <div class="mb-2">
                <label for="fechaCaducidad" class="text-gray-700">Fechad de caducidad</label>
              </div>
              	<input              	
              	id="fechaCaducidad"
              	name="fechaCaducidad"
                type="date"
                class="block w-full px-5 py-2 border rounded-lg bg-white shadow-lg placeholder-gray-400 text-gray-700 focus:ring focus:outline-none"
                placeholder="Fecha de caducidad"
                maxlength="22"
                x-model="cardholder"
              />
              <div class="my-3">              
              	<input              	
              	id="cvv"
              	name="cvv"
                type="number"
                class="block w-full px-5 py-2 border rounded-lg bg-white shadow-lg placeholder-gray-400 text-gray-700 focus:ring focus:outline-none"
                placeholder="cvv"
                maxlength="22"
                x-model="cardholder"
              />
              </div>
            </div>
        <div class="mt-6 p-4">
          <button
            class="flex mx-auto text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg"
            x-bind:disabled="!isValid"
            x-on:click="onSubmit()"
          >Alta tarjeta
          </button>
        </div>
      </div>
      </form>
    </div>
   
   
  </body>
</html>





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
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
</body>
</html>