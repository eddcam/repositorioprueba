<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p align= "center" style="color:#0000ff"> ELIMINAR USUARIOS </p>
	<form action="eliminarUsuarioApi.jsp"  method= POST>
	<table>
	
		<tr>
		<td><label>Documento de identificación :</label></td>
		<td><input type = "text" name = "cedula_usuario" class = "form-control"  placeholder = "Digite Documento" required> </td> 
		</tr>
			
		<tr>
		<td><input style="background-color:DodgerBlue;color:#FFFFFF;border:DodgerBlue" type = "submit" name = "accion" value = "Eliminar"  class = "btn btn-primary btn "> </td>
		</tr>
		
	</table>
	<div><h6 class="text-center"><a style="color:GRAY"  href="GestionUsuarios.jsp">Volver a Gestión Usuarios</a></h6></div>
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