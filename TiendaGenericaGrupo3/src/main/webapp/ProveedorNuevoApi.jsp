<%@page import="javax.swing.JOptionPane"%>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.Statement"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "conexion.Conexion"%>




<%
String nit = request.getParameter("nit_proveedor");
String nombre = request.getParameter("nombre_proveedor");
String direccion = request.getParameter("direccion_proveedor");
String telefono = request.getParameter("telefono_proveedor");
String ciudad = request.getParameter("ciudad_proveedor");
Conexion cn = new Conexion ();
Connection con =null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
	 con = cn.getConnection();
	 String sql = "insert into proveedores values (?,?,?,?,?)";
	 ps= con.prepareStatement(sql);
	 ps.setInt(1, Integer.parseInt(nit));
	 ps.setString(2, nombre );
	 ps.setString(3, direccion );
	 ps.setString(4, telefono);
	 ps.setString(5, ciudad );
	
	 ps.executeUpdate();	
	 request.setAttribute("mensaje", "Registro realizado con exito");
	 request.getRequestDispatcher("ProveedorNuevo.jsp").forward(request, response);	
	
	 //response.sendRedirect("UsuarioNuevo.jsp?msg=valid");
	 ps.close();
	 
	
} catch (Exception e) {
	
	 System.out.println(e);
	 request.setAttribute("mensaje", "La identificacion ya se encuentra registrada! intentelo nuevamente");
	 request.getRequestDispatcher("ProveedorNuevo.jsp").forward(request, response);	
	// response.sendRedirect("UsuarioNuevo.jsp?msg=invalid");

}


%>

