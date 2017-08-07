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
                
        DBConnectionFactory factory = DBConnectionFactory.getInstance();
      Connection connection = factory.getConnection();
      Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
      Statement statement1 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
      Statement statement2 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
      Statement statement3 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
      
      int aNum = Integer.parseInt(String.valueOf(session.getAttribute("app_no")));
      int tNum = Integer.parseInt(String.valueOf(session.getAttribute("app_trans")));
     
        String query1 = "select * from requirements where transaction_no = " + tNum;
        
        String query = "select * from transaction where transaction_no = " + tNum;
        
        String query3 = "select * from appointment where app_no = " +aNum;
        
        ResultSet result = null;
        ResultSet result1 = null;
        ResultSet result2 = null; 
        ResultSet result3 = null; 
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
            <li><a href="RO_appointment.jsp">Set Appointment</a></li>
            <li><a href="RO_manage.jsp">Manage Appointments</a></li>
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
              		<h1><strong>Appointment Summary</strong></h1>
					<p> Important details and requirements of this appointment. <br><br></p>
              		<div class="nav-container">
                		<div class="row row-centered">
                                    
                                     <%
                    result = statement.executeQuery(query);
                    
                    int RO;
                    String tName="", tDate="", tTime="", tRO="", tStatus="", tReason=null;
                    
                    result3 = statement3.executeQuery(query3);
                    while(result3.next())
                    {
                        tDate = result3.getString("app_date");
                        tTime = result3.getString("app_time");
                        tStatus = result3.getString("app_status");
                        tReason = result3.getString("reason");
                    }
                    
                    if (session.getAttribute("currUserOfficer")!=null)
                    {
                        RO = Integer.parseInt(String.valueOf(session.getAttribute("currUserOfficer")));
                        String query2 = "select * from user where user_no = " +RO;
                        result2 = statement2.executeQuery(query2);
                        
                        while(result2.next())
                            tRO=result2.getString("first_name") + " " + result2.getString("middle_initial") + " " + result2.getString("last_name");
                    }
                    
                    while (result.next())
                    {
                        tName = result.getString("name");
                    }
                    
                  %>
                                    
                  			<div class="view-nav col-sm-12">
                                            <h4 style="text-align:center"><strong> Appointment with <%=tRO%> </strong></h4>
                                            <p style="text-align:center" class="view-size">Date: <%=tDate%></p>
                                            <p style="text-align:center" class="view-size">Time: <%=tTime%></p>
                                            <p style="text-align:center" class="view-size">Status: <%=tStatus%></p>
                                            <br>
                                            
                                            <% if (tReason != null) {%>
                                            <h4 style="text-align:center"><strong> Reason of Appointment </strong></h4>
                                            <p style="text-align:center" class="view-size"><%=tReason%></p>
                                            <br>
                                            <% } %>
                                            
                                            <h4 style="text-align:left"><strong> <%=tName%> Requirements: </strong></h4>
                                                <% 
                                                    result1 = statement1.executeQuery(query1);
                                                    
                                                    while (result1.next()) {
                                                    %>
                                                   <p style="text-align:left" class="view-size"><%=result1.getString("name")%>
                                                     <%}
                                                     result1.first();
                                                     result1.previous(); %>
                                                     
                                            
                                            
    					</div>
  				</div>
                                       <form method="POST" action="PDFprint">  
                                           <%
                                               if (session.getAttribute("app_accepted").toString().equals("set")) {
                                               %>
                                       <input name="print" type="submit" class="btn btn-default" value="Print" style="float:right"/>
                                       <% } %>
                                       <input name="back" type="submit" class="btn btn-default" value="Back" style="float:right; margin-right:10px"/>
                                    </form>
                                       
                                        
               		 </div>  <!-- row closing tag -->

              		</div> <!-- nav-container closing tag   -->

           		 </div>   <!-- main div closing tag -->
          	</div>  <!-- row div closing tag -->
        </div>  <!-- container closing tag -->
        
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
    
    <%
      statement.close(); 
      result.close();
      statement1.close(); 
      result1.close();
      statement2.close(); 
      result2.close();
      statement3.close(); 
      result3.close();
      connection.close();
    %>
    
  </body>
</html>