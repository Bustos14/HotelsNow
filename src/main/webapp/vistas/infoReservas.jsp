<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>

	</title>
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	
	
	<div class="w-4/5 mx-auto">
	<c:if test="${not empty mensaje}">
	  <div class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
	    <strong class="font-bold">�Atenci�n!</strong>
	    <span class="block sm:inline">${mensaje}</span>
	  </div>
	</c:if>
	
<!--  Apartid de aqu� -->	

<table class="mt-6 min-w-full divide-y divide-gray-200">
  <thead class="bg-gray-50">
    <tr>
      <th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Fecha de llegada</th>
      <th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Fecha de salida</th>
      <th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">N�mero de huespedes</th>
      <th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Total a pagar</th>
      <th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Hotel</th>
    </tr>
  </thead>
  <tbody class="bg-white divide-y divide-gray-200">
    <c:forEach var="reserva" items="${reservas}">
      <tr>
        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500"><c:out value="${reserva.fechaLlegada}"/></td>
        <td class="px-6 py-4 text-center whitespace-nowrap text-sm font-medium text-gray-900"><c:out value="${reserva.fechaSalida}"/></td>
        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500"><c:out value="${reserva.numeroHabitaciones}"/></td>
        <td class="px-6 py-4 text-center whitespace-nowrap text-sm font-medium text-gray-900"><c:out value="${reserva.totalPagar}"/></td>
        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500"><c:out value="${reserva.hotele.nombreHotel}"/></td>
      </tr>
    </c:forEach>
    <c:if test="${empty comentarios}">
      <tr>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500" colspan="3"><c:out value="${mensaje}"/></td>
      </tr>
    </c:if>
  </tbody>
</table>






<!-- No borrar </div> -->
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
</body>
</html>