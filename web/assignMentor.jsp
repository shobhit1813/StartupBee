<%-- 
    Document   : assignMentor
    Created on : Jan 28, 2019, 7:20:41 AM
    Author     : shobhit
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Mentor</title>
    </head>
    <style>
                body {
       font-family: "Lato", sans-serif;
       transition: background-color .5s;
     }

     .sidenav {
       height: 100%;
       width: 0;
       position: fixed;
       z-index: 1;
       top: 0;
       left: 0;
       background-color: #111;
       overflow-x: hidden;
       transition: 0.5s;
       padding-top: 60px;
     }
     .ques{

     }
     .sidenav a {
       padding: 8px 8px 8px 32px;
       text-decoration: none;
       font-size: 25px;
       color: #818181;
       display: block;
       transition: 0.3s;
     }

     .sidenav a:hover {
       color: #f1f1f1;
     }

     .sidenav .closebtn {
       position: absolute;
       top: 0;
       right: 25px;
       font-size: 36px;
       margin-left: 50px;
     }

     #main {
       transition: margin-left .5s;
       padding: 16px;
     }

     @media screen and (max-height: 450px) {
       .sidenav {padding-top: 15px;}
       .sidenav a {font-size: 18px;}
     }   
    </style>
    <body>
    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="profile.jsp">My Profile</a>
        <a href="addmentor.html">Add Mentor</a>
        <a href="assignMentor.jsp">Assign Mentor</a>
        <a href="status.jsp">Status</a>
    </div>
    <div id="main">
        <h2>Assign Mentor </h2>
        <p>Select problem to assign mentor</p>
        <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
        <%
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/startupBee?useSSL=true&verifyServerCertificate=false&allowMultiQueries=true","root","1810");
                PreparedStatement ps = con.prepareStatement("select * from problem");
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    
                }
            }
            catch(Exception e){
                
            }
            %>
    </div>
    </body>
    <script>
    function openNav() {
      document.getElementById("mySidenav").style.width = "250px";
      document.getElementById("main").style.marginLeft = "250px";
      document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
    }

    function closeNav() {
      document.getElementById("mySidenav").style.width = "0";
      document.getElementById("main").style.marginLeft= "0";
      document.body.style.backgroundColor = "white";
    }
</script>

</html>
