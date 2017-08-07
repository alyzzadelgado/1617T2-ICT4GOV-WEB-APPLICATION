<%@page import="DAO.DBConnectionFactory"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
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
      
      <%
          session.setAttribute("book_date", null);
          session.setAttribute("book_time", null);
          

            DBConnectionFactory factory = DBConnectionFactory.getInstance();
                Connection connection = factory.getConnection();
                
                int user = Integer.parseInt(String.valueOf(session.getAttribute("currUserNum")));
                
                Statement stmtPending = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                Statement stmtSet = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                Statement stmtCancel = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                
                Statement stmtPending1 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                Statement stmtSet1 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                Statement stmtCancel1 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                
                ResultSet rsPending = null;
                ResultSet rsSet = null;
                ResultSet rsCancel = null;
                
                String qPend = "select U.middle_initial, U.first_name, U.last_name, T.name, A.app_no, A.app_date, A.app_time, A.reason from appointment A, transaction T, user U where A.user_no = "+user+" and A.app_status = 'pending' and A.transaction_no = T.transaction_no and A.user_set = U.user_no order by app_date, app_time desc";
                String qSet = "select U.middle_initial, U.first_name, U.last_name, T.name, A.app_no, A.app_date, A.app_time, A.reason from appointment A, transaction T, user U where A.user_no = "+user+" and A.app_status = 'set' and A.transaction_no = T.transaction_no and A.user_set = U.user_no order by app_date, app_time desc";
                String qCancel = "select U.middle_initial, U.first_name, U.last_name, T.name, A.app_no, A.app_date, A.app_time, A.reason from appointment A, transaction T, user U where A.user_no = "+user+" and A.app_status = 'cancelled' and A.transaction_no = T.transaction_no and A.user_set = U.user_no order by app_date, app_time desc";

                ResultSet rsPending1 = null;
                ResultSet rsSet1 = null;
                ResultSet rsCancel1 = null;
                
                String qPend1 = "select U.middle_initial, U.first_name, U.last_name, T.name, A.app_no, A.app_date, A.app_time, A.reason from appointment A, transaction T, user U where A.user_set = "+user+" and A.app_status = 'pending' and A.transaction_no = T.transaction_no and A.user_no = U.user_no order by app_date, app_time desc";
                String qSet1 = "select U.middle_initial, U.first_name, U.last_name, T.name, A.app_no, A.app_date, A.app_time, A.reason from appointment A, transaction T, user U where A.user_set = "+user+" and A.app_status = 'set' and A.transaction_no = T.transaction_no and A.user_no = U.user_no order by app_date, app_time desc";
                String qCancel1 = "select U.middle_initial, U.first_name, U.last_name, T.name, A.app_no, A.app_date, A.app_time, A.reason from appointment A, transaction T, user U where A.user_set = "+user+" and A.app_status = 'cancelled' and A.transaction_no = T.transaction_no and A.user_no = U.user_no order by app_date, app_time desc";

          
          %>


       <div class="container">
      <div class="row row-centered">
        <div class="main col-lg-8 col-centered">

          <h1><strong>Manage Appointments</strong></h1>
          <p class="lead"> Set, cancel and delete appointments made. <strong>Grey</strong> signifies <strong>pending</strong> appointments, <strong>green</strong> for <strong> set</strong> appointments and <strong>red</strong> for <strong>cancelled</strong> appointments.</p>


          <div class="bookings">

            <!-- pending appointments -->
              <%
              rsPending1 = stmtPending1.executeQuery(qPend1);
            %>

            <% while (rsPending1.next()) {%>
            <div class="booking col-xs-12 pend">
              <div class="details">
                  <strong><%=rsPending1.getString("U.first_name")%> <%=rsPending1.getString("U.middle_initial")%> <%=rsPending1.getString("U.last_name")%><br><%=rsPending1.getString("T.name")%></strong><br><%=rsPending1.getString("A.app_date")%>
                  <br><%=rsPending1.getString("A.app_time")%><br>
                  <% if (rsPending1.getString("A.reason")!=null) { %>
                  <br><%=rsPending1.getString("A.reason")%>
                  <% } %>
              </div>

              <div class="controls">
                <form action="ROManage" method="POST"/>
                <input name="app_no" value="<%=rsPending1.getInt("app_no")%>" hidden="true"/>
                <input name="set" type="submit" class="btn-success" value="Accept"/>
                <input name="cancel" type="submit" class="btn-danger" value="Cancel"/>
                </form>
              </div>
            </div>
            <%}
                 rsPending1.first();
                 rsPending1.previous(); %>  
              
              <%
              rsPending = stmtPending.executeQuery(qPend);
            %>

            <% while (rsPending.next()) {%>
            <div class="booking col-xs-12 pend">
              <div class="details">
                  <strong><%=rsPending.getString("U.first_name")%> <%=rsPending.getString("U.middle_initial")%> <%=rsPending.getString("U.last_name")%><br><%=rsPending.getString("T.name")%></strong><br><%=rsPending.getString("A.app_date")%>
                  <br><%=rsPending.getString("A.app_time")%><br>
                  <% if (rsPending.getString("A.reason")!=null) { %>
                  <br><%=rsPending.getString("A.reason")%>
                  <% } %>
              </div>

              <div class="controls">
                <form action="ROManage" method="POST"/>
                <input name="app_no" value="<%=rsPending.getInt("app_no")%>" hidden="true"/>
                <input name="delete" type="submit" class="btn-danger" value="Delete"/>
                </form>
              </div>
            </div>
            <%}
                 rsPending.first();
                 rsPending.previous(); %>  
                 
                 <!-- set appointments -->
                 
                 <%
              rsSet1 = stmtSet1.executeQuery(qSet1);
            %>

            <% while (rsSet1.next()) {%>
            <div class="booking col-xs-12 accept">
              <div class="details">
                  <strong><%=rsSet1.getString("U.first_name")%> <%=rsSet1.getString("U.middle_initial")%> <%=rsSet1.getString("U.last_name")%><br><%=rsSet1.getString("T.name")%></strong><br><%=rsSet1.getString("A.app_date")%>
                  <br><%=rsSet1.getString("A.app_time")%><br>
                  <% if (rsSet1.getString("A.reason")!=null) { %>
                  <br><%=rsSet1.getString("A.reason")%>
                  <% } %>
              </div>

              <div class="controls">
                <form action="ROManage" method="POST"/>
                <input name="app_no" value="<%=rsSet1.getInt("app_no")%>" hidden="true"/>
                <input name="cancel" type="submit" class="btn-danger" value="Cancel"/>
                </form>
              </div>
            </div>
            <%}
                 rsSet1.first();
                 rsSet1.previous(); %>  
                 
              
              <%
              rsSet = stmtSet.executeQuery(qSet);
            %>

            <% while (rsSet.next()) {%>
            <div class="booking col-xs-12 accept">
              <div class="details">
                  <strong><%=rsSet.getString("U.first_name")%> <%=rsSet.getString("U.middle_initial")%> <%=rsSet.getString("U.last_name")%><br><%=rsSet.getString("T.name")%></strong><br><%=rsSet.getString("A.app_date")%>
                  <br><%=rsSet.getString("A.app_time")%><br>
                  <% if (rsSet.getString("A.reason")!=null) { %>
                  <br><%=rsSet.getString("A.reason")%>
                  <% } %>
              </div>

              <div class="controls">
                <form action="ROManage" method="POST"/>
                <input name="app_no" value="<%=rsSet.getInt("app_no")%>" hidden="true"/>
                <input name="delete" type="submit" class="btn-danger" value="Delete"/>
                </form>
              </div>
            </div>
            <%}
                 rsSet.first();
                 rsSet.previous(); %>  
                 
                 <!-- cancel appointments -->
                 
                 <%
              rsCancel1 = stmtCancel1.executeQuery(qCancel1);
            %>

            <% while (rsCancel1.next()) {%>
            <div class="booking col-xs-12 decline">
              <div class="details">
                  <strong><%=rsCancel1.getString("U.first_name")%> <%=rsCancel1.getString("U.middle_initial")%> <%=rsCancel1.getString("U.last_name")%><br><%=rsCancel1.getString("T.name")%></strong><br><%=rsCancel1.getString("A.app_date")%>
                  <br><%=rsCancel1.getString("A.app_time")%><br>
                  <% if (rsCancel1.getString("A.reason")!=null) { %>
                  <br><%=rsCancel1.getString("A.reason")%>
                  <% } %>
              </div>

              <div class="controls">
                <form action="ROManage" method="POST"/>
                <input name="app_no" value="<%=rsCancel1.getInt("app_no")%>" hidden="true"/>
                <input name="set" type="submit" class="btn-success" value="Accept"/>
                </form>
              </div>
            </div>
            <%}
                 rsCancel1.first();
                 rsCancel1.previous(); %>  
              
              <%
              rsCancel = stmtCancel.executeQuery(qCancel);
            %>

            <% while (rsCancel.next()) {%>
            <div class="booking col-xs-12 decline">
              <div class="details">
                  <strong><%=rsCancel.getString("U.first_name")%> <%=rsCancel.getString("U.middle_initial")%> <%=rsCancel.getString("U.last_name")%><br><%=rsCancel.getString("T.name")%></strong><br><%=rsCancel.getString("A.app_date")%>
                  <br><%=rsCancel.getString("A.app_time")%><br>
                  <% if (rsCancel.getString("A.reason")!=null) { %>
                  <br><%=rsCancel.getString("A.reason")%>
                  <% } %>
              </div>

              <div class="controls">
                <form action="ROManage" method="POST"/>
                <input name="app_no" value="<%=rsCancel.getInt("app_no")%>" hidden="true"/>
                <input name="delete" type="submit" class="btn-danger" value="Delete"/>
                </form>
              </div>
            </div>
            <%}
                 rsCancel.first();
                 rsCancel.previous(); %> 


          </div> <!-- bookings div closing tag -->

        </div> <!-- main closing div -->
      </div> <!-- row closing div -->
    </div> <!-- container closing div -->


    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <%
        stmtPending.close();
        stmtSet.close();
        stmtCancel.close();
        
        rsPending.close();
        rsSet.close();
        rsCancel.close();
        
        rsPending1.close();
        rsSet1.close();
        rsCancel1.close();
        
        connection.close();
        
        %>
    
  </body>
</html>