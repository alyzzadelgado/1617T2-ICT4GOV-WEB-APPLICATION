<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="DAO.DBConnectionFactory"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bir.css">
    <title>e-appointment</title>
  </head>

  <body>
      
      <%
          String tin="", name="", password="";
        
        if (session.getAttribute("client_tin")!=null)
            tin = String.valueOf(session.getAttribute("client_tin"));
        
        if (session.getAttribute("client_username")!=null)
            name = String.valueOf(session.getAttribute("client_username"));

        if (session.getAttribute("client_password")!=null)
            password = String.valueOf(session.getAttribute("client_password"));
        
          %>
    

  <div class="container">
    <div class="row row-centered">  <!-- center the block -->
      <div id="login" class="col-md-6 col-sm-8 col-centered" > 

        <img src="img/bir.png">
        <h1 class="e-title">e-ppointment</h1>
        <p class="text-center"><strong><i>Bureau Of Internal Revenue Online Appointment System.</i></strong><br>
        Registration Form Part 1</p>
      
          <form method="POST" action="register">
            <div class="form-group">    <!-- TIN form -->
              <label for="inputUserID">TIN</label>
              <input required value="<%=tin%>" name="tin" type="text" pattern="^\d{3}-\d{3}-\d{3}-\d{3}" class="form-control" id="inputUserID" placeholder="XXX-XXX-XXX-XXX" minlength="12">
              <% if (session.getAttribute("tinExists")!=null) {%>
              <p style="color:#e07572"> TIN already exists </p>
              <% } %>
            </div>

            <div class="form-group">    <!-- username form -->
              <label for="inputUserID">Username</label>
              <input required value="<%=name%>" name="username" type="text" class="form-control" id="inputUserID" placeholder="Username">
              <% if (session.getAttribute("usernameExists")!=null) {%>
              <p style="color:#e07572"> Username already exists </p>
              <% } %>
            </div>

            <div class="form-group">    <!-- password form -->
              <label for="inputPass">Password</label>
              <input required value="<%=password%>" name="password" type="password" class="form-control" id="inputPass" placeholder="Password">
            </div>
              
              <!-- button for submission -->
              <input name="continue" type="submit" value="Continue" class="btn btn-default" style="float: right">
              <input name="cancel" type="submit" value="Cancel" onclick="confirmation()" class="btn btn-default" formnovalidate="formnovalidate">
        
        <input name="confirm" id="x" hidden="true"/>
        <!-- <button class="btn btn-default" type="submit">Submit</button> -->
              
          </form>


      </div>
    </div>
  </div>
      <script>
          function confirmation(){
            var x = confirm("Are you sure you want to cancel?");
            if (x===true)
              document.getElementById('x').value = 1;
            else
              document.getElementById('x').value = 0;
          }
          </script>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/moment.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/book.js"></script>
    
  </body>
</html>