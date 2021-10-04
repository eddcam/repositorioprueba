
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.Connection"%>

<%

String nit_proveedor=request.getParameter("nit_proveedor");
String nombre_proveedor=request.getParameter("nombre_proveedor");
String direccion_proveedor=request.getParameter("direccion_proveedor");
String telefono_proveedor=request.getParameter("telefono_proveedor");
String ciudad_proveedor=request.getParameter("ciudad_proveedor");



int check=0;
Conexion cn = new Conexion ();
Connection con = null ;
Statement ps = null;
ResultSet rs = null;

try{
	con = cn.getConnection();
	 ps = con.createStatement();
	String query="select * from proveedores where nit_proveedor='" + nit_proveedor + "'";
	 rs=ps.executeQuery(query);
	
	while (rs.next()){
		check=1;
		String sql="update proveedores set nombre_proveedor='" + nombre_proveedor + "',direccion_proveedor='" + direccion_proveedor + "',telefono_proveedor='" + telefono_proveedor +  "',ciudad_proveedor='" + ciudad_proveedor + "' where nit_proveedor ='" + nit_proveedor + "'";
		ps.executeUpdate(sql);
		 request.setAttribute("mensaje", "Provedor actualizado con exito");
		//response.sendRedirect("editarProveedor.jsp?msg=done");
	}
	
	if (check==0){
		request.setAttribute("mensaje", "Proveedor no encontrado");
		//response.sendRedirect("editarProveedor.jsp?msg=invalid");
	}
	rs.close();
	ps.close();
}catch(Exception e){
	System.out.println(e);
}
%>