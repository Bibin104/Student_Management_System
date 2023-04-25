
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter; 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;


@WebServlet(urlPatterns = {"/upload_notice"})
public class upload_notice extends HttpServlet {

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
                try
                {
                    String ImageFile="";
                    String itemName = "";
                    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                    if (!isMultipart)
                    {
                    }
                    else
                    {
                        FileItemFactory factory = new DiskFileItemFactory();
                        ServletFileUpload upload = new ServletFileUpload(factory);
                        List items = null;
                        try
                        {
                            items = upload.parseRequest(request);
                        }
                        catch (FileUploadException e)
                        {
                            e.getMessage();
                        }
                        Iterator itr = items.iterator();
                        while (itr.hasNext())
                        {
                            FileItem item = (FileItem) itr.next();
                            if (item.isFormField())
                            {
                                String name = item.getFieldName();
                                String value = item.getString();
                                if(name.equals("ImageFile"))
                                {
                                    ImageFile=value;
                                }

                            }
                            else
                            {
                                try
                                {
                                    itemName = item.getName();
                                    File savedFile = new File(getServletConfig().getServletContext().getRealPath("/")+"images\\"+itemName);
                                    item.write(savedFile);
                                }
                                catch (Exception e)
                                {
                                    out.println("Errorasfdsgsdg"+e.getMessage());
                                }
                            }
                        }
                        try
                        {
                        	  Connection con =null;
                              con=DBConnection.dbconnect();
                           
                            Statement st = con.createStatement();
                            st.executeUpdate("insert into notices(image_path) values ('"+itemName+"')");
            
                           
                            String str ="select address from student";
                            PreparedStatement ps = con.prepareStatement(str);
                            ResultSet rs = ps.executeQuery();
              
                       List<String> id= new ArrayList<>();
                            while(rs.next()) {
                            	 
                            	id.add(rs.getString("address"));   
                            }  
                        
                            // Recipient's email ID needs to be mentioned.
                            InternetAddress[] recipients = new InternetAddress[id.size()];
                            int c=0;
                            for(String recipient : id) {
                            	recipients[c]= new InternetAddress(recipient.trim());
                            	c++;
                            }
                         //   String to = "crce.8958.ce@gmail.com";

                            // Sender's email ID needs to be mentioned
                          final   String from = "projectteamabd@gmail.com";
                          final  String pass = "abd412558";

                            // Assuming you are sending email from localhost
                           // String host = "smtp.gmail.com";

                            // Get system properties object
                            Properties props = new Properties();
                            props.put("mail.smtp.auth", "true");
                            props.put("mail.smtp.starttls.enable","true");
                            props.put("mail.smtp.host","smtp.gmail.com");
                            props.put("mail.smtp.port","587");

                            // Defining properties

                          

                           

                           

                            // Setup mail server

                            // Get the default Session object.
                            Session mailSession = Session.getInstance(props,new javax.mail.Authenticator() {
                            	protected PasswordAuthentication getPasswordAuthentication() {
                            		return new PasswordAuthentication(from,pass);
                            	}
                            	
                            });

                            try {
                               // Create a default MimeMessage object.
                               MimeMessage message = new MimeMessage(mailSession);

                               // Set From: header field of the header.
                               message.setFrom(new InternetAddress(from));

                               // Set To: header field of the header.
                               message.setRecipients(Message.RecipientType.TO, recipients);
                              
                               // Set Subject: header field
                               message.setSubject("FRCRCE NOTIFICATION!");
                               message.setText("New Notice has been uploaded,Check by logging in to your account!");
                               // Create the message part
                              

                               // Send message
                               Transport.send(message);
                             
                              
                            } catch (MessagingException ex) {
                               ex.printStackTrace();
                              
                            }
                            
                        }
                        catch(Exception el)
                        {
                            out.println("Inserting error"+el.getMessage());
                        }
            
                    }
                }
                catch (Exception e){
                    out.println(e.getMessage());
                                    }
                
                response.sendRedirect("faculty_notice.jsp");
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
