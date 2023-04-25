

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
        <title>FRCRCE</title>
        <style type = "text/css">
        body {
        font-family: "Trebuchet MS";
        }
        span.psw {
            float: right; 
            padding-top: 0px; 
        }
 </style>  
 <script>
     function alert_message(){ 
         alert("Contact the administrator department!!")
     }
 </script>
    <link rel="stylesheet" href="css/style.css">
  
</head>
<body>
    <div class="split left"> 
           <img src="https://aglasem-cdn.s3.ap-south-1.amazonaws.com/college/college-images/fr-conceicao-rodrigues-college-of-engineering-crce-mumbai.png" alt ="image" height="400" width="635">
           <img src="https://media.icbse.com/2052/1-4317814.jpg" alt ="image" height="170" width="635">
<div class="split right">
    <div class="centered" style="width:400px;height: 400px">
      <h2 align="center">Fr Conceicao Rodrigues College Of Engineering,Bandra(W)</h2>
      <p align="center" style="font-size: 20px">Login Portal</p>
      <%
          String status = (String)request.getParameter("status");
          if(status==null)
            status="T";
      %>
    <form action="login">
        <input type="radio" name="type_of_login" value="1">Faculty &emsp;
        <input type="radio" name="type_of_login" value="0">Student login &emsp; 
        <input type="radio" name="type_of_login" value="2">Admin login <br>
        <br>
        <%if(status.equals("F"))
        {%>
        <font style="color: red">Username and Password do not match!!</font>
        <%}
            else if(status.equals("L"))
        {
        %>
        <font style="color: red">Select login account type!!</font>
        <%}
        else{}
        %>
        <input type="text" name="username" placeholder="Username" ><br>
        <input type="password" name="password" placeholder="Password" ><br>
      
        <input type="submit" value="Login">
    </form>
    </div>
    
  </div>
<!--</div>--> 
</body>
</html>
