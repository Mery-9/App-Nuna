
package modelo;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletResponse;


public class PersonaDAO implements Validar {
    Connection con;
    Conexion cn=new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    @Override

    public int validar(Persona per){
        int r=0;
        String sql="Select * from usuarios where usu_cliente=? and pass_cliente=?";
        try{
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            ps.setString(1, per.getUsuario());
            ps.setString(2, per.getPassword());
            rs=ps.executeQuery();
            while(rs.next()){
                r=r+1;
                per.setUsuario(rs.getString("usu_cliente"));
                per.setPassword(rs.getString("pass_cliente"));
                
            }
            if(r==1){
                return 1;
            }else{
                return 0;
            }
            
        }catch (Exception e){
            return 0;
        }
        
    }
    
     public boolean registrar(Persona per ){
            
        try {
            String sql= "insert into usuarios (usu_cliente, pass_cliente, nom_cliente, ape_cliente, correo_cliente) value(?,?,?,?,?)";
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            ps.setString(1, per.getUsuario());
            ps.setString(2, per.getPassword());
            ps.setString(3, per.getNombre());
            ps.setString(4, per.getApellido());
            ps.setString(5, per.getEmail());
            
            if(ps.executeUpdate() == 1){
                return true;
            }
            
        } catch (Exception e) {
            System.err.println("Error" +e);
        }
        return false;
    }

    public  ArrayList<String> mostrar(String cod){
        ArrayList<String> UsuDatos = new ArrayList<String>();
        try{
           
            String sql= "select * from usuarios where usu_cliente='"+cod+"'";
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
           
            while(rs.next()){
                  UsuDatos.add(rs.getString("usu_cliente")) ;
                  UsuDatos.add(rs.getString("pass_cliente"));
                  UsuDatos.add(rs.getString("nom_cliente")) ;
                  UsuDatos.add(rs.getString("ape_cliente")) ;
                  UsuDatos.add(rs.getString("correo_cliente")) ;
            }
                
                
            return UsuDatos;

        }
        catch(Exception e){
            System.err.println("Error" +e);
        }
        
        return UsuDatos;
    }

    public boolean isUsuRegistered(String usu) throws SQLException {
      
            String sql = "SELECT * FROM usuarios WHERE usu_cliente='"+usu+"'";
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs.next();
            

       
    }
    
   public void agregarfoto( Persona p, int id) throws SQLException{
     String sql = "update usuarios set foto_cliente=? where id_cliente='"+id+"'";
      
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            ps.setBlob(1,p.getFoto());
            ps.executeUpdate();
  
    }
     
    public void mostrarImg(int id, HttpServletResponse response){
        String sql = "select * from usuarios where id_cliente="+id;
        InputStream inputStream=null;
        OutputStream outputStream=null;
        BufferedInputStream bufferedInputStream=null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try{
             outputStream = response.getOutputStream();
             con=cn.getConexion();
             ps=con.prepareStatement(sql);
             rs=ps.executeQuery();
             if(rs.next()){
             inputStream=rs.getBinaryStream("foto_cliente");
             
             }
             bufferedInputStream = new BufferedInputStream(inputStream);
             bufferedOutputStream = new BufferedOutputStream(outputStream);
             int i=0;
             while((i=bufferedInputStream.read()) !=-1){
                 bufferedOutputStream.write(i);
             }
             
        } catch(Exception e){
            
        }
    
   }
    
    /*
 public static void  main (String[] args){
     PersonaDAO per = new PersonaDAO();
     System.out.println(per.mostrar("123"));
 }
     
  */
  
 
}
