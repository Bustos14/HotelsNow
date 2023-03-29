<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Hoteles</title>
</head>
<body>
	<table>
		<tr>
			<th>Nombre</th>
			<th>Dirección</th>
			<th>Ciudad</th>
		</tr>
		<c:forEach var="hotel" items="${listaHoteles}">
			<tr>
				<td>${hotel.nombreHotel}</td>
				<td>${hotel.direccionHotel}</td>
				<td>${hotel.ciudadHotel}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
