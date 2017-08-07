
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
        String first="", last="", num="", mid="";
        
        if (session.getAttribute("client_firstname")!=null)
            first = String.valueOf(session.getAttribute("client_firstname"));
        
        if (session.getAttribute("client_lastname")!=null)
            last = String.valueOf(session.getAttribute("client_lastname"));
        
        if (session.getAttribute("client_middle")!=null)
            mid = String.valueOf(session.getAttribute("client_middle"));

        if (session.getAttribute("client_phone")!=null)
            num = String.valueOf(session.getAttribute("client_phone"));
        
        
          %>

  <div class="container">
    <div class="row row-centered">  <!-- center the block -->
      <div id="login" class="col-md-6 col-sm-8 col-centered" > 

        <img src="img/bir.png">
        <h1 class="e-title">e-ppointment</h1>
        <p class="text-center"><strong><i>Bureau Of Internal Revenue Online Appointment System.</i></strong><br>
        Registration Form Part 2</p>
      
          <form name="personalForm" role="form" method="POST" action="personal" onsubmit="return validatePersonalForm();">
            <div class="form-group">    <!-- user id form -->
              <label for="inputUserID">First Name</label>
              <input required value="<%=first%>" name="firstname" type="text" class="form-control" id="inputUserID" placeholder="First Name">
            </div>
            
            <div class="form-group">    <!-- user id form -->
              <label for="inputUserID">Middle Initial</label>
              <input required value="<%=mid%>" name="middle" type="text" class="form-control" id="inputUserID" placeholder="Middle Initial">
            </div>

            <div class="form-group">    <!-- user id form -->
              <label for="inputUserID">Last Name</label>
              <input required value="<%=last%>" name="lastname" type="text" class="form-control" id="inputUserID" placeholder="Last Name">
            </div>

            <div class="form-group">    <!-- password form -->
              <label for="inputPass">Phone Number</label>
              <input required value="<%=num%>" name="phone" type="text" pattern="^\d{11}" class="form-control" id="inputPass" placeholder="09XXXXXXXXX">
            </div>
              
              <%
                  String aDays="", aTime="";
                  
                  if (session.getAttribute("avail_days")!=null)
                      aDays = session.getAttribute("avail_days").toString();
                  
                  if (session.getAttribute("avail_time")!=null)
                      aTime = session.getAttribute("avail_time").toString();
                  
                  String mon="", tues="", wed="", thurs="", fri="";
                  String time1="", time2="", time3="", time4="", time5="", time6="", time7="", time8="";
                  
                  if (aDays.contains("Monday"))
                    mon="checked";
                  if (aDays.contains("Tuesday"))
                    tues="checked";
                  if (aDays.contains("Wednesday"))
                    wed="checked";
                  if (aDays.contains("Thursday"))
                    thurs="checked";
                  if (aDays.contains("Friday"))
                    fri="checked";
                  
                    if (aTime.contains("9"))
                    time1="checked";
                    if (aTime.contains("10"))
                    time2="checked";
                    if (aTime.contains("11"))
                    time3="checked";
                    if (aTime.contains("12"))
                    time4="checked";
                    if (aTime.contains("13"))
                    time5="checked";
                    if (aTime.contains("14"))
                    time6="checked";
                    if (aTime.contains("15"))
                    time7="checked";
                    if (aTime.contains("16"))
                    time8="checked";

                  %>

            <label> Day Availability </label>
            <div class="checkbox">
                <label for="checkbox-req">
                <input type="checkbox" name="dayCheck" value="Monday" <%=mon%> >
                Monday
                </label>
            </div>
            <div class="checkbox">
                <label for="checkbox-req">
                <input type="checkbox" name="dayCheck" value="Tuesday" <%=tues%> >
                Tuesday
                </label>
            </div>
             <div class="checkbox">
                <label for="checkbox-req">
                <input type="checkbox" name="dayCheck" value="Wednesday"<%=wed%> >
                Wednesday
                </label>
            </div>
             <div class="checkbox">
                <label for="checkbox-req">
                <input type="checkbox" name="dayCheck" value="Thursday" <%=thurs%> >
                Thursday
                </label>
            </div>
             <div class="checkbox">
                <label for="checkbox-req">
                <input type="checkbox" name="dayCheck" value="Friday" <%=fri%> >
                Friday
                </label>
            </div>

            <label> Time Availability </label>
            <div class="checkbox">
                <label for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="9:00" <%=time1%> >
                9:00
                </label>
            </div>
            <div class="checkbox">
                <label for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="10:00" <%=time2%> >
                10:00               
                </label>
            </div>
             <div class="checkbox">
                <label for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="11:00" <%=time3%> >
                11:00
                </label>
            </div>
             <div class="checkbox">
                <label for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="12:00" <%=time4%> >
                12:00
                </label>
            </div>
             <div class="checkbox">
                <label for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="13:00" <%=time5%> >
                13:00
                </label>
            </div>
            <div class="checkbox">
                <label for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="14:00" <%=time6%> >
                14:00
                </label>
            </div>
            <div class="checkbox">
                <label for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="15:00" <%=time7%> >
                15:00
                </label>
            </div>
             <div class="checkbox">
                <label for="checkbox-req">
                <input type="checkbox" name="timeCheck" value="16:00" <%=time8%>>
                16:00
                </label>
            </div>
                
            
            <!-- button for submission -->
            <input name="register" type="submit" value="Register" class="btn btn-default" style="float: right">
            <input name="back" type="submit" value="Back" class="btn btn-default" formnovalidate="formnovalidate">
             </form>
                    
                    <!--<form method="POST" action="personal" >
                        <input name="confirm" value="x" hidden="true"/>
                        
                    
                    </form>
        
        <!-- <button class="btn btn-default" type="submit">Submit</button> -->

         


      </div>
    </div>
  </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/moment.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/book.js"></script>
    
    <script>
          function confirmation(){
            return true;
          }
          </script>
    
    
    <script>
    function validatePersonalForm(){
                var flag = 0;
                var flag1 = 0;
                var pick = false;
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
                    pick = false;
                else
                    pick = true;
                
                if (pick == false)
                {
                    var x = confirm("Select at least one day and one time availability.");
                    return false;
                }
                
                return true;
            }
    </script>
    
  </body>
</html>