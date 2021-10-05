<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.Connection"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
	<div class="table mt-12">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col">NIT</th>					
					<th scope="col">NOMBRE COMPLETO</th>
					<th scope="col">TELEFONO</th>
					<th scope="col">DIRECCION</th>
					<th scope="col">CIUDAD</th>

					
				</tr>
			</thead>
			<tbody>
			<%
			Conexion cn = new Conexion ();
			Connection con =null;
			Statement ps = null;
			ResultSet rs = null;
			try{
				 con = cn.getConnection();
				 ps = con.createStatement();
				
				String query="select * from proveedores";
				rs = ps.executeQuery(query);
				
				while (rs.next()){
			%>
			
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>

				<div class="btn-group" role="group" aria-label="Basic outlined example">
				  <td><a   type="button" style =" background-color:green;"  class="btn btn-outline-danger" href="eliminarProveedor.jsp">Eliminar</a></td>
				</div>
			</tr>
			<% }
				
			}catch(Exception e){
				System.out.println(e);
			}
			%>	
			</tbody>
		</table>
		<div><h6 class="text-center"><a style="color:GRAY"  href="principal.jsp">Volver a Inicio
	</div>
	<td><input  type="button" onclick="document.location.reload();" value = "Refrescar"  class = "btn btn-primary btn" > </td>
	<td><a   type="button" style =" background-color:green;"  class="btn btn-primary btn" href="editarProveedor.jsp">Editar Proveedores</a></td>
<body>

</body>
</html>