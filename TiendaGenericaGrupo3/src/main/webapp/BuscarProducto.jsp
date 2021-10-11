
<%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>Gestión Proveedores</title>
</head>
<body>
	<div class="table mt-12">
		<table class="table table-responsive table-striped table-hover">
			<style>
			 table { table-layout: fixed; }
			 table th, table td { overflow: hidden; }
			</style>
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
				String nombuscar=request.getParameter("txtbuscar");
				
				String query="Select * from productos where nombre_producto like '%" + nombuscar + "%' or codigo_producto like'%"+nombuscar+"%'or nitproveedor like'%"+nombuscar+"%'or precio_compra like'%"+nombuscar+"%'or precio_venta like'%"+nombuscar+"%'" + "order by codigo_producto, nombre_producto";
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
				  <td><a type="button" style =" background-color:blue;" class="btn btn-outline-success" href="editarProducto.jsp?codigo_producto=<%=rs.getString(1)%>">Editar</a></td>
				
				</div>			
    		</tr>
			<%
				}
			}catch(Exception e){
				System.out.println(e);
			}
			%>
			</tbody>
    			<div>
    			<p></p>
      				<div><h6 class="text-center"><a style="color:gray"  href="GestionProductos.jsp">Volver a Gestión de Productos</a></h6></div>
    			</div>
		</table>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
		integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"
		integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/"
		crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>