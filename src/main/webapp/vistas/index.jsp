<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bienvenido a HotelsNow</title>
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css"
	rel="stylesheet">
</head>
<body>


	<jsp:include page="navbar.jsp"></jsp:include>

	<br />
	<br />
	<br />
	<br />

	<div
		class="p-10 grid grid-cols-1 sm:grid-cols-1 md:grid-cols-3 lg:grid-cols-3 xl:grid-cols-3 gap-5">

		<c:forEach var="hotel" items="${listaHoteles}">
			<div
				class="max-w-sm bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
				<a href="#"> <img class="rounded-t-lg" src="${pageContext.request.contextPath}/img/hotel-test.jpg" alt="" />
				</a>
				<div class="p-5">
					<a href="#">
						<h5
							class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">${hotel.nombreHotel}</h5>
					</a>
					<p class="mb-3 font-normal text-gray-700 dark:text-gray-400">${hotel.ciudadHotel}</p>
					<p class="mb-3 font-normal text-gray-700 dark:text-gray-400">${hotel.direccionHotel}</p>
					<a href="#"
						class="inline-flex items-center justify-center px-3 py-2 text-sm font-medium text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
						+ INFO <svg aria-hidden="true" class="w-4 h-4 ml-2 -mr-1"
							fill="currentColor" viewBox="0 0 20 20"
							xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd"
								d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
								clip-rule="evenodd"></path>
      </svg>
					</a>
				</div>
			</div>

		</c:forEach>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
</body>
</html>