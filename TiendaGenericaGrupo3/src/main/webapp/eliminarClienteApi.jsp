<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.Statement"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "conexion.Conexion"%>

<%  

	String cedula = request.getParameter("cedula_cliente");
	int check = 0;
	Conexion cn = new Conexion ();
	Connection con =null;
	Statement ps = null;
	ResultSet rs = null;
	try{
		
		 con = cn.getConnection();
		 ps = con.createStatement();
		 String query = "SELECT * FROM clientes Where cedula_cliente = '"+ cedula +"'";
		 rs = ps.executeQuery(query);
		 
		 while (rs.next()){
			 
			 check = 1;
			 String sql = "DELETE  FROM clientes Where cedula_cliente = '"+ cedula +"'";
			 ps.executeUpdate(sql);
			 request.setAttribute("mensaje", "Usuario eliminado con exito");
			 request.getRequestDispatcher("eliminarCliente.jsp").forward(request, response);	
			 response.sendRedirect("eliminarCliente.jsp?msg=delete");
			 
		 }
		 
		 if (check == 0) {
			 request.setAttribute("mensaje", "Usuario no encontrado! intentelo nuevamente");
			 request.getRequestDispatcher("eliminarCliente.jsp").forward(request, response);	
			 response.sendRedirect("eliminarCliente.jsp?msg=invalid");
			 response.sendRedirect("login.jsp");
			 
		 }
		rs.close();
		ps.close();
			
	}catch (Exception e) {
		
		System.out.println(e);
		
		
		
	}

%>