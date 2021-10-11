<%@page import="javax.swing.JOptionPane"%>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.Statement"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "conexion.Conexion"%>




<%

String codigo_producto=request.getParameter("codigo_producto");
String nombre = request.getParameter("nombre_producto");
String nitproveedor = request.getParameter("nitproveedor");
String precio = request.getParameter("precio_compra");
String iva = request.getParameter("ivacompra");
String precio_venta = request.getParameter("precio_venta");
Conexion cn = new Conexion ();
Connection con =null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
	 con = cn.getConnection();
	 String sql = "insert into productos values (?,?,?,?,?,?)";
	 ps= con.prepareStatement(sql);
	 ps.setInt(1, Integer.parseInt(codigo_producto));
	 ps.setString(2, nombre );
	 ps.setInt(3, Integer.parseInt(nitproveedor));
	 ps.setDouble(4, Double.parseDouble(precio));
	 ps.setDouble(5, Double.parseDouble(iva));
	 ps.setDouble(6, Double.parseDouble(precio_venta));
	
	 
	 ps.executeUpdate();	
	 request.setAttribute("mensaje", "Registro realizado con exito");
	 request.getRequestDispatcher("ProductoNuevo.jsp").forward(request, response);	
	
	 //response.sendRedirect("UsuarioNuevo.jsp?msg=valid");
	 ps.close();
	 
	
} catch (Exception e) {
	
	 System.out.println(e);
	 request.setAttribute("mensaje", "Hubo un problema al registar el producto intentelo nuevamente");
	 request.getRequestDispatcher("ProductoNuevo.jsp").forward(request, response);	
	// response.sendRedirect("UsuarioNuevo.jsp?msg=invalid");

}


%>

