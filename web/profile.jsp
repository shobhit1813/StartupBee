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
</style>
</head>
<body>

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

</body>
</html>
