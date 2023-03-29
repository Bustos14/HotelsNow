<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Lista de Hoteles</title>
	<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
	<div class="max-w-5xl mx-auto mt-10">
		<table class="min-w-full bg-white">
			<thead class="bg-gray-50">
				<tr class="border-b border-gray-200">
					<th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
						Nombre
					</th>
					<th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
						Dirección
					</th>
					<th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
						Ciudad
					</th><th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
						Email
					</th>
					<th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
						Telefono
					</th>
					<th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
						Disponibilidad
					</th>
		</tr>
		<c:forEach var="hotel" items="${listaHoteles}">
			<tr>
				<td class="px-6 py-4 whitespace-nowrap">${hotel.nombreHotel}</td>
				<td class="px-6 py-4 whitespace-nowrap">${hotel.direccionHotel}</td>
				<td class="px-6 py-4 whitespace-nowrap">${hotel.ciudadHotel}</td>
				<td class="px-6 py-4 whitespace-nowrap">${hotel.correoElectronicoHotel}</td>
				<td class="px-6 py-4 whitespace-nowrap">${hotel.telefonoHotel}</td>
				<td class="px-6 py-4 whitespace-nowrap">
					<c:if test="${hotel.disponible == 1}">
					   Disponible
					</c:if>
					<c:if test="${hotel.disponible == 0}">
					   No disponible
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
