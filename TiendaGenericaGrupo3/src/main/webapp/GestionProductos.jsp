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
					<th>CÓDIGO</th>
					<th>PRODUCTO</th>
					<th>NIT PROVEEDOR</th>
					<th>PRECIO ANTES DE IVA</th>
					<th>IVA</th>
					<th>PRECIO VENTA</th>
					
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
				
				String query="select * from productos";
				rs = ps.executeQuery(query);
				
				while (rs.next()){
			%>
			
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				
				<div class="btn-group" role="group" aria-label="Basic outlined example">
				  <td><a   type="button" style =" background-color:green;"  class="btn btn-outline-danger" href="eliminarProducto.jsp">Eliminar</a></td>
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
	<td><a   type="button" style =" background-color:green;"  class="btn btn-primary btn" href="editarProducto.jsp">Editar producto</a></td>
	<td><a   type="button" style =" background-color:blue;"  class="btn btn-primary btn" href="ProductoNuevo.jsp">Nuevo producto</a></td>
	
	<div align="center">
				
				<div class="container col-5">
					<div class="input-group mb-6 g-3">
						<form action="import.jsp" method="post" enctype="multipart/form-data">
							<input class= "form-control" type="file" name="file" size="50" accept=".csv" />					
							<input type="submit" value="Importar Archivo" />
						</form>
					</div>
				</div>
				<div class="container col-5">
					<div class="input-group mb-6 g-3">
						<form action="BuscarProducto.jsp">
							<input type="text" name="txtbuscar" class="form-control" placeholder="Buscar un producto por nombre">
							<input class="btn btn-outline-secondary" style =" background-color:blue;"  type="submit" value="Buscar">
						</form>
					</div>
					<p></p>
				</div>
							<% 
								String msg=request.getParameter("msg");

								if ("valid".equals(msg)){
							%>
								<figure class="text-center">
									<strong class="text-center" style="color:#198754">Archivo Cargado Existosamente!</strong>
							<% } %>
							<%
								if ("invalid".equals(msg)){
							%>
								<figure class="text-center">
									<strong class="text-center" style="color:#dc3545">Error: No se seleccionó archivo para cargar</strong>
							<% } %>
<body>

</body>
</html>