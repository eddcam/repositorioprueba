<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inicio de Sesión</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
	<div class="container">
		<div class="form-container">
			<h2>Inicio de sesión</h2>
			<form id="formLogin" action="login" method="post">
				<input type="hidden" name="tipo" value="iniciarSesion" />
				<div class="form-group">
					<label for="nombre">Usuario</label>
					<input type="text" class="form-control" name="usuario" placeholder="Nombre de usuario" />
				</div>
				
				<div class="form-group">
					<label for="clave">Clave</label>
					<input type="password" class="form-control" name="password" placeholder="Contraseña" />
				</div>
				
				<button type="submit" class="btn btn-success btn-block btn-lg">Iniciar sesión</button>
				<div>
					<p>
						<%
							String resultado = (String)request.getAttribute("mensaje");
							String mensaje = "";
							if (resultado != null) {
								mensaje = resultado;
							}
						%>
						<%=mensaje %>
					</p>
				</div>
			</form>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>