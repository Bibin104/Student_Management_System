

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
                text-align: center;
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
  <li><a href="notices.jsp">Notices</a></li>
  <li><a href="student_details.jsp">Student Details</a></li>
  <li><a href="faculty_details.jsp">Faculty Details</a></li>
  

  <li><a href="course_register.jsp">Course Registration</a></li>
  <li><a href="course_details.jsp" class="active">Course Details</a></li>
  <li><a href="index.jsp">Sign Out</a>
</ul> 
        </div>
         <%
//          String status = (String)request.getParameter("status");
String course_id = (String) request.getParameter("course_id");

//          if(status==null)
//            status="T";
//          out.println(status);
//      %>
                    <div class="divide" style="left: 30%; width: 50%; top: 20%; height: 75%; right: 20%; overflow-x: auto; overflow-y: auto">
                        
                        <%
                        Class.forName("com.mysql.jdbc.Driver");
                        //session.setAttribute("A", "SA");
                       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagement", "root", "rootroot");
               String qr="select course_name,semester,branch,faculty_name from courses where course_id=?";
                PreparedStatement ps=con.prepareStatement(qr);
                ps.setString(1,course_id);
               ResultSet rs = ps.executeQuery();
                if(rs.next())       
                { %>
                            <table id="customers" style="width: 73%; margin-left: 30px">
                            <tr>
                                <th rowspan="3">Course Details </th>
                                <td>  Course ID : <%=course_id%>
                            </td>
                            </tr>
                            <tr>
                            <td>
                               Semester: <%=rs.getString("semester")%> 
                            </td>
                            </tr>
                            <tr>
                            <td>
                               Faculty name : <%=rs.getString("faculty_name")%> 
                            </td>
                            </tr>
                            <tr><td>
                             Course Name : <%=rs.getString("course_name")%>                            
                            </td>
                            </tr>
                            <tr>
                            <td>
                               Branch: <%=rs.getString("branch")%> 
                            </td>
                            </tr>
                            <tr>
                                <th>Semester
                                
                                </th>
                                <th>Student Name</th>
                                <th>Student Name</th>
                            </tr>
                            <%
                            
//                session.setAttribute("A", "SA");
               
                qr="select student.fname,student.username,courses.semester,student.lname from student,courses where student.semester=courses.semester and course_id=?;";
                
                ps=con.prepareStatement(qr);
                ps.setString(1,course_id);
                rs = ps.executeQuery();
                while(rs.next())
                {
         %>
         <tr>
             <td>
                 <%=rs.getString("courses.semester")%>
             </td>
             <td>
                 <%=rs.getString("student.fname")+" "+rs.getString("student.lname")%>
             </td>
             <td>
                 <%=rs.getString("student.username")%>
             </td>
         </tr>
         <%}}%>
                        </table>
                        
                        </div>
<!--                        <div class="divide" style="right: 50%; width: 50%; left: 16%; top: 65%; height: 35%">
                        <form action="fetch_course_details"> 
                        
                         <%
//                             if(status.equals("F"))
//        
                            {
//                         %>
        <font style="color: red;margin-left: 80px;margin-bottom: 5px">Student does not exist!!</font>
        <%  
//                }else{
                        }
        %>
                            <input type="text" name="course_id" placeholder="Course ID">
                        <br>
                        <br>
                        <input type="submit" value="Fetch Course Details">
                    </form>
                            </div>-->
                        </div>
            
    </body>
</html>
