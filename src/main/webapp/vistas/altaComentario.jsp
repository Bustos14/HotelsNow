<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>
		Alta hotel
	</title>
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css"
	rel="stylesheet">
</head>
<body>

<div class="p-10">
<c:if test="${not empty mensaje}">
	  <div id="alert" class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">¡Atención!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	
  <h1 class="text-2xl font-bold mb-5">Dar de alta un comentario</h1>
  <form method="post" action="/comentario/altaComentario">
    <div class="mb-5">
      <label for="mensaje" class="block font-bold mb-2">Comentario:</label>
      <textarea name="mensaje" id="mensaje" rows="5" cols="30" class="w-full rounded-lg border border-gray-400 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" oninput="checkTextarea()"></textarea>
      <div id="mensaje-error" class="text-red-500 mt-1 ">Introduce al menos 10 caracteres</div>
	</div>
    <input type="hidden" name="idHotel" value='${comentarioNuevo.hotele.idHotel}'/>
    <input type="hidden" name="username" value='${comentarioNuevo.usuario.username}'/>
    <button type="submit" id="guardar-btn" class="bg-indigo-500 hover:bg-indigo-600 text-white font-bold py-2 px-4 rounded" disabled>Guardar comentario</button>
  </form>
</div>

    
      
<script>
function checkTextarea() {
  const textarea = document.getElementById('mensaje');
  const botonGuardar = document.getElementById('guardar-btn');
  const mensajeError = document.getElementById('mensaje-error');
  
  if (textarea.value.trim().length >= 10) {
    botonGuardar.disabled = false;
    mensajeError.classList.add('hidden');
  } else {
    botonGuardar.disabled = true;
    mensajeError.classList.remove('hidden');
  }
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
</body>
</html>