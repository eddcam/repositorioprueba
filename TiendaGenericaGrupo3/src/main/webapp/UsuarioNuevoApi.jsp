<%@page import="javax.swing.JOptionPane"%>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.Statement"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "conexion.Conexion"%>




<%
String cedula = request.getParameter("cedula_usuario");
String email = request.getParameter("email_usuario");
String nombre = request.getParameter("nombre_usuario");
String clave = request.getParameter("password");
String usuario = request.getParameter("usuario");
Conexion cn = new Conexion ();
Connection con =null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
	 con = cn.getConnection();
	 String sql = "insert into usuarios values (?,?,?,?,?)";
	 ps= con.prepareStatement(sql);
	 ps.setInt(1, Integer.parseInt(cedula));
	 ps.setString(2, email );
	 ps.setString(3, nombre );
	 ps.setString(4, clave );
	 ps.setString(5, usuario );
	 ps.executeUpdate();	
	 request.setAttribute("mensaje", "Registro realizado con exito");
	 request.getRequestDispatcher("UsuarioNuevo.jsp").forward(request, response);	
	
	 //response.sendRedirect("UsuarioNuevo.jsp?msg=valid");
	 ps.close();
	 
	
} catch (Exception e) {
	
	 System.out.println(e);
	 request.setAttribute("mensaje", "La identificacion ya se encuentra registrada! intentelo nuevamente");
	 request.getRequestDispatcher("UsuarioNuevo.jsp").forward(request, response);	
	// response.sendRedirect("UsuarioNuevo.jsp?msg=invalid");

}


%>

