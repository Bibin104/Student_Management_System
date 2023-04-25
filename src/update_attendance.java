
 

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/update_attendance"})
public class update_attendance extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String course_name = (String) request.getSession().getAttribute("course_name");
            String present =(String) request.getParameter("var");
            String total = (String) request.getParameter("total");
            if(present==null)
            response.sendRedirect("upload_attendance.jsp?course_name="+course_name);
            else
            {
                String u = request.getParameter("student_id");
                String username [] = u.split(",");
                String b [] = new String[username.length];
                for(int i=0; i<username.length;i++)
                   b[i] = username[i];
                String [] arr = present.split(",");
                int [] a = new int[arr.length];
                for(int i=0; i<arr.length;i++) {
                  a[i] = Integer.parseInt(arr[i]);
                  }
               
               Connection con = null;
                con=DBConnection.dbconnect();
                for(int i=0; i<a.length;i++)
                {    
                    String qr="update studinfo set attended=? where username=? and course_name=?";
                    PreparedStatement ps = con.prepareStatement(qr);
                    ps.setInt(1,a[i]);
                    
                    ps.setString(2, b[i]);
                    ps.setString(3,course_name);
                    ps.executeUpdate();
                }
            response.sendRedirect("upload_attendance.jsp?course_name="+course_name+"&total="+total);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(update_attendance.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(update_attendance.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(update_attendance.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(update_attendance.class.getName()).log(Level.SEVERE, null, ex);
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
