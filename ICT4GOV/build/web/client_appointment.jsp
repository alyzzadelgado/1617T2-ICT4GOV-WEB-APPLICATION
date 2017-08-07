<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="DAO.DBConnectionFactory"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- edit -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/bir.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker.min.css">
		<title>e-ppointment</title>
	</head>

	<body>
            
            <%
                String ROName="", RODays="", ROTime="";
                
                if(session.getAttribute("currOfficerName")!=null)
                    ROName = session.getAttribute("currOfficerName").toString();
                if(session.getAttribute("currOfficerDay")!=null)
                    RODays = session.getAttribute("currOfficerDay").toString();
                if(session.getAttribute("currOfficerTime")!=null)
                    ROTime = session.getAttribute("currOfficerTime").toString();
                
                String date="", time="";
                
                if (session.getAttribute("book_date")!=null)
                    date = session.getAttribute("book_date").toString();
                else
                    date = "";
                if (session.getAttribute("book_time")!=null)
                    time = session.getAttribute("book_time").toString();
                else
                    time = "";
                
                DBConnectionFactory factory = DBConnectionFactory.getInstance();
                Connection connection = factory.getConnection();
                Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
      
                String query = "select * from transaction order by name asc";
                ResultSet result = null;
                

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
			            <li><a href="edit_accountjsp.jsp">View Account</a></li>
			            <li><a href="client_appointment.jsp">Set Appointment</a></li>
			            <li><a href="client_manage.jsp">Manage Appointments</a></li>
			            <li><a href="view_RO.jsp">Revenue Officer</a></li>
			          </ul>

					<ul class="nav navbar-nav navbar-right">
						<li><a href="index.jsp">Sign Out</a></li>
					</ul>
				</div> <!-- navbar closing tag -->
			</div> <!-- container (for navigation) closing tag -->
		</nav>

		<div class="container">
			<div class="row row-centered">
				<div class=" main col-lg-8 col-centered">

					<h1><strong>Set Appointment</strong></h1>
					<p><strong> Set an appointment with <%=ROName%>. </strong></p>
					<p><strong> Available days: <%=RODays%></strong></p>
					<p><strong> Available time: <%=ROTime%></strong></p>

					<div class="tab-0"> <!-- venue div opening -->
                                            <form method="POST" action="clientBook">

							<div class="book form-group"> <!-- date input form opening tag -->
								<label class="col-sm-2 control-label"> Date </label>
								<div class="col-sm-10 date">
									<div class="input-group input-append date" id="app-datepicker">
										<input required name="date" type="text" class="form-control" data-format="YYYY-MM-DD" value="<%=date%>"></input>
										<span class="input-group-addon add-on time-color">
										<i class="glyphicon glyphicon-calendar"></i></span>
									</div>
								</div>
							</div> <!-- date input closing tag -->

							<div class="book form-group"> <!-- start time input form opening tag -->
								<label class="col-sm-2 control-label"> Time </label>
								<div class="col-sm-10 time">
									<div class="input-group input-append time" id="app-timepicker">
                                                                            <input required name="startTime" type="text" class="form-control" data-format="HH:mm:ss" value="<%=time%>">
										<span class="input-group-addon add-on">
										<i class="glyphicon glyphicon-time"></i></span>
									</div>
								</div>
							</div> <!-- start time input closing tag -->

							<!--<div class="book form-group"> <!-- end time input form opening tag 
								<label class="col-sm-2 control-label"> End Time </label>
								<div class="col-sm-10 time">
									<div class="input-group input-append time" id="venue-end-timepicker">
										<input required name="endTime "type="text" class="form-control" data-format="hh:mm"></input>
										<span class="input-group-addon add-on">
										<i class="glyphicon glyphicon-time"></i></span>
									</div>
								</div>
							</div> <!-- end time input closing tag -->
                                                        
                                                        <%
                                                            result = statement.executeQuery(query);
                                                          %>

							<div class="book form-group">  <!-- venue input form opening tag -->
								<label class="col-sm-2 control-label">Transaction</label>
								<div class="col-sm-10">
								<select name="transaction" class="form-control" id="inputVenue">
                                                                        <% while (result.next()) {%>
                                                                            <option value="<%=result.getInt("transaction_no")%>"><%=result.getString("name")%>
                                                                              <%}
                                                                              result.first();
                                                                              result.previous(); %>
                                                                </select>
								</div>
                                                                
							</div>
                                                                
                                                                <div class="book form-group"> <!-- date input form opening tag -->
								<label class="col-sm-2 control-label"> Reason for Appointment </label>
								<div class="col-sm-10 date">
									<div class="input-group input-append date" id="app-datepicker">
                                                                            <textarea rows="7" cols="96.5" name="reason" placeholder="Enter text here"> </textarea>
									</div>
								</div>
							</div>
                                                                <br>
							<input name="book" class="btn btn-default sub-btn" type="submit" value="Continue" style="float:right">
							<input name="cancel" class="btn btn-default sub-btn" type="submit" value="Cancel" onclick="confirmation()" formnovalidate="formnovalidate">
                                                        <input name="confirm" id="x" hidden="true"/>
						</form>
					</div>	<!-- venue closing tab -->


				</div> <!-- main div closing tag-->
			</div> <!-- row (for main form) closing tag -->
		</div>	<!-- container (for main) closing tag	 -->
                
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
                
                <%
      result.close();
      statement.close();
      connection.close();
    %>
                
                
	</body>
	

</html>