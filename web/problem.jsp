<%-- 
    Document   : problem
    Created on : Jan 27, 2019, 6:20:06 PM
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
        <title>JSP Page</title>
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
    <%  
    String cato = request.getSession().getAttribute("cat").toString(); 
    if(cato.equals("Innovator")){
        %>
  <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="profile.jsp">My Profile</a>
  <a href="problem.jsp">Problems</a>
  <a href="mentor.jsp">My Mentor</a>
  <a href="acceptinvitation.jsp">Accept Invitation</a>
</div>

<div id="main">
  <h2><%=request.getSession().getAttribute("cat").toString() %> Problems</h2>
 
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9779;</span>
  <%
      try{
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/startupBee?useSSL=true&verifyServerCertificate=false&allowMultiQueries=true","root","1810");
          PreparedStatement ps = con.prepareStatement("select * from problem;");
          ResultSet rs = ps.executeQuery();
          while(rs.next()){
              %>
              <div class="ques">
                  <p><%= rs.getString(1) %><%= rs.getString(2) %></p>
              </div><br>
              <%
          
          }
  %>
</div>
  <%  }
    catch(Exception e){
        System.out.println(e);
        }
    }
    else{
    %>
    <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="profile.jsp">My Profile</a>
  <a href="problem.jsp">Add Mentor</a>
  <a href="mentor.jsp">Assign Mentor</a>
  <a href="acceptinvitation.jsp">Status</a>
</div>

<div id="main">
  <h2><%=request.getSession().getAttribute("cat").toString() %></h2>
  <p>Click on the element below to open the side navigation menu, and push this content to the right. Notice that we add a black see-through background-color to body when the sidenav is opened.</p>
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
</div>
  <% }%>

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

    </body>
</html>
