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
          session.setAttribute("usernameExists", null);
          session.setAttribute("tinExists", null);
          session.setAttribute("usernameIncorrect", null);
          session.setAttribute("passwordIncorrect", null);
          session.setAttribute("client_tin", null);
            session.setAttribute("client_username", null);
            session.setAttribute("client_password", null);
            session.setAttribute("client_firstname", null);
            session.setAttribute("client_middle", null);
        session.setAttribute("client_lastname", null);
        session.setAttribute("client_phone", null);
        session.setAttribute("avail_days", null);
        session.setAttribute("avail_time", null);
        session.setAttribute("officer", null);
          
          session.setAttribute("currUserNum", null);
          session.setAttribute("currUserOfficer", null);
          session.setAttribute("currOfficerName", null);
                    session.setAttribute("currOfficerDay", null);
                    session.setAttribute("currOfficerTime", null);
                    session.setAttribute("currOfficerPhone", null);
                    
            session.setAttribute("book_date", null);
          session.setAttribute("book_time", null);
          session.setAttribute("book_reason", null);
          
          
          session.setAttribute("app_accepted", null);
          
          %>
    

  <div class="container">
    <div class="row row-centered">  <!-- center the block -->
      <div id="login" class="col-md-6 col-sm-8 col-centered" > 

        <img src="img/bir.png">
        <h1 class="e-title">e-ppointment</h1>
        <p class="text-center"><strong><i>Bureau Of Internal Revenue Online Appointment System.</i></strong><br>
        Set an appointment before going to the BIR Main Office.</p>
      
          <form method="POST" action="login">
            <div class="form-group">    <!-- user id form -->
              <label for="inputUserID">Username</label>
              <input required type="text" class="form-control" id="inputUserID" placeholder="Username" name="username">
              <% if (session.getAttribute("usernameIncorrect")!=null) {%>
              <p style="color:#e07572"> Incorrect username </p>
              <% } %>
            </div>

            <div class="form-group">    <!-- password form -->
              <label for="inputPass">Password</label>
              <input required type="password" class="form-control" id="inputPass" placeholder="Password" name="password">
              <% if (session.getAttribute("passwordIncorrect")!=null) {%>
              <p style="color:#e07572"> Incorrect password </p>
              <% } %>
            </div>
              
              <!-- button for submission -->
        <input name="login" type="submit" value="Login" class="btn btn-default" style="float:right">
        <input name="register" type="submit" value="Register" class="btn btn-default" formnovalidate="formnovalidate" >
        <!-- <button class="btn btn-default" type="submit">Submit</button> -->
        
        <br><br><br>
              <p class="view-edit"> Note: A taxpayer will not be able to login to the system<br>unless a Revenue Officer has adopted him already.</p>
          
          </form>
        
        


      </div>
    </div>
  </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>