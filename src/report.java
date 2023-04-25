
import java.io.FileOutputStream;
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

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


@WebServlet(urlPatterns = {"/report"})
public class report extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String course_name = (String) request.getSession().getAttribute("course_name");
            
//            String total = (String) request.getParameter("total");
//            if(present==null)
//            response.sendRedirect("upload_attendance.jsp?course_name="+course_name);
//            else
         try{
           String course = (String)request.getParameter("course_name");
        //   String file_name="C:\\Users\\report.pdf";
           Document document = new Document();
           PdfWriter.getInstance(document, new FileOutputStream("C:\\Users\\djnai\\Downloads\\report.pdf"));
           document.open();
          PdfPTable table = new  PdfPTable(7);
           PdfPCell tcell;
           tcell = new PdfPCell(new Phrase("Roll No"));
           table.addCell(tcell);
           tcell = new PdfPCell(new Phrase("First Name"));
           table.addCell(tcell);
           tcell = new PdfPCell(new Phrase("Last Name"));
           table.addCell(tcell);
           tcell = new PdfPCell(new Phrase("Course Name"));
           table.addCell(tcell);
           tcell = new PdfPCell(new Phrase("IA Marks"));
           table.addCell(tcell);
           tcell = new PdfPCell(new Phrase("Attended"));
           table.addCell(tcell);
           tcell = new PdfPCell(new Phrase("Total"));
           table.addCell(tcell);
           Connection con =null;
           con=DBConnection.dbconnect();
           PreparedStatement ps = null;
           ResultSet rs = null;
           String query = "select studinfo.username,student.fname,student.lname,studinfo.course_name, studinfo.attended,studinfo.total,studinfo.marks from student,studinfo where student.username = studinfo.username and studinfo.course_name=?";
          
           ps=con.prepareStatement(query);
           ps.setString(1, course);
           rs=ps.executeQuery();
           while(rs.next()) {
        	  // Paragraph para = new Paragraph(rs.getString("studinfo.username")+" "+rs.getString("student.fname")+" "+rs.getString("student.lname")+" "+rs.getString("studinfo.course_name")+" "+rs.getString("studinfo.marks")+" "+rs.getString("studinfo.attended")+" "+rs.getString("studinfo.total"));
        	   String uname = rs.getString("studinfo.username");
               tcell = new PdfPCell(new Phrase(uname));
               table.addCell(tcell);
               String fname = rs.getString("student.fname");
               tcell = new PdfPCell(new Phrase(fname));
               table.addCell(tcell); 
               String lname = rs.getString("student.lname");
               tcell = new PdfPCell(new Phrase(lname));
               table.addCell(tcell); 
               String coursename = rs.getString("studinfo.course_name");
               tcell = new PdfPCell(new Phrase(coursename));
               table.addCell(tcell);
               String marks = rs.getString("studinfo.marks");
               tcell = new PdfPCell(new Phrase(marks));
               table.addCell(tcell);
               String attended = rs.getString("studinfo.attended");
               tcell = new PdfPCell(new Phrase(attended));
               table.addCell(tcell);
               String total= rs.getString("studinfo.total");
               tcell = new PdfPCell(new Phrase(total));
               table.addCell(tcell);
              
        	  
           }
           document.add(table);
          document.close();
           	        		
         }
         catch(Exception e){
        	 
         }
           
           
           
           
           
            response.sendRedirect("upload_marks.jsp?course_name="+course_name);
        
        } catch (Exception ex) {
            Logger.getLogger(update_marks.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
        processRequest(request, response);
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

