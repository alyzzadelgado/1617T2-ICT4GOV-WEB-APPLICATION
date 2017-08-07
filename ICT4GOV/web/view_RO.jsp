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
                String ROName="", RODays="", ROTime="", RONum="";
                
                if(session.getAttribute("currOfficerName")!=null)
                    ROName = session.getAttribute("currOfficerName").toString();
                if(session.getAttribute("currOfficerDay")!=null)
                    RODays = session.getAttribute("currOfficerDay").toString();
                if(session.getAttribute("currOfficerTime")!=null)
                    ROTime = session.getAttribute("currOfficerTime").toString();
                if(session.getAttribute("currOfficerPhone")!=null)
                    RONum = session.getAttribute("currOfficerPhone").toString();
                
                %>
    
    <nav class="navbar row navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <b><a class="navbar-brand" href="client_homepage.jsp">e-ppointment</a></b>
        </div> <!-- navbar-header closing tag -->
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-left">
            <li><a href="edit_account.jsp">View Account</a></li>
            <li><a href="client_appointment.jsp">Set Appointment</a></li>
            <li><a href="client_manage.jsp">Manage Appointments</a></li>
            <li><a href="view_RO.jsp">Revenue Officer</a></li>
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
              		<h1><strong>Revenue Officer</strong></h1>
					<p> Contact Information and Availability of your Revenue Officer. <br><br></p>
              		<div class="nav-container">
                		<div class="row row-centered">
                  			<div class="view-nav col-sm-12">
        								<h4><strong>RO Name</strong></h4>
                                                                        <p class="view-size"><%=ROName%></p>
                                                                        <br>
        								<h4><strong>RO Contact Number</strong></h4>
        								<p class="view-size"><%=RONum%></p>
                                                                        <br>
        								<h4><strong>RO Available Days</strong></h4>
        								<p class="view-size"><%=RODays%></p>
                                                                        <br>
        								<h4><strong>RO Available Time</strong></h4>
        								<p class="view-size"><%=ROTime%></p>
    							</div>
  							</div>
               		 </div>  <!-- row closing tag -->

              		</div> <!-- nav-container closing tag   -->

           		 </div>   <!-- main div closing tag -->
          	</div>  <!-- row div closing tag -->
        </div>  <!-- container closing tag -->

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>