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



<div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <center><div class="panel-title">Panel de registro</div></center>                        
                    </div>     
	            <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        <form id="registerform" class="form-horizontal" role="form" action="ClienteNuevoApi.jsp"  method= POST >
						
				    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
                        <input id="register-Id" type="text" class="form-control" name="cedula_cliente" value="" placeholder="Digite documento.">                                        
                    </div>
                    
					<div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="register-email" type="email" class="form-control" name="email_cliente" placeholder="Correo electronico.">
                    </div>
                    
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                        <input id="register-username" type="text" class="form-control" name="nombre_cliente" placeholder="Nombre Completo">
                    </div>
                    
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                        <input id="register-phone" type="text" class="form-control" name="telefono" placeholder="telefono celular.">
                    </div>
                    
                     <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                        <input id="register-adress" type="text" class="form-control" name="direccion" placeholder="Direccón.">
                    </div>
                    
                   
					
					<div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="register-password" type="password" class="form-control" name="password" placeholder="contraseña.">
                    </div>

					
                    
                     <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="register-username" type="text" class="form-control" name="usuario" value="" placeholder="Digite su Nickname">                                        
                    </div>

						<div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
                                    <center>
                                    <div class="col-sm-12 controls">
                                      <button  id="btn-login" type="submit" class="btn btn-success">Registrarse  </button >
                                    </div>
                                    </center>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <center><a href="loginClientes.jsp">¿Ya tienes cuenta?. ¡Logueate :D!</a></center>
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