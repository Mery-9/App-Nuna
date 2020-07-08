/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Persona;
import modelo.PersonaDAO;

/**
 *
 * @author Angie
 */
public class RegistrarUsuarios extends HttpServlet {

  PersonaDAO dao=new PersonaDAO();
  Persona p=new Persona(); 
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String usuario = request.getParameter("txtusu");
        String pass = request.getParameter("txtpass");
        String nombre = request.getParameter("txtnom");
        String apellido = request.getParameter("txtape");
        String email = request.getParameter("txtemail");
        
       if(dao.isUsuRegistered(usuario)){

        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
        out.println("<script language=JavaScript>");
        out.println("$(document).ready(function(){");
        out.println("swal('Lo sentimos!!','El nombre de usuario ya esta registrado. Vuelve a ingresar tus datos por favor. Gracias!! ','error');");
        out.println("});");
        out.println("</script>");
        
       RequestDispatcher rd=request.getRequestDispatcher("registro.jsp");
       rd.include(request, response);
        }
        else{
          p=new Persona(usuario,pass, nombre, apellido, email);
          if(dao.registrar(p)){
              
        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
        out.println("<script language=JavaScript>");
        out.println("$(document).ready(function(){");
        out.println("swal('Registro Exitoso!!','Gracias por registrarte, y ser parte de nuestra familia!','success');");
        out.println("});");
        out.println("</script>");
        
       RequestDispatcher rd=request.getRequestDispatcher("index.htm");
       rd.include(request, response);
        
            
          } 

          }
         
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      try {
          processRequest(request, response);
      } catch (SQLException ex) {
          Logger.getLogger(RegistrarUsuarios.class.getName()).log(Level.SEVERE, null, ex);
      }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      try {
          processRequest(request, response);
          
          
          
      } catch (SQLException ex) {
          Logger.getLogger(RegistrarUsuarios.class.getName()).log(Level.SEVERE, null, ex);
      }
      
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
