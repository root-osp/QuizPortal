<%-- 
    Document   : usloginerror
    Created on : 19 Aug, 2015, 6:58:45 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Login</title>
        <script type = "text/javascript" >
    history.pushState(null, null, 'StudentLogin');
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, 'StudentLogin');
    });
    </script>
    </head>
    <body>
        <%
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.include(request, response);
        %>
        <h3>Invalid Credentials!</h3>
    </body>
</html>
