
package modelo;

import java.io.InputStream;

public class Persona {
    int id;
    String usuario;
    String password;
    String nombre;
    String apellido;
    String email;
    String direc;
    String telef;
    String distrito;
     private InputStream foto;
    
    public Persona(){
        
    }
    public Persona(int id, String usuario, String password) {
        this.id = id;
        this.usuario = usuario;
        this.password = password;
    }

    public Persona( String usuario, String password, String nombre, String apellido, String email) {
       
        this.usuario = usuario;
        this.password = password;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.direc="";
        this.telef="";
    }

    public Persona(int id, String usuario, String password, String nombre, String apellido, String email, String direc, String telef, String distrito) {
        this.id = id;
        this.usuario = usuario;
        this.password = password;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.direc = direc;
        this.telef = telef;
        this.distrito = distrito;
    }

    public Persona(int id, String usuario, String password, String nombre, String apellido, String email, String direc, String telef, String distrito, InputStream foto) {
        this.id = id;
        this.usuario = usuario;
        this.password = password;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.direc = direc;
        this.telef = telef;
        this.distrito = distrito;
        this.foto = foto;
    }

    public String getDistrito() {
        return distrito;
    }

    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }

    public void setDistrito(String distrito) {
        this.distrito = distrito;
    }
    
    

    public String getDirec() {
        return direc;
    }

    public void setDirec(String direc) {
        this.direc = direc;
    }

    public String getTelef() {
        return telef;
    }

    public void setTelef(String telef) {
        this.telef = telef;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

   
}
