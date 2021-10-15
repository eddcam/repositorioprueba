package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import conexion.Conexion;
import entidad.ClienteVO;

public class LoginClienteModelo {
public ClienteVO obtenerUsuario(String nombre, String password, String cedula_cliente) {
		
	 ClienteVO cliente = null;
		 
		Conexion cn = new Conexion ();
		 Connection con =null;
		 PreparedStatement pst = null;
		 ResultSet rs = null;
		 try {
			 //sql = "Select * from bd_estudiantes where nombre_estudiante like'%"+nom+"%'or apellido_estudiante like'%"+nom+"%'or correo_institucional like'%"+nom+"%'or correo_estudiante like'%"+nom+"%'or programa like'%"+nom+"%'";
			 //String sql = "select * from clientes where usuario = ? and psw= ?";
			 String sql = "select * from clientes where usuario = ? and password= ?";
		        con = cn.getConnection();
		        pst = con.prepareStatement(sql);
		     
		        
		        pst.setString(1, nombre);
		        pst.setString(2, password);
			
		        rs = pst.executeQuery();
		        
		        while (rs.next()) {
		        	cliente = new ClienteVO();
		        	//usuario.setCedula_usuario(rs.getInt("cedula_usuario"));
		        	//usuario.setEmail_usuario(rs.getString("email_usuario"));
		        	//usuario.setNombre_usuario(rs.getString("nombre_usuario"));
		        	cliente.setPassword(rs.getString("password"));
		        	cliente.setUsuario(rs.getString("usuario"));
		        	cliente.setCedula_cliente(rs.getInt("cedula_cliente"));
		        	
		        }
			
			
			} catch (Exception e) {
				
				System.out.println("Error en obtener usuario");
		    }
		
		return cliente;
		
	}
}
