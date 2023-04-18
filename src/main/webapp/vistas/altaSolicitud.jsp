<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Solicitud de administración</title>
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css"
	rel="stylesheet">
</head>
<body>

	<!-- component -->
<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.js" defer></script>

<div class="container max-w-full mx-auto md:py-24 px-6">

<c:if test="${not empty mensaje}">
	  <div id="alert" class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Atención!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>

<div class="container mx-auto">
 <div class="relative flex flex-wrap">
            <div class="w-full relative">
                <div class="md:mt-6">
                
                    <div class="flex items-center justify-center mt-8">
					  <img src="${pageContext.request.contextPath}/img/hotel-test.png" class="h-6 mr-3 sm:h-9" alt="logo HotelsNow">
					  <div class="text-center font-semibold text-black">
					    Bienvenido a HotelsNow
					  </div>
					</div>
                    <div class="text-center font-base text-black">
                        ¡Solicita tu registro como administrador aqui!
                    </div>
                  </div>
             </div>
             </div>
             </div>
 <form class="mt-8" x-data="{password: '',password_confirm: ''}" method="POST" action="/solicitud/altaSolicitud">
  <div class="grid grid-cols-4 gap-6">
    <div>1</div>
    <div><div class="max-w-sm mx-auto px-6">
  
        <div class="relative flex flex-wrap">
            <div class="w-full relative">
                <div class="md:mt-6">
                        <div class="mx-auto max-w-lg ">
                            <div class="py-1">
                                <span class="block text-gray-700 text-sm font-bold mb-2">Nombre</span>
                                <input placeholder="" type="text" name = "nombre"
                                       class="text-md block px-3 py-2 rounded-lg w-full
                bg-white border-2 border-gray-300 placeholder-gray-600 shadow-md focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none">
                            </div>
                            <div class="py-1">
                                <span class="block text-gray-700 text-sm font-bold mb-2">Username</span>
                                <input placeholder="" type="text" name="username"
                                       class="text-md block px-3 py-2 rounded-lg w-full
                bg-white border-2 border-gray-300 placeholder-gray-600 shadow-md focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none">
                            </div>
                            <div class="py-1">
                                <span class="block text-gray-700 text-sm font-bold mb-2">Password</span>
                                <input placeholder="" type="password" x-model="password" name="contrasena"
                                       class="text-md block px-3 py-2 rounded-lg w-full
                bg-white border-2 border-gray-300 placeholder-gray-600 shadow-md focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none">
                            </div>
                            <div class="py-1">
                                <span class="block text-gray-700 text-sm font-bold mb-2">Confirmar Password</span>
                                <input placeholder="" type="password" x-model="password_confirm"
                                       class="text-md block px-3 py-2 rounded-lg w-full
                bg-white border-2 border-gray-300 placeholder-gray-600 shadow-md focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none">
                            </div>
                            <div class="flex justify-start mt-3 ml-4 p-1">
                                <ul>
                                    <li class="flex items-center py-1">
                                        <div :class="{'bg-green-200 text-green-700': password == password_confirm && password.length > 0, 'bg-red-200 text-red-700':password != password_confirm || password.length == 0}"
                                             class=" rounded-full p-1 fill-current ">
                                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path x-show="password == password_confirm && password.length > 0" stroke-linecap="round"
                                                      stroke-linejoin="round" stroke-width="2"
                                                      d="M5 13l4 4L19 7"/>
                                                <path x-show="password != password_confirm || password.length == 0" stroke-linecap="round"
                                                      stroke-linejoin="round" stroke-width="2"
                                                      d="M6 18L18 6M6 6l12 12"/>

                                            </svg>
                                        </div>
                                        <span :class="{'text-green-700': password == password_confirm && password.length > 0, 'text-red-700':password != password_confirm || password.length == 0}"
                                              class="font-medium text-sm ml-3"
                                              x-text="password == password_confirm && password.length > 0 ? 'Las contraseñas coinciden' : 'Las contraseñas no coinciden' "></span>
                                    </li>
                                    <li class="flex items-center py-1">
                                        <div :class="{'bg-green-200 text-green-700': password.length > 7, 'bg-red-200 text-red-700':password.length < 7 }"
                                             class=" rounded-full p-1 fill-current ">
                                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path x-show="password.length > 7" stroke-linecap="round"
                                                      stroke-linejoin="round" stroke-width="2"
                                                      d="M5 13l4 4L19 7"/>
                                                <path x-show="password.length < 7" stroke-linecap="round"
                                                      stroke-linejoin="round" stroke-width="2"
                                                      d="M6 18L18 6M6 6l12 12"/>

                                            </svg>
                                        </div>
                                        <span :class="{'text-green-700': password.length > 7, 'text-red-700':password.length < 7 }"
                                              class="font-medium text-sm ml-3"
                                              x-text="password.length > 7 ? 'Se alcanza la longitud mínima' : 'Se requieren al menos 8 caracteres' "></span>
                                    </li>
                                </ul>
                            </div>      
                        </div>
                     </div>
            </div>
        </div>
    </div></div>
    <div>
     <div class="mb-4">
      <label class="block text-gray-700 text-sm font-bold mb-2" for="nombre-hotel">
        Nombre del hotel
      </label>
      <input class="text-md block px-3 py-2 rounded-lg w-full
                bg-white border-2 border-gray-300 placeholder-gray-600 shadow-md focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none" id="nombre-hotel" name="nombreHotel" type="text" placeholder="Ingrese el nombre del hotel">
    </div>
    <div class="mb-4">
    <label class="block text-gray-700 text-sm font-bold mb-2" for="ciudad-hotel">
        Ciudad del hotel
    </label>
    <select class="text-md block px-3 py-2 rounded-lg w-full
                bg-white border-2 border-gray-300 placeholder-gray-600 shadow-md focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none" id="ciudad-hotel" name="ciudadHotel">
        <c:forEach items="${provincias}" var="provincia">
            <option value="${provincia}">${provincia}</option>
        </c:forEach>
    </select>
	</div>
    <div class="mb-4">
      <label class="block text-gray-700 text-sm font-bold mb-2" for="direccion-hotel">
        Dirección del hotel
      </label>
      <input class="text-md block px-3 py-2 rounded-lg w-full
                bg-white border-2 border-gray-300 placeholder-gray-600 shadow-md focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none" id="direccion-hotel" name="direccionHotel" type="text" placeholder="Ingrese la dirección del hotel">
    </div>    
    <div class="mb-4">
      <label class="block text-gray-700 text-sm font-bold mb-2" for="correo-electronico-hotel">
        Correo electrónico del hotel
      </label>
      <input class="text-md block px-3 py-2 rounded-lg w-full
                bg-white border-2 border-gray-300 placeholder-gray-600 shadow-md focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none" id="correo-electronico-hotel" name="correoElectronicoHotel" type="email" placeholder="Ingrese el correo electrónico del hotel">
    </div>
    <div class="mb-4">
      <label class="block text-gray-700 text-sm font-bold mb-2" for="telefono-hotel">
        Teléfono del hotel
      </label>
      <input class="text-md block px-3 py-2 rounded-lg w-full
                bg-white border-2 border-gray-300 placeholder-gray-600 shadow-md focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none" id="telefono-hotel" name="telefonoHotel" type="text" placeholder="Ingrese el teléfono del hotel">
       <label class="block text-gray-700 text-sm font-bold mb-2" for="img">
        Imagen de referencia
      </label>
      <input class="text-md block px-3 py-2 rounded-lg w-full
                bg-white border-2 border-gray-300 placeholder-gray-600 shadow-md focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none" id="img" name="file" type="file">
    </div>
    </div>
            </div>
        </div>
    </div></div>
    <div></div>
  </div>
  <button class="mt-3 text-lg font-semibold
            bg-gray-800 w-full text-white rounded-lg
            px-6 py-3 block shadow-xl hover:text-white hover:bg-black"
        x-bind:disabled="password.length < 8 || password.length > 20 || password != password_confirm" type ="submit">
                                Enviar solicitud
                            </button>
                        </div>
                    <div class="text-sm font-semibold block  py-6 flex justify-center">
                        <a href="/login"
                           class="text-black font-normal border-b-2 border-gray-200 hover:border-teal-500">¿Ya eres miembro?
                            <span class="text-black font-semibold">
					            Acceder
					        </span>
                        </a>
                    </div>
  </form>
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