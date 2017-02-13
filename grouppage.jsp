<%-- 
    Document   : grouppage
    Created on : 5 May, 2016, 10:31:23 AM
    Author     : Aakash
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
         <script src="jquery/jquery-1.12.0.min.js"></script>
         <script src="bootstrap/js/bootstrap.min.js"></script>
        <title>View All Questions</title>
    </head>
    <body>
        <div style="text-align:center" ><h1><b>Select group</b></h1><br><br></div>
        <%
         Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproj1", "root", "password");
         Statement st = con.createStatement();
             ResultSet rs1 = st.executeQuery("select count(id) from finalproj1.group");
boolean status1 = rs1.next();
             int leng = Integer.parseInt(rs1.getString(1));
              int br[][] = (int[][]) session.getAttribute("sel");
              int i;
              int lim=(int)session.getAttribute("qlimit");
              ResultSet rs = st.executeQuery("select id,name from finalproj1.group");
             // ResultSet rs3 = st.executeQuery("select id from finalproj1.group");
              for(i=0;i<leng;i++)
              {
               rs.next();
               
               String naa=rs.getString(1);
               String na=rs.getString(2);
               String abc;
               String ch=(String)session.getAttribute("opt");
               if(ch==null)
                   ch="0";
                   
               if(naa.contains("_c")||ch.contains(Integer.toString(i))){
        %> 
        
        <form action='changeGroup' method='post'>
            <div style="text-align:center">
        <h2><B> Group name:<%=na%> </b></h2><br><br>
        
        <h5> Unanswered:</h5><br>
                            <% 
                                int x;
                                for (x = 1; x <= lim; x++) {
                                    if(br[i][x-1]==0)
                                    {
                                        abc=i+"> "+x;
                            %>
                         <!-- <input type="submit" name="navig" value="<%=abc%>">-->
<button name="navig" class="btn btn-warning" value="<%=abc%>" type="submit">Ques: <%=x%></button>

                            <%}
}%><h5><br>Answered:<br></h5>
                                <% 
                                for (x = 1; x <= lim; x++) {
                                    if(br[i][x-1]!=0){
                                        abc=i+"> "+x;
                            %>
                         <!--   <input type="submit" name="navig" value="<%=abc%>">-->
<button name="navig" class="btn btn-success" value="<%=abc%>" type="submit">Ques: <%=x%></button>

                            <%}}
                                }}%>
           
            <br><br>    <button name="navig" class="btn btn-danger" value="end" type="submit">Submit and Leave</button>
                         </div>       <!-- <input type="submit" name="navig" value="end quiz">-->
                    </form>
    </body>
</html>
