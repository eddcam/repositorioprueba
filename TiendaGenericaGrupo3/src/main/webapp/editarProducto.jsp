
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
<title>Actualizar Usuarios</title>
<link rel="shortcut icon" href="icon/BannerStoreTIC2.png">
</head>
<body>

	<div class="container mt-5 col-lg-6">
		<div class="card col-sm-14">
			<div class="card-body">
				<form class="form-sign" action="editarProductoApi.jsp" method="POST">
				<figure class="text-center">
					<h2></h2>
					<figure class="text-center">
					<h5 style="color:MediumSeaGreen">Bienvenido al Módulo de Edición de Productos</h5>
					<h5 style="color:MediumSeaGreen">Por favor modifique la información y presione "Modificar" al finalizar</h5>
					<p></p>
					<div class="row">
						<div class="col-md-6 mb-3">
    						<label for="codigo_producto" class="form-label">Codigo del Producto</label>
    						<input style="background-color:#FFF8DC; type="text" name="codigo_producto" class="form-control" id="formGroupExampleInput" placeholder="Digite el codigo del Producto" value= ""  required>
  						</div>
  											
  							
  					</div>
  					<div class="row">
  						<div class="col-md-6 mb-3">
    						<label for="nombre_producto" class="form-label">Nombre del Producto</label>
    						<input style="background-color:#FFF8DC; type="text" name="nombre_producto" class="form-control" id="formGroupExampleInput" placeholder="Digite el nuevo nombre del producto" value= "" required>
  						</div>
  						
  						<div class="col-md-6 mb-3">
    						<label for="nitproveedor" class="form-label">NIT Proveedor</label>
    						<input style="background-color:#FFF8DC;v type="text" name="nitproveedor" class="form-control" id="formGroupExampleInput" placeholder="Digite el nuevo nit del proveedor" value= "" required>
  						</div>
  						
  						<div class="col-md-6 mb-3">
    						<label for="precio_compra" class="form-label">Precio de Compra</label>
    						<input style="background-color:#FFF8DC;  type="text" name="precio_compra" class="form-control" id="formGroupExampleInput" placeholder="Digite el nuevo precio de compra" value= "" required>
  						</div>
  					</div>
  					<div class="row">
						<div class="col-md-6 mb-3">
    						<label for="ivacompra" class="form-label">ivaproducto</label>
    						<input style="background-color:#FFF8DC; type="text" name="ivacompra" class="form-control" id="formGroupExampleInput" placeholder="Digite el iva del producto" value= "" required>
  						</div>
  						
  						<div class="col-md-6 mb-3">
    						<label for="precio_venta" class="form-label">Precio de venta</label>
    						<input style="background-color:#FFF8DC;  type="text" name="precio_venta" class="form-control" id="formGroupExampleInput" placeholder="Digite el nuevo precio de venta" value= "" required>
  						</div>
  						
  					</div>
  					
  					
  					<div>
						<input style="background-color:MediumSeaGreen;color:#FFFFFF;border:MediumSeaGreen" type="submit" name="accion" value="Actualizar Producto" class="btn btn-primary btn">
					</div>
				</form>
    				<div>
    					<p></p>
      					<div><h6 class="text-center"><a style="color:GRAY"  href="GestionProductos.jsp">Volver a Gestión de Productos</a></h6></div>
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