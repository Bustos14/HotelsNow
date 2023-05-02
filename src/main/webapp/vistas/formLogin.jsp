<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registro/inicio</title>
<link href="https://unpkg.com/tailwindcss@2.2.7/dist/tailwind.min.css"
	rel="stylesheet">
</head>
<body style="background-color: #eee;">
<section class="h-100 gradient-form" >
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-10">
        <div class="card rounded-3 text-black">
              <div class="card-body p-md-5 mx-md-4">

                <div class="text-center">
                  <img src="${pageContext.request.contextPath}/img/logo.png" 
                    style="width: 185px;" alt="logo">
                  <h4 class="mt-1 mb-5 pb-1">Bienvenido</h4>
					<h3 class="text-danger">${mensaje }</h3>
                </div>

                <form name="form" action="/login" method="POST">

                  <div class="form-outline mb-4">
                  <label class="form-label" for="email">Nombre de usuario</label>
                  <input type="text" name="email" class="form-control" id="username">
              
                  </div>

                  <div class="form-outline mb-4">
                     <label class="form-label" for="contrasena">Contraseña</label>
                    <input type="password" id="contrasena" class="form-control"  name="contrasena"/>
              
                  </div>

                  <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2">¿No tienes cuenta aún? <a href="/registroInvitado" type="button">Regístrate </a></p>          
                  </div>
                   <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2">O accede como <a href="/" type="button">Invitado</a></p>           
                  </div>
                  <div class="text-center pt-1 mb-5 pb-1">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Inicia sesión</button>
                  </div>
                </form>
              </div>
            </div>
            </div>
          </div>
        </div>
  </div>
</section>
</body>
</html>