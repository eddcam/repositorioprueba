<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p align= "center"> ELIMINAR USUARIOS </p>
	<form action="eliminarUsuarioApi.jsp"  method= POST>
	<table>
	
		<tr>
		<td><label>Documento de identificaci�n :</label></td>
		<td><input type = "text" name = "cedula_usuario" class = "form-control"  placeholder = "Digite Documento" required> </td> 
		</tr>
			
		<tr>
		<td><input type = "submit" name = "accion" value = "Eliminar"  class = "btn btn-primary btn "> </td>
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