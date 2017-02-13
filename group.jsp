<%-- 
    Document   : group
    Created on : 2 May, 2016, 9:27:37 PM
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
        <title>Group Settings</title>
    </head>
    <body>
          <form class="form-horizontal" action="createGroup" method="post" >
<fieldset>

<!-- Form Name -->
<legend align="center">Group Add Option</legend>
       <!-- Multiple Radios for group -->
<div class="form-group">
  <label class="col-md-4 control-label" for="grad"></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="rad-0">
      <input type="radio" name="grad" id="rad-0" value="1" checked="checked">
      Add a compulsory group
    </label>
	</div>
  <div class="radio">
    <label for="rad-1">
      <input type="radio" name="grad" id="rad-1" value="2">
     Add an optional group
    </label>
	</div>
      <div class="radio">
    <label for="rad-2">
      <input type="radio" name="grad" id="rad-2" value="3">
      Finish
    </label>
	</div>
  </div>
</div>
       <!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="gname">If adding a group give a name</label>  
  <div class="col-md-4">
  <input id="gname" name="gname" type="text" placeholder="Computer" class="form-control input-md">
    
  </div>
</div>
       <!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="gp">Enter positive marks for each question</label>  
  <div class="col-md-4">
  <input id="gp" name="gp" type="text" placeholder="4" class="form-control input-md">
    
  </div>
</div>
       <!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="gn">Enter negative marks for each question</label>  
  <div class="col-md-4">
  <input id="gn" name="gn" type="text" placeholder="enter 1 for -1" class="form-control input-md">
    
  </div>
</div>
       <div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton">Submit and Continue for File Upload or Finish</label>
  <div class="col-md-4">
    <button id="singlebutton" type="submit" name="singlebutton" class="btn btn-success"><span class="glyphicon glyphicon-saved"> </span></button>
  </div>
</div>

</fieldset>
</form>
    </body>
</html>
