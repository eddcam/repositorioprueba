<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.Connection"%>

<%

String cedula_usuario=request.getParameter("cedula_usuario");
String nombre_usuario=request.getParameter("nombre_usuario");
String email_usuario=request.getParameter("email_usuario");
String password=request.getParameter("password");
String usuario=request.getParameter("usuario");


int check=0;
Conexion cn = new Conexion ();
Connection con =null;
Statement ps = null;
ResultSet rs = null;

try{
	con = cn.getConnection();
	 ps = con.createStatement();
	String query="select * from usuarios where cedula_usuario='" + cedula_usuario + "'";
	 rs=ps.executeQuery(query);
	
	while (rs.next()){
		check=1;
		String sql="update usuarios set nombre_usuario='" + nombre_usuario + "',email_usuario='" + email_usuario + "' where usuario ='" + usuario + "' and password='" + password + "'";
		ps.executeUpdate(sql);
		response.sendRedirect("editarUsuario.jsp?msg=done");
	}
	
	if (check==0){
		response.sendRedirect("editarUsuario.jsp?msg=invalid");
	}
	rs.close();
	ps.close();
}catch(Exception e){
	System.out.println(e);
}
%>