<%@page import="javax.swing.JOptionPane"%>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "conexion.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>
<body>

<%
					Conexion cn = new Conexion ();
					Connection con =null;
					PreparedStatement ps = null;
					ResultSet rs = null;
				int codigo_producto = 1;
				try {
					 con = cn.getConnection();
					 Statement st = con.createStatement();
					String sql = "select max(codigo_producto) from productos";
					ResultSet rst = st.executeQuery(sql);
					while (rst.next()) {
						codigo_producto = rst.getInt(1);
						codigo_producto = codigo_producto + 1;

					}
				} catch (Exception e) {
				}
				%>

<div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <center><div class="panel-title">Panel de registro de Productos</div></center>                        
                    </div>     
	            <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        <form id="registerform" class="form-horizontal" role="form" action="ProductoNuevoApi.jsp"  method= POST >
                        
                     <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-asterisk"></i></span>
                        <input id="register-id" type="text" class="form-control" name="codigo_producto" value="<%out.println(codigo_producto);%>" readonly="readonly" required>                                        
                    </div>    
						
				    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="register-username" type="text" class="form-control" name="nombre_producto" value="" placeholder="Digite el Producto.">                                        
                    </div>
                    
					<div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-list-alt"></i></span>
                        <input id="register-nit" type="text" class="form-control" name="nitproveedor" placeholder="Nit del proveedor.">
                    </div>
                    
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
                        <input id="register-price" type="text" class="form-control" name="precio_compra" placeholder="Precio de compra">
                    </div>

					
					<div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-shopping-cart"></i></span>
                        <input id="register-taxes" type="text" class="form-control" name="ivacompra" placeholder="Iva">
                    </div>
                    
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
                        <input id="register-price" type="text" class="form-control" name="precio_venta" placeholder="Precio de Venta">
                    </div>
                    
 					
                    
						<div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
                                    <center>
                                    <div class="col-sm-12 controls">
                                      <button  id="btn-login" type="submit" class="btn btn-success">Registrar  </button >
                                    </div>
                                    </center>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <div>
									 <center><a href="GestionProductos.jsp">Volver a Gestion de Productos</a></center>
				                    </div>
                                   
                       </div>
					
					</form>
					<div>
						<p>
							<%
									String resultado = (String)request.getAttribute("mensaje");
									String mensaje = "";
									if (resultado != null) {
										mensaje = resultado;
									}

							%>
							<%=mensaje %>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>