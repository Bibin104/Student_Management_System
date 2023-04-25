

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Attendance</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <script>
            function courseNameSelection()
            {
                var x = document.getElementById("course_select");
                var course_name = x.options[x.selectedIndex].text;
                console.log(course_name);
                window.location.replace("total_lectures?course_name="+course_name);
//                document.getElementById("customers").style.display="block";
            }
            function update_details(){
                       alert("Please contact the administrator to update the details!");
            }
        </script>
       
    </head>
    <body>
       <div class="divide" style="background-color: #43425D; left: 0">
            <div style="color:white;font-size: 20px; font-family: sans-serif;display: block;text-align: center;
                 margin-top: 20px; margin-bottom: 25px;">FRCRCE</div>
            <hr> 
            <ul>
                <li><a href="faculty_home.jsp">Home</a></li>
                <li><a href="faculty_attendance.jsp" class="active">Upload Attendance</a></li>
                <li><a href="faculty_notice.jsp">Upload Notices</a></li>
                <li><a href="faculty_marks.jsp">Upload Marks</a></li>
                   <li><a href="index.jsp">Sign Out</a>

  
            </ul> 
        </div>
        <div class="divide" style="left: 42%; width: 50%; height: 45%; top: 42%; right: 20%; overflow-x: auto; overflow-y: auto">
            
            <select id="course_select" style="margin-left: 38px">
            <%
            String username = (String) session.getAttribute("uname");
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagement","root","rootroot");
            String qr="select course_id,course_name from courses where username=?";
            PreparedStatement ps=con.prepareStatement(qr);
            ps.setString(1,username);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
            %>
            <option> <%=rs.getString("course_name")%></option>
            <%  
            }
            %>
            </select>
            <br><br>
            <input type="submit" value="See Students Enrolled" style="margin:0" onclick="courseNameSelection()">
        </div>
            <div class="divide facutly_info_right">
           
            
              <p align="center" class="facutly_info">
                <%
                    Class.forName("com.mysql.jdbc.Driver");  
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagement","root","rootroot");
                    qr="select fname,lname,department from faculty where username=?";
                   ps=con.prepareStatement(qr);
                    ps.setString(1,username);
                   rs=ps.executeQuery();
                    while(rs.next())
                    {
                        String fname = rs.getString("fname");
                        String lname = rs.getString("lname");
                        String department = rs.getString("department");
                        
                %>
            
                Name : <%=fname+" "+lname%>
                <br><br>
                Department : <%=department%>
                <br><br>
                
                <br><br>
                <%}%>
            <form onsubmit="update_details()">
                <input type="submit" value="Update Details">

            </form>
            </p>
        </div>
       
    </body>
</html>
