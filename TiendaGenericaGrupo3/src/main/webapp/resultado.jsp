<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import = 'java.util.Date' %>
<%@ page import = 'entidad.UsuarioVO' %>
<%@ page import = 'java.util.ArrayList' %>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<p align= "center">
		LISTADO DE USUARIOS </p>
	<p align= "center">
		Hora servidor es <%= new Date () %>	</p>
		
	<table>
		<tr>
			<td><label>Cedula</label></td>
			<td><label>Nombre</label></td>
			<td><label>Correo</label></td>
			<td><label>Usuario</label></td>
			<td><label>Password</label></td>
		</tr>
		<%
		ArrayList <UsuarioVO> lista = (ArrayList <UsuarioVO> ) request.getAttribute("lista");
		for (UsuarioVO usuario : lista){
		%>
	
		
		<tr>
		   <td><%=usuario.getCedula_usuario() %></td>
		   <td><%=usuario.getNombre_usuario() %></td>
		   <td><%=usuario.getEmail_usuario() %></td>
		   <td><%=usuario.getUsuario() %></td>
		   <td><%=usuario.getPassword() %></td>
		</tr>
		<%
		}
		%>   
	</table>			
</body>
</html>