<%-- 
    Document   : final
    Created on : 2 Oct, 2015, 10:16:03 AM
    Author     : Dell
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
        <script type = "text/javascript" >
    history.pushState(null, null, 'final');
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, 'final');
    });
    </script>
    </head>
    <body>
        <%
             Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproj1","root","password");
        Statement st=con.createStatement();
            ResultSet rs1 = st.executeQuery("select count(id) from finalproj1.group");
              boolean status1 = rs1.next();
             int leng = Integer.parseInt(rs1.getString(1));
             ResultSet rs2 = st.executeQuery("select gp,gn from finalproj1.group");
            int c = 0, x;
            boolean ar[][] = (boolean[][]) session.getAttribute("option");
            int br[][] = (int[][]) session.getAttribute("sel");
            for(int i=0;i<leng;i++)
            {
            int cg=i;
            rs2.next();
            int p=Integer.parseInt(rs2.getString(1));
              int n=Integer.parseInt(rs2.getString(2));
            for (x = 0; x < ar[cg].length; x++) {
                if (ar[cg][x]) {
                    c+=p;
                }
                else if(br[cg][x]>2){
                    c-=n;
                }    
            }}
           
        String s = (String) session.getAttribute("usname");
        int show = (int) session.getAttribute("show");
        int use=Integer.parseInt(s);
        String sm=Integer.toString(c);
        st.executeUpdate("update finalproj1.student SET marks='"+sm+"' where er="+use+" ");
        %>
        <br/>
        <% if(show==1) {
            %>
       <div style="text-align:center">
        <h3>Your final score is</h3>
        <h1><%=c%></h1>
        <% }
else {%>
        
<h3 >Result Will be Out Soon</h3><br>
        <% }%>
        <form action="logout">
            <input class="btn btn-warning" align="center" type="submit">
        </form>
       </div>
    </body>
</html>
