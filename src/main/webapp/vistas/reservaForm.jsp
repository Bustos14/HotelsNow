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


<!-- component -->
<div class="flex items-center justify-center p-12">
  <!-- Author: FormBold Team -->
  <!-- Learn More: https://formbold.com -->
  <div class="mx-auto w-full max-w-[550px]">
    <form action="/reserva/reservar" method="POST">
      <div class="-mx-3 flex flex-wrap">
      </div>
      <div class="mb-5">
        <label
          for="guest"
          class="mb-3 block text-base font-medium text-[#07074D]"
        >
          ¿Cuantas personas se hospedan?
        </label>
        <input
          type="number"
          name="huesped"
          id="guest"
          placeholder="2"
          min="1"
          class="w-full appearance-none rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
          required
        />
      </div>

      <div class="-mx-3 flex flex-wrap">
        <div class="w-full px-3 sm:w-1/2">
          <div class="mb-5">
            <label
              for="date"
              class="mb-3 block text-base font-medium text-[#07074D]"
            >
              Fecha de entrada
            </label>
            <input
              type="date"
              id="date"
              class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"ç
              name="entrada"
              required
            />
          </div>
        </div>
        <div class="w-full px-3 sm:w-1/2">
          <div class="mb-5">
            <label
              for="date"
              class="mb-3 block text-base font-medium text-[#07074D]"
            >
              Fecha de salida
            </label>
            <input
              type="date"
              id="date"
              class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
              name="salida"
              required
            />
          </div>
        </div>
        <div class="w-full px-3 sm:w-1/2">
          <div class="mb-5">
            <label
              for="time"
              class="mb-3 block text-base font-medium text-[#07074D]">
              Hora de llegada aproximada
            </label>
            <input
              type="time"
              id="time"
              class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
              name="checkin"
              required
            />
          </div>
        </div>
      </div>


      <div>
        <button
          class="hover:shadow-form rounded-md bg-green-300 py-3 px-8 text-center text-base font-semibold text-black outline-none"
        >
          Reservar
        </button>
      </div>
    </form>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
</body>
</html>