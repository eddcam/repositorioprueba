
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.Connection"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>Actualizar Proveedor</title>
<link rel="shortcut icon" href="icon/BannerStoreTIC2.png">
</head>
<body>
<%
String cedula_usuario=request.getParameter("cedula_usuario");
Conexion cn = new Conexion ();
Connection con =null;
Statement ps = null;
ResultSet rs = null;
try{
	con = cn.getConnection();
	 ps = con.createStatement();
	String query="select * from usuarios where cedula_usuario='"+cedula_usuario+"'";
	 rs = ps.executeQuery(query);
	
	while (rs.next()){
%>
	<div class="container mt-5 col-lg-6">
		<div class="card col-sm-14">
			<div class="card-body">
				<form class="form-sign" action="editarUsuarioApi.jsp" method="POST">
				<figure class="text-center">
					<h2></h2>
					<figure class="text-center">
					<h5 style="color:#dc3545">Bienvenido al Módulo de Edición de Usuarios</h5>
					<h5 style="color:#dc3545">Por favor modifique la información y presione "Modificar" al finalizar</h5>
					<p></p>
					<div class="row">
						<div class="col-md-6 mb-3">
    						<label for="cedula_usuario" class="form-label">Cedula del Usuario</label>
    						<input type="text" name="cedula_usuario" class="form-control" id="formGroupExampleInput" placeholder="Digite la cedula del usuario" value= "<%=rs.getString(1)%>" readonly="readonly" required>
  						</div>
  						
  						<div class="col-md-6 mb-3">
    						<label for="email_usuario" class="form-label">Correo Electronico</label>
    						<input type="email" name="email_usuario" class="form-control" id="formGroupExampleInput" placeholder="Digite el correo electronico del usuario" value= "<%=rs.getString(2)%>" required>
  						</div>
  							
  					</div>
  					<div class="row">
  						<div class="col-md-6 mb-3">
    						<label for="nombre_usuario" class="form-label">Nombre del Usuario</label>
    						<input type="text" name="nombre_usuario" class="form-control" id="formGroupExampleInput" placeholder="Digite el nombre completo" value= "<%=rs.getString(3)%>" required>
  						</div>
  						
  						<div class="col-md-6 mb-3">
    						<label for="password" class="form-label">Contraseña</label>
    						<input type="password" name="password" class="form-control" id="formGroupExampleInput" placeholder="Digite la contraseña" value= "<%=rs.getString(4)%>" required>
  						</div>
  					</div>
  					<div class="row">
						<div class="col-md-6 mb-3">
    						<label for="usuario" class="form-label">Usuario</label>
    						<input type="text" name="usuario" class="form-control" id="formGroupExampleInput" placeholder="Digite nickname del Usuario" value= "<%=rs.getString(5)%>" required>
  						</div>
  						
  					</div>
  					
  					
  					<div>
						<input style="background-color:#dc3545;color:#FFFFFF;border:#dc3545 1px solid" type="submit" name="accion" value="Actualizar Usuario" class="btn btn-primary btn">
					</div>
				</form>
    				<div>
    					<p></p>
      					<div><h6 class="text-center"><a style="color:#dc3545"  href="GestionUsuarios.jsp">Volver a Gestión Usuarios</a></h6></div>
    			</div>
			</div>
		</div>
	</div>
	<div>
		<% 
					String msg=request.getParameter("msg");

					if ("valid".equals(msg)){
					%>
						<figure class="text-center">
						<strong class="text-center" style="color:#198754">Proveedor actualizado correctamente</strong>
					<% } %>
					<%
					if ("invalid".equals(msg)){
					%>
						<figure class="text-center">
						<strong class="text-center" style="color:#dc3545">Proveedor no se modificó o no existe en la base de datos, intentalo de nuevo!</strong>
				<% } %>
		
	</div>
	<%
	}
	
} catch (Exception e){
	System.out.println(e);
}
%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
		integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"
		integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/"
		crossorigin="anonymous"></script>
</html>
</body>
</html>