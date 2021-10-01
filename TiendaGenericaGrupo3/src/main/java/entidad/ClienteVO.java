package entidad;



public class ClienteVO {

	private Integer cedula_cliente;
	private String email_cliente;
	private String nombre_cliente;
	private String telefono;
	private String direccion;
	private String password;
	private String usuario;
	
	
	
	
	
	
	public ClienteVO(Integer cedula_cliente, String email_cliente, String nombre_cliente, String telefono,
			String direccion, String password, String usuario) {
		super();
		this.cedula_cliente = cedula_cliente;
		this.email_cliente = email_cliente;
		this.nombre_cliente = nombre_cliente;
		this.telefono = telefono;
		this.direccion = direccion;
		this.password = password;
		this.usuario = usuario;
	}


	public ClienteVO() {
		
	}


	public Integer getCedula_cliente() {
		return cedula_cliente;
	}


	public void setCedula_cliente(Integer cedula_cliente) {
		this.cedula_cliente = cedula_cliente;
	}


	public String getEmail_cliente() {
		return email_cliente;
	}


	public void setEmail_cliente(String email_cliente) {
		this.email_cliente = email_cliente;
	}


	public String getNombre_cliente() {
		return nombre_cliente;
	}


	public void setNombre_cliente(String nombre_cliente) {
		this.nombre_cliente = nombre_cliente;
	}


	public String getTelefono() {
		return telefono;
	}


	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}


	public String getDireccion() {
		return direccion;
	}


	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getUsuario() {
		return usuario;
	}


	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}


	
	
	
	
	
}
