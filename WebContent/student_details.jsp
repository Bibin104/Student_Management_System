

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Portal</title>
        <link rel="stylesheet" href="styles.css">
        
    </head>
   
    <body>
        <%
        String user = (String)request.getParameter("username");
        if(user!=null)
        session.setAttribute("uname", user);
        %>
        <div class="divide" style="background-color: #43425D; left: 0">
            <div style="color:white;font-size: 20px; font-family: sans-serif;display: block;text-align: center;
                 margin-top: 20px; margin-bottom: 25px;">FRCRCE</div>
            <hr> 
            <ul>
                  <li><a href="admin_home.jsp">Home</a></li>
                  <li><a href="enroll_student.jsp">Enroll Student</a></li>
  <li><a href="enroll_faculty.jsp">Enroll Faculty</a></li>
   
  <li><a href="student_details.jsp" class="active">Student Details</a></li>
  <li><a href="faculty_details.jsp">Faculty Details</a></li>


  <li><a href="course_register.jsp">Course Registration</a></li>
  <li><a href="course_details.jsp">Course Details</a></li>
  <li><a href="index.jsp">Sign Out</a>
</ul> 
        </div>
        <%
          String status = (String)request.getParameter("status");
          if(status==null)
            status="T";
//          out.println(status);
//      %>
                    <div class="divide" style="left: 30%; width: 50%; top: 20%; height: 75%; right: 20%; overflow-x: auto; overflow-y: auto">
                        <div class="divide" style="right: 50%; width: 50%; left: 20%; top: 25%; height: 35%">
                        <form action="fetch_student_details"> 
                        
                         <%
                             if(status.equals("F"))
//        
                            {
//                         %>
        <font style="color: red;margin-left: 80px;margin-bottom: 5px">Student does not exist!!</font>
        <%  
                }else{
                        }
        %>
                            <input type="text" name="student_username" placeholder="Username">
                        <br>
                        <br>
                        <input type="submit" value="Fetch Details">
                    </form>
                            </div>
                        </div>
            
    </body>
</html>
