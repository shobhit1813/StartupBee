<%-- 
    Document   : profile
    Created on : Jan 24, 2019, 2:42:37 PM
    Author     : shobhit
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    
    .card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 400px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.title {
  color: grey;
  font-size: 18px;
}

button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
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
</head>
<body>
    <% if(request.getSession().getAttribute("cat").toString().equals("Innovator")){       
%>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="profile.jsp">My Profile</a>
  <a href="problem.jsp">Problems</a>
  <a href="mentor.jsp">My Mentor</a>
  <a href="acceptinvitation.jsp">Accept Invitation</a>
</div>
<%}
else{ %>

    <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="profile.jsp">My Profile</a>
  <a href="addmentor.html">Add Mentor</a>
  <a href="assignMentor.jsp">Assign Mentor</a>
  <a href="status.jsp">Status</a>
</div>
<% } %>
<div id="main">
     <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
<h2 style="text-align:center">User Profile Card</h2>
<%      
        String tab = "";
        String table = request.getSession().getAttribute("cat").toString();
        if(table.equals("Innovator"))
            tab = "Inno";
        else
            tab = "Coorp";
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/startupBee?useSSL=true&verifyServerCertificate=false&allowMultiQueries=true","root","1810");
        PreparedStatement ps = con.prepareStatement("select * from register"+tab+" where email=?");
        ps.setString(1,request.getSession().getAttribute("user").toString());
        ResultSet rs = ps.executeQuery();
        if(table.equals("Innovator")){
            if(rs.next()){
    %>
<div class="card">
  <img src="profile.png" alt="John" style="width:100%">
  <h1><%=rs.getString(1)%>  <%= rs.getString(2) %></h1>
  <p class="title"><%= rs.getString(3)%></p>
  <p><%= rs.getString(6)%></p>
      <%
        }
            }
            else{
            if(rs.next()){
                %>
   <div class="card">
  <img src="profile.png" alt="John" style="width:100%">
  <h1>Company Name:<%=rs.getString(1)%></h1>
  <p class="title"><h3><%= rs.getString(2)%></h3></p>
  <p>Head Name: <%= rs.getString(3)%></p>
      <%   }
              }   
                }   
                catch(Exception e){
                    System.out.println(e);
                }
      %>
      <div style="margin: 24px 0;">
    <a href="#"><i class="fa fa-dribbble"></i></a> 
    <a href="#"><i class="fa fa-twitter"></i></a>  
    <a href="#"><i class="fa fa-linkedin"></i></a>  
    <a href="#"><i class="fa fa-facebook"></i></a> 
  </div>
  <p><button>Contact</button></p>
</div>
</div>
</div>
</body>
</html>
