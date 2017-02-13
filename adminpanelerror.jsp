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
        <title>Admin Panel</title>
        <script type = "text/javascript" >
    history.pushState(null, null, 'AdminPanel');
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, 'AdminPanel');
    });
    </script>
    </head>
    <body>
        <%
            RequestDispatcher rd = request.getRequestDispatcher("adminpanel.jsp");
            rd.include(request, response);
        %>
        <h3>One of the response was wrong</h3>
    </body>
</html>
