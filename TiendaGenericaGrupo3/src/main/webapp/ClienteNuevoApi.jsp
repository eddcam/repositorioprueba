<%@page import="javax.swing.JOptionPane"%>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.Statement"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "conexion.Conexion"%>




<%
String cedula = request.getParameter("cedula_cliente");
String nombre = request.getParameter("nombre_cliente");
String email = request.getParameter("email_cliente");
String telefono = request.getParameter("telefono");
String direccion = request.getParameter("direccion");
String clave = request.getParameter("password");
String usuario = request.getParameter("usuario");
Conexion cn = new Conexion ();
Connection con =null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
	 con = cn.getConnection();
	 String sql = "insert into clientes values (?,?,?,?,?,?,?)";
	 ps= con.prepareStatement(sql);
	 ps.setInt(1, Integer.parseInt(cedula));
	 ps.setString(2, email );
	 ps.setString(3, nombre );
	 ps.setString(4, telefono);
	 ps.setString(5, direccion );
	 ps.setString(6, clave );
	 ps.setString(7, usuario );
	 ps.executeUpdate();	
	 request.setAttribute("mensaje", "Registro realizado con exito");
	 request.getRequestDispatcher("ClienteNuevo.jsp").forward(request, response);	
	
	 //response.sendRedirect("UsuarioNuevo.jsp?msg=valid");
	 ps.close();
	 
	
} catch (Exception e) {
	
	 System.out.println(e);
	 request.setAttribute("mensaje", "La identificacion ya se encuentra registrada! intentelo nuevamente");
	 request.getRequestDispatcher("ClienteNuevo.jsp").forward(request, response);	
	// response.sendRedirect("UsuarioNuevo.jsp?msg=invalid");

}


%>

