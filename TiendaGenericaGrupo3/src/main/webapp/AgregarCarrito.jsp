<%@page import="com.example.TiendaGenerica.ServletClienteLogin"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%
String codigo_producto=request.getParameter("codigo_producto");
String cantidad=request.getParameter("cantidad");

int check=0;
Conexion cn = new Conexion ();
Connection con = null ;
Statement ps = null;
ResultSet rs = null;
	try{
		String cedula =session.getAttribute("cedula_cliente").toString();
		//String cedula = "1061733456";
		con = cn.getConnection();
		 ps = con.createStatement();		
		String query="select * from carrito where cedula= "+cedula;
		 rs = ps.executeQuery(query);		
		String id_carrito = "0";
		
		if(rs.next()){
			id_carrito = rs.getString("id_carrito");			
		}
		
		if(id_carrito.equals("0")){
			String query2="insert into carrito(cedula,valor_total) values ("+cedula+",0)";
			PreparedStatement st2 = con.prepareStatement(query2,  Statement.RETURN_GENERATED_KEYS);
			int arows = st2.executeUpdate();
			if(arows > 0){
				ResultSet rs2 = st2.getGeneratedKeys();
				if(rs2.next()){
					id_carrito = rs2.getString(1);
				}
			}
		}
		
		//String query3="select p.codigo_producto, p.precio_compra as precio_compra, p.id_iva, i.porcentaje_iva as porcentaje_iva from storetic.productos p inner join storetic.iva i on p.id_iva=i.id_iva and p.codigo_producto= " + codigo_producto;
		
		String query3="select p.codigo_producto, p.precio_venta as precio_venta from productos p inner join p.codigo_producto= " + codigo_producto;
		ResultSet rs3 = ps.executeQuery(query3);		
		double granTotal = 0;
		
		if(rs3.next()){
			int cant = Integer.parseInt(cantidad);		
			long precioVenta = Math.round(rs3.getInt("precio_venta"));
			double valor_total = cant*precioVenta;
			
			String query4 = "select * from detallecarrito where codigo_producto = "+codigo_producto+" and id_carrito = "+id_carrito;
			ResultSet rs4 = ps.executeQuery(query4);
			if(rs4.next()){
				cant += rs4.getInt("cantidad");
				valor_total = cant * precioVenta;
				String query5="update detallecarrito set cantidad = "+Integer.toString(cant)+", valor_unitario = "+Long.toString(precioVenta)+", valor_total = "+Double.toString(valor_total)+" where id_carrito = "+id_carrito+" and codigo_producto= " + codigo_producto;
				PreparedStatement st5 = con.prepareStatement(query5);
				int arows5 = st5.executeUpdate();
				st5.close();
			}else{
				String query5="insert into detallecarrito (cantidad,valor_unitario,valor_total,id_carrito,codigo_producto) values ("+Integer.toString(cant)+", "+Long.toString(precioVenta)+", "+Double.toString(valor_total)+", "+id_carrito+", " + codigo_producto+")";
				PreparedStatement st5 = con.prepareStatement(query5);
				int arows5 = st5.executeUpdate();
				st5.close();
			}
			rs4.close();
			
			//String query6 = "select d.id_carrito, sum(d.valor_unitario) as valor_unitario, sum(d.valor_total) as valor_total, sum(p.precio_compra) as precio_compra, sum((d.valor_unitario - p.precio_compra)) as valor_iva from storetic.detallecarrito d inner join storetic.productos p on d.codigo_producto = p.codigo_producto inner join storetic.iva i on p.id_iva = i.id_iva and d.id_carrito = '" + id_carrito + "'group by d.id_carrito";
			String query6 = "select d.id_carrito, sum(d.valor_total) as valor_total, sum(p.precio_compra) as precio_compra from detallecarrito d inner join productos p on d.codigo_producto = p.codigo_producto inner join d.id_carrito = '" + id_carrito + "'group by d.id_carrito";
			ResultSet rs6 = ps.executeQuery(query6);
			long subtotal = 0;
			long valorIva = 0;
			long total = 0;
			while(rs6.next()){
			 	/*long iva2 = Math.round(rs6.getInt("precio_compra")*rs6.getDouble("porcentaje_iva"));*/
			 	//long iva2 = rs6.getInt("valor_iva");
			 	/*long subtotal2 = rs6.getInt("valor_total")-iva2;*/
			 	long subtotal2 = rs6.getInt("precio_compra");
			 	//valorIva += iva2;
			 	subtotal += subtotal2;
			 	total += rs6.getInt("valor_total");
			}
			String query7 = "update carrito set valor_total = "+Long.toString(total)+" where id_carrito = "+id_carrito;
			PreparedStatement st7 = con.prepareStatement(query7);
			int arows7 = st7.executeUpdate();
			st7.close();		
		}
		
		rs3.close();
		rs.close();
		ps.close();
		check = 1;
	}catch(Exception e){
		e.printStackTrace();
		check = 0;
	}
	if (check==0){
		response.sendRedirect("NuestrosProductos.jsp?msg=invalid");
	}else{
		response.sendRedirect("NuestrosProductos.jsp?msg=valid");
	}
%>