<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.DBConnectionFactory"%>
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
      
      <%
          session.setAttribute("book_date", null);
          session.setAttribute("book_time", null);
          
                DBConnectionFactory factory = DBConnectionFactory.getInstance();
                Connection connection = factory.getConnection();
                
                String ROName="";
                Statement stmt = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = null;
                int RO = Integer.parseInt(String.valueOf(session.getAttribute("currUserOfficer")));
                int user = Integer.parseInt(String.valueOf(session.getAttribute("currUserNum")));
                
                String query = "select * from user where user_no = " + RO;
                rs = stmt.executeQuery(query);
                
                while(rs.next())
                    ROName = rs.getString("first_name")+" "+rs.getString("middle_initial")+" "+rs.getString("last_name");
                
                Statement stmtPending = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                Statement stmtSet = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                Statement stmtCancel = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                
                Statement stmtPending1 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                Statement stmtSet1 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                Statement stmtCancel1 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                
                ResultSet rsPending = null;
                ResultSet rsSet = null;
                ResultSet rsCancel = null;
                
                String qPend = "select T.name, A.* from appointment A, transaction T where A.user_no = "+user+" and A.app_status = 'pending' and A.transaction_no = T.transaction_no order by app_date, app_time desc";
                String qSet = "select T.name, A.* from appointment A, transaction T where A.user_no = "+user+" and A.app_status = 'set' and A.transaction_no = T.transaction_no order by app_date, app_time desc";
                String qCancel = "select T.name, A.* from appointment A, transaction T where A.user_no = "+user+" and A.app_status = 'cancelled' and A.transaction_no = T.transaction_no order by app_date, app_time desc";

                ResultSet rsPending1 = null;
                ResultSet rsSet1 = null;
                ResultSet rsCancel1 = null;
                
                String qPend1 = "select T.name, A.* from appointment A, transaction T where A.user_set = "+user+" and A.app_status = 'pending' and A.transaction_no = T.transaction_no order by app_date, app_time desc";
                String qSet1 = "select T.name, A.* from appointment A, transaction T where A.user_set = "+user+" and A.app_status = 'set' and A.transaction_no = T.transaction_no order by app_date, app_time desc";
                String qCancel1 = "select T.name, A.* from appointment A, transaction T where A.user_set = "+user+" and A.app_status = 'cancelled' and A.transaction_no = T.transaction_no order by app_date, app_time desc";

          
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

          <h1><strong>Manage Appointments</strong></h1>
          <p class="lead"> View, set and cancel appointments made. <strong>Grey</strong> signifies <strong>pending</strong> appointments, <strong>green</strong> for <strong> set</strong> appointments and <strong>red</strong> for <strong>cancelled</strong> appointments.</p>


          <div class="bookings">
              
              <!-- pending appointments -->
              <%
              rsPending1 = stmtPending1.executeQuery(qPend1);
            %>

            <% while (rsPending1.next()) {%>
            <div class="booking col-xs-12 pend">
              <div class="details">
                  <strong><%=rsPending1.getString("T.name")%></strong><br><%=rsPending1.getString("A.app_date")%><br><%=rsPending1.getString("A.app_time")%>
                  <br><%=ROName%><br>
                  <% if (rsPending1.getString("A.reason")!=null) { %>
                  <br><%=rsPending1.getString("A.reason")%>
                  <% } %>
              </div>

              <div class="controls">
                <form action="clientManage" method="POST"/>
                <input name="app_no" value="<%=rsPending1.getInt("A.app_no")%>" hidden="true"/>
                <input name="app_status" value="<%=rsPending1.getString("A.app_status")%>" hidden="true"/>
                <input name="trans_no" value="<%=rsPending1.getInt("transaction_no")%>" hidden="true"/>
                <input name="view" type="submit" class="btn-info" value="View"/>
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
                  <strong><%=rsPending.getString("T.name")%></strong><br><%=rsPending.getString("A.app_date")%><br><%=rsPending.getString("A.app_time")%>
                  <br><%=ROName%><br>
                  <% if (rsPending.getString("A.reason")!=null) { %>
                  <br><%=rsPending.getString("A.reason")%>
                  <% } %>
              </div>

              <div class="controls">
                <form action="clientManage" method="POST"/>
                <input name="app_no" value="<%=rsPending.getInt("A.app_no")%>" hidden="true"/>
                <input name="app_status" value="<%=rsPending.getString("A.app_status")%>" hidden="true"/>
                <input name="trans_no" value="<%=rsPending.getInt("transaction_no")%>" hidden="true"/>
                <input name="view" type="submit" class="btn-info" value="View"/>
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
                  <strong><%=rsSet1.getString("T.name")%></strong><br><%=rsSet1.getString("A.app_date")%><br><%=rsSet1.getString("A.app_time")%>
                  <br><%=ROName%><br>
                  <% if (rsSet1.getString("A.reason")!=null) { %>
                  <br><%=rsSet1.getString("A.reason")%>
                  <% } %>
              </div>

              <div class="controls">
                <form action="clientManage" method="POST"/>
                <input name="app_no" value="<%=rsSet1.getInt("A.app_no")%>" hidden="true"/>
                <input name="app_status" value="<%=rsSet1.getString("A.app_status")%>" hidden="true"/>
                <input name="trans_no" value="<%=rsSet1.getInt("transaction_no")%>" hidden="true"/>
                <input name="view" type="submit" class="btn-info" value="View"/>
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
                  <strong><%=rsSet.getString("T.name")%></strong><br><%=rsSet.getString("A.app_date")%><br><%=rsSet.getString("A.app_time")%>
                  <br><%=ROName%><br>
                  <% if (rsSet.getString("A.reason")!=null) { %>
                  <br><%=rsSet.getString("A.reason")%>
                  <% } %>
              </div>

              <div class="controls">
                <form action="clientManage" method="POST"/>
                <input name="app_no" value="<%=rsSet.getInt("A.app_no")%>" hidden="true"/>
                <input name="app_status" value="<%=rsSet.getString("A.app_status")%>" hidden="true"/>
                <input name="trans_no" value="<%=rsSet.getInt("transaction_no")%>" hidden="true"/>
                <input name="view" type="submit" class="btn-info" value="View"/>
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
                  <strong><%=rsCancel1.getString("T.name")%></strong><br><%=rsCancel1.getString("A.app_date")%><br><%=rsCancel1.getString("A.app_time")%>
                  <br><%=ROName%><br>
                  <% if (rsCancel1.getString("A.reason")!=null) { %>
                  <br><%=rsCancel1.getString("A.reason")%>
                  <% } %>
              </div>

              <div class="controls">
                <form action="clientManage" method="POST"/>
                <input name="app_no" value="<%=rsCancel1.getInt("A.app_no")%>" hidden="true"/>
                <input name="app_status" value="<%=rsCancel1.getString("A.app_status")%>" hidden="true"/>
                <input name="trans_no" value="<%=rsCancel1.getInt("transaction_no")%>" hidden="true"/>
                <input name="view" type="submit" class="btn-info" value="View"/>
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
                  <strong><%=rsCancel.getString("T.name")%></strong><br><%=rsCancel.getString("A.app_date")%><br><%=rsCancel.getString("A.app_time")%>
                  <br><%=ROName%><br>
                  <% if (rsCancel.getString("A.reason")!=null) { %>
                  <br><%=rsCancel.getString("A.reason")%>
                  <% } %>
              </div>

              <div class="controls">
                <form action="clientManage" method="POST"/>
                <input name="app_no" value="<%=rsCancel.getInt("A.app_no")%>" hidden="true"/>
                <input name="app_status" value="<%=rsCancel.getString("A.app_status")%>" hidden="true"/>
                <input name="trans_no" value="<%=rsCancel.getInt("transaction_no")%>" hidden="true"/>
                <input name="view" type="submit" class="btn-info" value="View"/>
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