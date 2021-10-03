
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.Connection"%>

<%

String cedula_cliente=request.getParameter("cedula_cliente");
String nombre_cliente=request.getParameter("nombre_cliente");
String email_cliente=request.getParameter("email_cliente");
String telefono=request.getParameter("telefono");
String direccion=request.getParameter("direccion");
String password=request.getParameter("password");
String usuario=request.getParameter("usuario");


int check=0;
Conexion cn = new Conexion ();
Connection con = null ;
Statement ps = null;
ResultSet rs = null;

try{
	con = cn.getConnection();
	 ps = con.createStatement();
	String query="select * from clientes where cedula_cliente='" + cedula_cliente + "'";
	 rs=ps.executeQuery(query);
	
	while (rs.next()){
		check=1;
		String sql="update clientes set nombre_cliente='" + nombre_cliente + "',email_cliente='" + email_cliente + "',telefono='" + telefono +  "',direccion='" + direccion + "' where usuario ='" + usuario + "' and password='" + password + "'";
		ps.executeUpdate(sql);
		response.sendRedirect("editarCliente.jsp?msg=done");
	}
	
	if (check==0){
		response.sendRedirect("editarCliente.jsp?msg=invalid");
	}
	rs.close();
	ps.close();
}catch(Exception e){
	System.out.println(e);
}
%>