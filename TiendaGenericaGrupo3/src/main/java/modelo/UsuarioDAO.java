package modelo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import conexion.Conexion;
import entidad.UsuarioVO;



public class UsuarioDAO {
	
	 public void registrarPersona(UsuarioVO persona) 
	 {
	  Conexion conex= new Conexion();
	  try {
	   Statement estatuto = conex.getConnection().createStatement();
	   estatuto.executeUpdate("INSERT INTO usuarios VALUES ('"+persona.getCedula_usuario()+"', '"
	   +persona.getEmail_usuario()+"', '"+persona.getNombre_usuario()+"', '"+persona.getPassword()+"','"+persona.getUsuario()+"')");
	   
	   JOptionPane.showMessageDialog(null, "Cliente Registrado Satisfactoriaente","Información",JOptionPane.INFORMATION_MESSAGE);
	   estatuto.close();
	   conex.desconectar();
	   
	  } catch (SQLException e) {
	            System.out.println(e.getMessage());
	   JOptionPane.showMessageDialog(null, "El Cliente no se pudo Registrar...");
	  }
	  
	 }
	   
	 
	 
	/**
	 * Consultar Tabla Cliente asociado al documento enviado
	 * como parametro 
	 * @param documento 
	 * @return
	 */
	public ArrayList<UsuarioVO> consultarPersona(int documento) {
	  ArrayList< UsuarioVO> miUsuario = new ArrayList< UsuarioVO>();
	  Conexion conex= new Conexion();
	    
	  try {
	   PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM usuarios where cedula_usuario = ? ");
	   consulta.setInt(1, documento);
	   ResultSet res = consulta.executeQuery();
	   
	  if(res.next()){
		UsuarioVO persona= new UsuarioVO();
	    persona.setCedula_usuario(Integer.parseInt(res.getString("cedula_usuario")));
	    persona.setEmail_usuario(res.getString("email_usuario"));
	    persona.setNombre_usuario(res.getString("nombre_usuario"));
	    persona.setPassword(res.getString("password"));
	    persona.setUsuario(res.getString("usuario"));
	 
	    miUsuario.add(persona);
	          }
	          res.close();
	          consulta.close();
	          conex.desconectar();
	   
	  } catch (Exception e) {
	   JOptionPane.showMessageDialog(null, "Error en la Consulta del Usuario\n"+e);
	  }
	  return miUsuario;
	 }



	/**
	 * permite consultar la lista de Clientes
	 * @return
	 */
	public ArrayList< UsuarioVO> listaDePersonas() {
	  ArrayList< UsuarioVO> miUsuario = new ArrayList< UsuarioVO>();
	  Conexion conex= new Conexion();
	    
	  try {
	   PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM usuarios");
	   ResultSet res = consulta.executeQuery();
	   while(res.next()){
		   UsuarioVO persona= new UsuarioVO();
	    persona.setCedula_usuario(Integer.parseInt(res.getString("cedula_usuario")));
	    persona.setEmail_usuario(res.getString("email_usuario"));
	    persona.setNombre_usuario(res.getString("nombre_usuario"));
	    persona.setPassword(res.getString("password"));
	    persona.setUsuario(res.getString("usuario"));
	    
	    
	    miUsuario.add(persona);
	          }
	          res.close();
	          consulta.close();
	          conex.desconectar();
	   
	  } catch (Exception e) {
	   JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n"+e);
	  }
	  return miUsuario;
	 }
	
	
	

}
