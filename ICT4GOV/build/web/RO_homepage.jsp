<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bir.css">
    <title>e-ppointment</title>
  </head>

  <body>
      
      <%
          String u="", o="";
          
          if(session.getAttribute("currOfficerName")!=null)
            u=session.getAttribute("currOfficerName").toString();
          if (session.getAttribute("currOfficerDay")!=null)
            o=session.getAttribute("currOfficerDay").toString();
          
            session.setAttribute("select", "first");

          %>
    
    
    <nav class="navbar row navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>x
            <span class="icon-bar"></span>
          </button>
          <b><a class="navbar-brand" href="RO_homepage.jsp">e-ppointment</a></b>
        </div> <!-- navbar-header closing tag -->
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-left">
            <li><a href="edit_RO.jsp">View Account</a></li>
            <li><a href="adopt_client.jsp">Adopt Taxpayer</a></li>
            <li><a href="RO_appointment.jsp">Set Appointment</a></li>
            <li><a href="RO_manage.jsp">Manage Appointments</a></li>
            <li><a href="view_clients.jsp">View Clients</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li><a href="index.jsp">Sign Out</a></li>
          </ul>
        </div> <!-- navbar closing tag -->
      </div> <!-- container closing tag -->
    </nav>


        <div class="container">
          <div class="row row-centered">
            <div class="main col-lg-8 col-centered">

              <h1><strong>e-ppointment</strong></h1>
              <p><strong><span class="tagline"><i>Bureau of Internal Revenue Online Appointment System</span></strong></i><br></p>

              <div class="nav-container">
                  <div class="main-nav col-sm-12">
                    <a href="edit_RO.jsp">
                      <strong><h4>View Account</h4></strong>
                      <p>View your account, day and time availability for future appointments.</p>
                    </a>
                  </div> 
                  
                  <div class="nav-container">
                  <div class="main-nav col-sm-12">
                    <a href="adopt_client.jsp">
                      <strong><h4>Adopt Taxpayer</h4></strong>
                      <p>Select a taxpayer to adopt for future appointment setting.</p>
                    </a>
                  </div> 

                  <div class="main-nav col-sm-12">
                    <a href="RO_appointment.jsp">
                      <strong><h4>Set Appointment</h4></strong>
                      <p>Set an appointment with the clients.</p>
                    </a>
                  </div> 

                  <div class="main-nav col-sm-12">
                    <a href="RO_manage.jsp">
                      <strong><h4>Manage Appointments</h4></strong>
                      <p>View, edit, set or cancel an appointment made by you or the clients.</p>
                    </a>
                  </div> 

                  <div class="main-nav col-sm-12">
                    <a href="view_clients.jsp">
                      <strong><h4>View Clients</h4></strong>
                      <p>View contact information, day and time availability of the clients for future appointments.</p>
                    </a>
                  </div> 

              </div> <!-- nav-container closing tag   -->

            </div>   <!-- main div closing tag -->
          </div>  <!-- row div closing tag -->
        </div>  <!-- container closing tag -->

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>