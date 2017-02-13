<%-- 
    Document   : adminloginerror
    Created on : 9 Feb, 2016, 10:25:24 AM
    Author     : Aakash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
    </head>
    <body>
        <%
            RequestDispatcher rd = request.getRequestDispatcher("loginr.jsp");
            rd.include(request, response);
        %>
        <h3>Invalid Credentials!</h3>
    </body>
</html>
