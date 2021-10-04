
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
<title>Actualizar Proveedores</title>
<link rel="shortcut icon" href="icon/BannerStoreTIC2.png">
</head>
<body>

	<div class="container mt-5 col-lg-6">
		<div class="card col-sm-14">
			<div class="card-body">
				<form class="form-sign" action="editarProveedorApi.jsp" method="POST">
				<figure class="text-center">
					<h2></h2>
					<figure class="text-center">
					<h5 style="color:DodgerBlue">Bienvenido al Módulo de Edición de Proveedores</h5>
					<h5 style="color:DodgerBlue">Por favor modifique la información y presione "Actualizar" al finalizar</h5>
					<p></p>
					<div class="row">
						<div class="col-md-6 mb-3">
    						<label for="cedula_usuario" class="form-label">NIT del Proveedor</label>
    						<input style="background-color:#FFF8DC;  type="text" name="nit_proveedor" class="form-control" id="formGroupExampleInput" placeholder="Digite el NIT del proveedor" value= ""  required>
  						</div>
  						
  						<div class="row">
  						<div class="col-md-6 mb-3">
    						<label for="nombre_usuario" class="form-label">Nombre del Proveedor</label>
    						<input style="background-color:#FFF8DC;  type="text" name="nombre_proveedor" class="form-control" id="formGroupExampleInput" placeholder="Digite el nuevo nombre completo" value= "" required>
  						</div>
  						
  						<div class="col-md-6 mb-3">
    						<label for="email_usuario" class="form-label">Direccion</label>
    						<input style="background-color:#FFF8DC; type="text" name="direccion_proveedor" class="form-control" id="formGroupExampleInput" placeholder="Digite la nueva direccion del proveedor" value= "" required>
  						</div>
  						
  						<div class="col-md-6 mb-3">
    						<label for="email_usuario" class="form-label">Telefono</label>
    						<input style="background-color:#FFF8DC; type="text" name="telefono_proveedor" class="form-control" id="formGroupExampleInput" placeholder="Digite el nuevo telefono del proveedor" value= "" required>
  						</div>
  						
  						<div class="col-md-6 mb-3">
    						<label for="email_usuario" class="form-label">Ciudad</label>
    						<input style="background-color:#FFF8DC; type="text" name="ciudad_proveedor" class="form-control" id="formGroupExampleInput" placeholder="Digite la nueva ciudad del proveedor" value= "" required>
  						</div>
  							
  							
  					</div>
  					
  						
  						
  					</div>
  					 					
  					
  					<div>
						<input style="background-color:SlateBlue;color:#FFFFFF;border:SlateBlue" type="submit" name="accion" value="Actualizar Proveedor" class="btn btn-primary btn">
					</div>
				</form>
    				<div>
    					<p></p>
      					<div><h6 class="text-center"><a style="color:Gray"  href="GestionProveedores.jsp">Volver a Gestión Proveedores</a></h6></div>
    			</div>
			</div>
		</div>
	</div>
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