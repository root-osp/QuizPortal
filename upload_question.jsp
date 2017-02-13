<%-- 
    Document   : upload_marks
    Created on : Jul 15, 2015, 2:02:52 AM
    Author     : aayush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <script type = "text/javascript" >
    history.pushState(null, null, 'UploadFile');
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, 'UploadFile');
    });
    </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Questions</title>
    </head>
    <body style="padding: 5%; text-align: center; line-height: 120%; font-size: 120%;">
        

Welcome, here you can upload questions...<br>
You just need to choose the MS EXCEL file here...

 <form action="upload" method="post" enctype="multipart/form-data">
      <label for="myFile">Upload your file</label>
      <input type="file" name="myFile" />
      <input type="submit" value="Upload"/>
   </form>
    </body>
</html>
