

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
        <style>
            #customers 
            {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }
            #customers td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
            }
            #customers tr:nth-child(even){background-color: #f2f2f2;}
            #customers tr:hover {background-color: #ddd;}
            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }
    </style>
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
 
  <li><a href="student_details.jsp">Student Details</a></li>
  <li><a href="faculty_details.jsp">Faculty Details</a></li>
  

  <li><a href="course_register.jsp">Course Registration</a></li>
  <li><a href="course_details.jsp" class="active">Course Details</a></li>
    <!--<li><a href="chat_faculty.jsp">Chat Room</a></li>-->

  <li><a href="index.jsp">Sign Out</a>
</ul> 
        </div>
         <%
          String status = (String)request.getParameter("status");
          if(status==null)
            status="T";
//          out.println(status);
//      %>
                    <div class="divide" style="left: 20%; width: 80%; top: 30%; height: 80%; right: 20%; overflow-x: auto; overflow-y: auto">
                        <div style="overflow-x: auto;overflow-y: auto; height: 50%; width: 70%">
                        <table id="customers" style="width: 80%; margin-left: 100px">
                            <tr>
                                <th>Course ID</th>
                                <th>Course Name</th>
                                <th>Semester</th>
                                <th>Branch</th>
                                <th>Faculty Name</th>
                            </tr>
                            <%
                             
//                session.setAttribute("A", "SA");
                            Class.forName("com.mysql.jdbc.Driver");
                         //   session.setAttribute("A", "SA");
                           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagement", "root", "rootroot");
               
              String qr="select course_id,course_name,semester,branch,faculty_name from courses;";
                PreparedStatement ps=con.prepareStatement(qr);
               ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
         %>
         <tr>
             <td>
                 <%=rs.getString("course_id")%>
             </td>
             <td>
                 <%=rs.getString("course_name")%>
             </td>
              <td>
                 <%=rs.getString("semester")%>
             </td>
              <td>
                 <%=rs.getString("branch")%>
             </td>
              <td>
                 <%=rs.getString("faculty_name")%>
             </td>
         </tr>
         <%}%>
                        </table>
                        
                        </div>
                        <div class="divide" style="right: 50%; width: 50%; left: 16%; top: 65%; height: 35%">
                            <form action="show_course_details.jsp"> 
                        
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
                            <input type="text" name="course_id" placeholder="Course ID">
                        <br>
                        <br>
                        <input type="submit" value="Fetch Course Details">
                    </form>
                            </div>
                        </div>
            
    </body>
</html>
