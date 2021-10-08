package com.example.TiendaGenerica;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidad.UsuarioVO;
import modelo.LoginModelo;

/**
 * Servlet implementation class ServletUsuario
 */
@WebServlet("/login")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tipo = request.getParameter("tipo");
		
		if ("iniciarSesion".equals(tipo)) {
			this.iniciarSesion(request, response);
		} else if ("cerrarSesion".equals(tipo)) {
			this.cerrarSesion(request, response);
		
		
		String nombre = request.getParameter("usuario");
		String password = request.getParameter("password");
		
		LoginModelo modelo = new LoginModelo();
		UsuarioVO usuario = modelo.obtenerUsuario(nombre, password );
		
		if ("admininicial".equals(nombre) && "admin123456".equals(password)){
			response.sendRedirect("index.jsp");
			
		}
		
		if (usuario == null) {
			
			request.setAttribute("mensaje", "Usuario y/o contraseña incorrectos");
			request.getRequestDispatcher("login.jsp").forward(request, response);			
		}else {
			
			response.sendRedirect("principal.jsp");
	
		}
		

		}

	}


	private void cerrarSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		sesion.invalidate();
		request.setAttribute("mensaje", "Iniciar sesión");
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}


	private void iniciarSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("usuario");
		String password = request.getParameter("password");
		
		LoginModelo modelo = new LoginModelo();
		UsuarioVO usuario = modelo.obtenerUsuario(nombre, password );
		
		if (usuario == null) {
			
			request.setAttribute("mensaje", "Usuario y/o contraseña incorrectos");
			request.getRequestDispatcher("login.jsp").forward(request, response);			
		}else {
			HttpSession sesion = request.getSession();
			sesion.setAttribute("usuario", usuario);
			response.sendRedirect("principal.jsp");

		}
		
	}
}