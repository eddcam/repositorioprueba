<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<p align= "center"> REGISTRO DE USUARIOS </p>
	<form action="UsuarioNuevoApi.jsp"  method= POST>
	<table>
	
		<tr>
		<td><label>Documento de identificación :</label></td>
		<td><input type = "text" name = "cedula_usuario" class = "form-control"  placeholder = "Digite Documento" required> </td> 
		</tr>
	
		
		
   		<tr>
		<td><label>Email :</label></td>
		<td><input type = "text" name = "email_usuario" class = "form-control"  placeholder = "Digite Email" required> </td>
		</tr>
		
		
		
		<tr>
		<td><label>Nombre Completo :</label></td>
		<td><input type = "text" name = "nombre_usuario" class = "form-control"  placeholder = "Digite Nombre " required> </td>
		</tr>
		
		
		
		<tr>
		<td><label>Contraseña :</label></td>
		<td><input type = "text" name = "password" class = "form-control"  placeholder = "Digite Contraseña " required> </td>
		</tr>
		
		
		
		<tr>
		<td><label>Nombre de Usuario :</label></td>
		<td><input type = "text" name = "usuario" class = "form-control"  placeholder = "Digite Usuario " required> </td>
		</tr>
		
		
		<tr>
		<td><input type = "submit" name = "accion" value = "Registrar"  class = "btn btn-primary btn "> </td>
		</tr>
		
	</table>
	</form>
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
</body>
</html>