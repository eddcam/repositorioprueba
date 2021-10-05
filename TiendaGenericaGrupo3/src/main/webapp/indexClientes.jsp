
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
 <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<title>Principal</title>
</head>
<body>
	Bienvenido ${sessionScope.usuario.usuario}
	
	
	<!-- barra de navegacion superior -->
    <!--barra arriba -->
    <nav class="navbar navbar-default navbar-inverse" role="navigation">
    <!--barrak abajo 
     <nav class="navbar navbar-navbar navbar-default navbar-fixed-bottom" role="navigation" >
     arriba y el negro
     <nav class="navbar navbar-default navbar-inverse" role="navigation">
    --!
      <!-- El logotipo y el icono que despliega el menú se agrupan
       para mostrarlos mejor en los dispositivos móviles -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
          <span class="sr-only">Desplegar navegación</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
       <p align ="left"> <a class="navbar-brand" href="#">Generic Store</a></p>
        
        
       <p align ="left"> <img src="img/genericstore2.png" alt="HTML5 Icon" style="width:80px;height:80px;"></p>
      </div>

      <!-- Agrupar los enlaces de navegación, los formularios y cualquier
       otro elemento que se pueda ocultar al minimizar la barra -->
      <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">PRODUCTOS</a></li>
          <li><a href="#">CONTACTENOS</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          Menú #1 <b class="caret"></b>
        </a>
            <ul class="dropdown-menu">
              <li><a href="#">Acción #1</a></li>
              <li><a href="#">Acción #2</a></li>
              <li><a href="#">Acción #3</a></li>
              <li class="divider"></li>
              <li><a href="#">Acción #4</a></li>
              <li class="divider"></li>
              <li><a href="#">Acción #5</a></li>
            </ul>
          </li>
        </ul>

        <form class="navbar-form navbar-left" role="search">
          <div class="form-group">
            <input type="text" class="form-control" placeholder="Buscar">
          </div>
          <button type="submit" class="btn btn-default">Enviar</button>
        </form>

        <ul class="nav navbar-nav navbar-right">
          <li><a ><jsp:include page="encabezadoclientecerrar.jsp" /></a></li>
          <li class="dropdown">
           <li><a href="login.jsp">Zona Administradores</a></li>
            <ul class="dropdown-menu">
            
            </ul>
          </li>
        </ul>
      </div>
    </nav>
    <!-- Fin de barra navegacion -->

    <!-- Librería jQuery requerida por los plugins de JavaScript -->
    <script src="http://code.jquery.com/jquery.js"></script>

    <!-- Todos los plugins JavaScript de Bootstrap (también puedes
         incluir archivos JavaScript individuales de los únicos
         plugins que utilices) -->
    <script src="js/bootstrap.min.js"></script>
	 <p align ="center"> <img  src="img/store.jpg" alt="HTML5 Icon" > </p>
</body>
</html>