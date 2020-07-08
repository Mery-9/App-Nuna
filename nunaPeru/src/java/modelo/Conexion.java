
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    
    private String USERNAME ="root";
    private String PASSWORD ="";
    private String PORT ="3307";
    private String DATABASE ="nunaperudb";
    private String CLASSNAME ="com.mysql.jdbc.Driver";
    
    Connection con;
    
    public Conexion(){
          try{
            Class.forName(CLASSNAME);
            con=DriverManager.getConnection("jdbc:mysql://localhost:"+ PORT+"/" + DATABASE ,USERNAME,PASSWORD);
        }
          catch(ClassNotFoundException e){
              System.err.println("Error" +e);
        }
        catch(SQLException e){
            System.err.println("Error" + e);
        }
    }
    
        
    
    public Connection getConexion(){
      return con;
    }

    
}