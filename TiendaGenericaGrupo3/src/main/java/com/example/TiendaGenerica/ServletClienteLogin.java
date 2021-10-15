package com.example.TiendaGenerica;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidad.ClienteVO;
import modelo.LoginClienteModelo;

/**
 * Servlet implementation class ServletUsuario
 */
@WebServlet("/logincliente")
public class ServletClienteLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tipo = request.getParameter("tipo");
		
		if ("iniciarSesion".equals(tipo)) {
			this.iniciarSesion(request, response);
		} else if ("cerrarSesion".equals(tipo)) {
			this.cerrarSesion(request, response);
		
		
		String nombre = request.getParameter("usuario");
		String password = request.getParameter("password");
		String cedula_cliente = request.getParameter("cedula_cliente");
		
		LoginClienteModelo modelo = new LoginClienteModelo();
		ClienteVO usuario = modelo.obtenerUsuario(nombre, password,cedula_cliente );
		
		if (usuario == null) {
			
			request.setAttribute("mensaje", "Usuario y/o contraseña incorrectos");
			request.getRequestDispatcher("loginClientes.jsp").forward(request, response);			
		}else {
			
			request.getRequestDispatcher("indexClientes.jsp");
	
		}

		}

	}


	private void cerrarSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		sesion.invalidate();
		//request.setAttribute("mensaje", "Iniciar sesión");
		request.getRequestDispatcher("index.jsp").forward(request, response);
		//response.sendRedirect("index.jsp");
	}


	private void iniciarSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("usuario");
		String password = request.getParameter("password");
		String cedula_cliente = request.getParameter("cedula_cliente");
		
		LoginClienteModelo modelo = new LoginClienteModelo();
		ClienteVO usuario = modelo.obtenerUsuario(nombre, password,cedula_cliente );
		
		
		if (usuario == null) {
			
			request.setAttribute("mensaje", "Usuario y/o contraseña incorrectos");
			request.getRequestDispatcher("loginClientes.jsp").forward(request, response);			
		}else {
			HttpSession sesion = request.getSession();
			sesion.setAttribute("usuario", usuario);
			sesion.setAttribute("cedula_cliente",cedula_cliente);
			response.sendRedirect("indexClientes.jsp");

		}
		
	}
}