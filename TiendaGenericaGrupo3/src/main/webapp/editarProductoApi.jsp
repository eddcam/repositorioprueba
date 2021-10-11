
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.Connection"%>

<%

String codigo_producto=request.getParameter("codigo_producto");
String nombre_producto=request.getParameter("nombre_producto");
String nitproveedor=request.getParameter("nitproveedor");
String precio_compra=request.getParameter("precio_compra");
String ivacompra=request.getParameter("ivacompra");
String precio_venta=request.getParameter("precio_venta");


int check=0;
Conexion cn = new Conexion ();
Connection con = null ;
Statement ps = null;
ResultSet rs = null;

try{
	con = cn.getConnection();
	 ps = con.createStatement();
	String query="select * from productos where codigo_producto='" + codigo_producto + "'";
	 rs=ps.executeQuery(query);
	
	while (rs.next()){
		check=1;
		String sql="update productos set nombre_producto='" + nombre_producto + "',nitproveedor='" + nitproveedor +"',precio_compra='" + precio_compra + "',ivacompra='" + ivacompra +"',precio_venta='" + precio_venta + "' where codigo_producto ='" + codigo_producto + "'";
		ps.executeUpdate(sql);
		request.setAttribute("mensaje", "Producto actualizado con exito");
		response.sendRedirect("editarProducto.jsp?msg=done");
	}
	
	if (check==0){
		request.setAttribute("mensaje", "Usuario no encontrado");
		response.sendRedirect("editarProducto.jsp?msg=invalid");
	}
	rs.close();
	ps.close();
}catch(Exception e){
	System.out.println(e);
}
%>