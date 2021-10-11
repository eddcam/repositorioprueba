<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.Statement"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "conexion.Conexion"%>

<%  

	String codigo = request.getParameter("codigo_producto");
	int check = 0;
	Conexion cn = new Conexion ();
	Connection con =null;
	Statement ps = null;
	ResultSet rs = null;
	try{
		
		 con = cn.getConnection();
		 ps = con.createStatement();
		 String query = "SELECT * FROM productos Where codigo_producto = '"+ codigo +"'";
		 rs = ps.executeQuery(query);
		 
		 while (rs.next()){
			 
			 check = 1;
			 String sql = "DELETE  FROM productos Where codigo_producto = '"+ codigo +"'";
			 ps.executeUpdate(sql);
			 request.setAttribute("mensaje", "Producto eliminado con exito");
			 request.getRequestDispatcher("eliminarProducto.jsp").forward(request, response);	
			 response.sendRedirect("eliminarProducto.jsp?msg=delete");
			 
		 }
		 
		 if (check == 0) {
			 request.setAttribute("mensaje", "Producto no encontrado! intentelo nuevamente");
			 request.getRequestDispatcher("eliminarProducto.jsp").forward(request, response);	
			 response.sendRedirect("eliminarProducto.jsp?msg=invalid");
			 response.sendRedirect("gestionProductos.jsp");
			 
		 }
		rs.close();
		ps.close();
			
	}catch (Exception e) {
		
		System.out.println(e);
		
		
		
	}

%>