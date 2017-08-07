<%@page import="java.sql.PreparedStatement"%>
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

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bir.css">
    <title>e-ppointment</title>
  </head>

  <body>
    
      <%
                String ROName="", RODays="", ROTime="", RONum="", ROMid="";
                
        DBConnectionFactory factory = DBConnectionFactory.getInstance();
      Connection connection = factory.getConnection();
      Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
      Statement statement1 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
      
      
      int user = Integer.parseInt(String.valueOf(session.getAttribute("currUserNum")));
      int client;
     
        String query1;
        String query = "select * from user where officer_no = "+user+" order by last_name asc";
        
        ResultSet result = null;
        ResultSet result1 = null;
        
        if (session.getAttribute("select").equals("first"))
        {
            query1 = "select * from user where officer_no = "+user+" order by last_name asc limit 1";
            result1 = statement1.executeQuery(query1);
        }
        else
        {
            if (session.getAttribute("view_clientNum") != null)
            {
                client = Integer.parseInt(String.valueOf(session.getAttribute("view_clientNum")));
                query1 = "select * from user where user_no = " + client;
                result1 = statement1.executeQuery(query1);
            }
        }
        
        
            while(result1.next())
            {
                    ROName = result1.getString("first_name") + " " + result1.getString("middle_initial") + " " + result1.getString("last_name");
                    RODays = result1.getString("avail_days");
                    ROTime = result1.getString("avail_time");
                    RONum = result1.getString("phone_no");
                    session.setAttribute("view_clientNum", result1.getInt("user_no"));
            }
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
              		<h1><strong>BIR Clients</strong></h1>
					<p> Contact Information and Availability of your clients. <br><br></p>
              		<div class="nav-container">
                		<div class="row row-centered">
                                    
                                     <%
                    result = statement.executeQuery(query);
                    
                  %>
                                    
                                    <form method="POST" action="viewClient">
                                            <label class="view-edit">Select Client:</label><br>
                                            
                                            <select name="viewClient" class="form-control">
                                                <% while (result.next()) {
                                                    %>
                                                   <option value="<%=result.getInt("user_no")%>"><%=result.getString("last_name")%>, <%=result.getString("first_name")%> <%=result.getString("middle_initial")%>
                                                     <%}
                                                     result.first();
                                                     result.previous(); %>
                                             </select>
                                             <br>
                                            <input name="select" type="submit" value="Select" class="btn btn-default" style="float:right">
                                    </form>
                                             
                                             <br>
                                             <br>
                                             <br>
                  			<div class="view-nav col-sm-12">
                                            <h4><strong>Client Name</strong></h4>
                                                <p class="view-size"><%=ROName%></p>
                                                <br>
        					<h4><strong>Client Contact Number</strong></h4>
        					<p class="view-size"><%=RONum%></p>
                                                <br>
        					<h4><strong>Client Available Days</strong></h4>
        					<p class="view-size"><%=RODays%></p>
                                                <br>
        					<h4><strong>Client Available Time</strong></h4>
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
    
    <%
      statement.close(); 
      statement1.close();
      result.close();
      result1.close();
      connection.close();
    %>
    
  </body>
</html>