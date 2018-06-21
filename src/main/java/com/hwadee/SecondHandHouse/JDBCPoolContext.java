package com.hwadee.SecondHandHouse;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JDBCPoolContext {
	
	private static ComboPooledDataSource ds = null;
	
	//private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();
	
	static {
		
        try {
        	ds = new ComboPooledDataSource();
    		
    		ds.setUser("team");       
            ds.setPassword("lxmy1234");       
            ds.setJdbcUrl( "jdbc:mysql://localhost:3306/easyliveweb"); 
			ds.setDriverClass( "com.mysql.jdbc.Driver");
			ds.setMaxPoolSize(30);
			
		} catch (PropertyVetoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	
	public static Connection getConnection() throws SQLException{
		
		/*Connection conn = tl.get();
		if( conn == null ){
			conn = ds.getConnection();
			tl.set( conn );
		}
		
		return conn;*/
		
		
		return ds.getConnection();
		
	}
	
	public static void close(Connection conn){
		
		try {
			if(conn != null && ! conn.isClosed() ){
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
