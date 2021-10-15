
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Nuestros Productos</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-6 col-md-4 col-lg-3">
			<form action="NuestrosProductos2.jsp">
				<div class="input-group my-3">					
					<input type="text" name="buscar" value="" class="form-control" placeholder="Buscar producto">
					<button class="btn btn-primary" type="submit">
						<i class="fas fa-search"></i>
					</button>				
				</div>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-12 text-center">
		<% 
			String msg=request.getParameter("msg");

			if ("valid".equals(msg)){
			%>
				<figure class="text-center">
				<strong class="text-center" style="color:#198754">
					Producto añadido al carrito correctamente! - Si el producto ya existía en Carrito, su cantidad fue incrementada. <a class="btn btn-outline-success" href="CarritoComprasUser.jsp">Ir al Carrito</a>
				</strong>
			<% } %>
			<%
			if ("invalid".equals(msg)){
			%>
				<figure class="text-center">
				<strong class="text-center" style="color:#dc3545">Error al añadir al Carrito de Compras. Inténtelo de nuevo!</strong>
		<% } %>
		</div>
	</div>
	<div class="row">
<%
Conexion cn = new Conexion ();
Connection con = null ;
Statement ps = null;
ResultSet rs = null;
try{
	String buscar = request.getParameter("buscar");
	con = cn.getConnection();
	 ps = con.createStatement();
	String query="select p.*,c.categoria,i.porcentaje_iva,e.estado from storetic.productos p, storetic.categorias c, storetic.iva i, storetic.estado e where p.id_categoria=c.id_categoria and p.id_iva=i.id_iva and e.id_estado = p.id_estado";
	if(buscar != null){
		query += " and (p.nombre_producto like '%"+buscar+"%')";
	}
	query += " order by p.codigo_producto, nombre_producto";
	rs = ps.executeQuery(query);
	
	while (rs.next()){
		String precioVenta = Long.toString(Math.round(rs.getInt(5)+(rs.getInt(5)*rs.getFloat(11))));
%>
	<div class="col-6 col-md-4 col-lg-3">
		<div class="card">
      <div class="card-body">
        <h5 class="card-title"><%=rs.getString("nombre_producto")%></h5>
        <p class="card-text">
        	<%=rs.getString("categoria")%> - $ <%=precioVenta%> Iva incl.
        </p>        
      </div>
      <div class="card-footer">
      	<form action="AgregarCarrito.jsp" method="post">
		   	<div class="input-group mb-3">
		   		<input type="hidden" id="codigo_producto" name="codigo_producto" value="<%=rs.getString("codigo_producto") %>" />
			  	<input type="number" id="cantidad" name="cantidad" min="1" value="1" required class="form-control" placeholder="Cantidad" aria-label="Recipient's username" aria-describedby="button-addon2">
			  	<button class="btn btn-success" type="submit" id="button-addon2" title="Agregar al carrito"><i class="fas fa-cart-plus"></i></button>
			</div>
		</form>
	  </div>
    </div>
	</div>
<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
		</div>
	</div>
</body>

</html>