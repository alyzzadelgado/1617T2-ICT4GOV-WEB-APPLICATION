<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
      
      int user = Integer.parseInt(String.valueOf(session.getAttribute("currUserNum")));
      
        String userMid="", userTin="", userFirst="", userLast="", userName="", userPass="", userPhone="", userDay="", userTime="", type1="", type2="";
      
        String query = "select * from user where user_no = " + user;
        
        PreparedStatement pstmt = connection.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery(query);
                    
                    while(rs.next())
                    {
                        userTin = rs.getString("tin_no");
                        userFirst = rs.getString("first_name");
                        userLast = rs.getString("last_name");
                        userMid = rs.getString("middle_initial");
                        userName = rs.getString("username");
                        userPass = rs.getString("password");
                        userPhone = rs.getString("phone_no");
                        userDay = rs.getString("avail_days");
                        userTime = rs.getString("avail_time");
                        
                    }
                    
                    if (userTin.equals(""))
                    {
                        type1 = "hidden";
                        type2 = "";
                    }
                    else
                    {
                        type1 = "";
                        type2 = "hidden";
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
          <b><a class="navbar-brand" href="client_homepage.jsp">e-ppointment</a></b>
        </div> <!-- navbar-header closing tag -->
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-left">
            <li><a href="edit_account.jsp">View Account</a></li>
            <li><a href="client_appointment.jsp">Set Appointment</a></li>
            <li><a href="#">Manage Appointments</a></li>
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
              		<h1><strong>View Account</strong></h1>
                        <p> View and edit your contact information and availability. <br><br></p>
              		<div class="nav-container">
                		<div class="row row-centered">
                  			<div class="view-nav col-lg-12">
                                            <h4><strong>TIN</strong></h4>
                                            <p class="view-size"> <%=userTin%> </p>
                                            <h4><strong>First Name</strong></h4>
                                            <p class="view-size"> <%=userFirst%> </p>
                                            <h4><strong>Middle Initial</strong></h4>
                                            <p class="view-size"> <%=userMid%> </p>
                                            <h4><strong>Last Name</strong></h4>
                                            <p class="view-size"> <%=userLast%> </p>
                                        </div>
  				</div>

                     <br>
          <form onsubmit="return validateEditForm();" method="POST" action="clientEdit">
              
              <div class="form-group">    <!-- user id form -->
              <label class="view-edit" for="inputUserID">Username</label>
              <input required name="username" type="text" class="form-control" id="inputUserID" value="<%=userName%>">
            </div>

            <div class="form-group">    <!-- password form -->
              <label class="view-edit" for="inputPass">Password</label>
              <input required name="password" type="password" class="form-control" id="inputPass" value="<%=userPass%>">
            </div>

            <div class="form-group">    <!-- password form -->
              <label class="view-edit" for="password">Phone</label>
              <input required name="phone" type="text" class="form-control" id="inputUserID" value="<%=userPhone%>">
            </div>

            <%
                String aDays="", aTime="";
                  
                  String mon="", tues="", wed="", thurs="", fri="";
                  String time1="", time2="", time3="", time4="", time5="", time6="", time7="", time8="";
                  
                  if (userDay.contains("Monday"))
                    mon="checked";
                  if (userDay.contains("Tuesday"))
                    tues="checked";
                  if (userDay.contains("Wednesday"))
                    wed="checked";
                  if (userDay.contains("Thursday"))
                    thurs="checked";
                  if (userDay.contains("Friday"))
                    fri="checked";
                  
                    if (userTime.contains("9"))
                        time1="checked";
                    if (userTime.contains("10"))
                        time2="checked";
                    if (userTime.contains("11"))
                        time3="checked";
                    if (userTime.contains("12"))
                        time4="checked";
                    if (userTime.contains("13"))
                        time5="checked";
                    if (userTime.contains("14"))
                        time6="checked";
                    if (userTime.contains("15"))
                        time7="checked";
                    if (userTime.contains("16"))
                        time8="checked";

                
                %>
            
            <label class="view-edit"> Day Availability </label>
            <div class="checkbox">
                <label class="view-edit" for="checkbox-req">
                <input type="checkbox" name="dayCheck" value="Monday" <%=mon%> >
                Monday
                </label>
            </div>
            <div class="checkbox">
                <label class="view-edit" for="checkbox-req">
                <input type="checkbox" name="dayCheck" value="Tuesday" <%=tues%> >
                Tuesday
                </label>
            </div>
             <div class="checkbox">
                <label class="view-edit" for="checkbox-req">
                <input type="checkbox" name="dayCheck" value="Wednesday"<%=wed%> >
                Wednesday
                </label>
            </div>
             <div class="checkbox">
                <label class="view-edit" for="checkbox-req">
                <input type="checkbox" name="dayCheck" value="Thursday" <%=thurs%> >
                Thursday
                </label>
            </div>
             <div class="checkbox">
                <label class="view-edit" for="checkbox-req">
                <input type="checkbox" name="dayCheck" value="Friday" <%=fri%> >
                Friday
                </label>
            </div>

            <label class="view-edit"> Time Availability </label>
            <div class="checkbox">
                <label class="view-edit" for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="9:00" <%=time1%> >
                9:00
                </label>
            </div>
            <div class="checkbox">
                <label class="view-edit" for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="10:00" <%=time2%> >
                10:00          
                </label>
            </div>
             <div class="checkbox">
                <label class="view-edit" for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="11:00" <%=time3%> >
                11:00
                </label>
            </div>
             <div class="checkbox">
                <label class="view-edit" for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="12:00" <%=time4%> >
                12:00
                </label>
            </div>
             <div class="checkbox">
                <label class="view-edit" for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="13:00" <%=time5%> >
                13:00
                </label>
            </div>
            <div class="checkbox">
                <label class="view-edit" for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="14:00" <%=time6%> >
                14:00
                </label>
            </div>
            <div class="checkbox">
                <label class="view-edit" for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="15:00" <%=time7%> >
                15:00
                </label>
            </div>
             <div class="checkbox">
                <label class="view-edit" for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="16:00" <%=time8%>>
                16:00
                </label>
            </div>

            <input style="float:right" name="save" type="submit" value="Save" class="btn btn-default">

          </form>

               		 </div>  <!-- row closing tag -->

              		</div> <!-- nav-container closing tag   -->

           		 </div>   <!-- main div closing tag -->
          	</div>  <!-- row div closing tag -->
        </div>  <!-- container closing tag -->

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <script>
    function validateEditForm(){
                var flag = 0;
                var flag1 = 0;
                for (var i = 0; i < 5; i++) {
                    if(document.personalForm["dayCheck"][i].checked){
                        flag ++;
                    }
                }
                
                for(var j = 0; j < 8; j++) {
                    if(document.personalForm["timeCheck"][j].checked){
                        flag1 ++;
                    }
                }
                
                if (flag == 0 || flag1 == 0)
                    return false;
                
                return true;
            }
    </script>
    
    <%
      pstmt.close();
      rs.close();
      statement.close();
      connection.close();
    %>

  </body>
</html>