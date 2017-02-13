<%-- 
    Document   : newjspadminpanel
    Created on : 8 Feb, 2016, 10:49:01 PM
    Author     : Aakash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
         <script src="bootstrap/js/bootstrap.min.js"></script>
         <script src="jquery/jquery-1.12.0.min.js"></script>
         <script src="momentjs/moment-with-locales.js"></script>
<script src="momentjs/moment-timezone-with-data.js"></script>
        <title>Admin Panel</title>
        <script type = "text/javascript" >
    history.pushState(null, null, 'AdminPanel');
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, 'AdminPanel');
    });
    </script>
    </head>
    <body>
        
        
       <form class="form-horizontal" action="testcreate" method="post" >
<fieldset>

<!-- Form Name -->
<legend align="center">Admin Panel</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="startdate">Starting Date and Time</label>  
  <div class="col-md-4">
  <input id="starttime" name="starttime" type="text" placeholder="2016/02/09 12:00:00" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="endtime">Ending Date And Time</label>  
  <div class="col-md-4">
  <input id="endtime" name="endtime" type="text" placeholder="2016/02/11 17:00:00" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="dur">Time Duration For Test</label>  
  <div class="col-md-4">
  <input id="dur" name="dur" type="text" placeholder="60" class="form-control input-md">
  <span class="help-block">Enter Time in Minutes</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="pass">Quiz Password</label>  
  <div class="col-md-4">
  <input id="pass" name="pass" type="text" placeholder="password@1234" class="form-control input-md">
  <span class="help-block">Password is required by student to start the quiz</span>  
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="qlimit">Number Of Questions</label>  
  <div class="col-md-4">
  <input id="qlimit" name="qlimit" type="text" placeholder="15" class="form-control input-md">
  <span class="help-block">Password is required by student to start the quiz</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="start">Starting Enrollment</label>  
  <div class="col-md-4">
  <input id="start" name="start" type="text" placeholder="121201" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="end">Ending Enrollment</label>  
  <div class="col-md-4">
  <input id="end" name="end" type="text" placeholder="121300" class="form-control input-md">
    
  </div>
</div>
<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="rad"></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="rad-0">
      <input type="radio" name="rad" id="rad-0" value="1" checked="checked">
      Show Marks To Students
    </label>
	</div>
  <div class="radio">
    <label for="rad-1">
      <input type="radio" name="rad" id="rad-1" value="2">
      Don't Show Marks To Students
    </label>
	</div>
  </div>
</div>
<!-- Multiple Radios for group -->
<div class="form-group">
  <label class="col-md-4 control-label" for="grad"></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="rad-0">
      <input type="radio" name="grad" id="rad-0" value="1" checked="checked">
      Divide Test into Sections
    </label>
	</div>
  <div class="radio">
    <label for="rad-1">
      <input type="radio" name="grad" id="rad-1" value="2">
      Don't Divide Test into Sections
    </label>
	</div>
  </div>
</div>
<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton">Submit and Continue for File Upload</label>
  <div class="col-md-4">
    <button id="singlebutton" type="submit" name="singlebutton" class="btn btn-success"><span class="glyphicon glyphicon-saved"> </span></button>
  </div>
</div>

</fieldset>
</form>
     <form class="form-horizontal" action="download" method="post" >
            <!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton">Download Previous Test Result</label>
  <div class="col-md-4">
    <button id="singlebutton" type="submit" name="singlebutton" class="btn btn-info"><span class="glyphicon glyphicon-save">  </span></button>
  </div>
</div>
</form>  
         <form class="form-horizontal" action="loginr.jsp" method="post" >
            <!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton">Logout</label>
  <div class="col-md-4">
    <button id="singlebutton" type="submit" name="singlebutton" class="btn btn-danger"><span class="glyphicon glyphicon-remove">  </span></button>
  </div>
</div>
</form>  
      <!--  <%//int i=(int)session.getAttribute("dresponse");
        //if(i==1)
        //{
            %> <form method="get" action="web\other_data\result.xlsx">
<button type="submit">Download!</button>
</form><%
        //}
        %>
     -->
	
    </body>
</html>
