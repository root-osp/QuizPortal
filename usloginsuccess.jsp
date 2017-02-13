<%-- 
    Document   : usloginsuccess
    Created on : 19 Aug, 2015, 6:58:17 PM
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
    history.pushState(null, null, 'StartQuiz');
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, 'StartQuiz');
    });
    </script>
        <script>
            function chk()
            {
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproj1", "root", "password");
                PreparedStatement tim = (PreparedStatement) con.prepareStatement("Select timestampdiff(second,start,now()) from time;");
                ResultSet rst = tim.executeQuery();
                rst.next();
                long timer = Long.parseLong(rst.getString(1));
            %>
                if (<%=timer%> <= 0)
                {
                    alert("quiz hasent started yet");
                    window.location = "usloginsuccess.jsp";
                }
                else
                {
                    window.location = "displayq.jsp";
                }
            }
        </script>
    </head>
    <body>
        <%
            String s = (String) session.getAttribute("login");
            String s1 = (String) session.getAttribute("id");
            if (s == null || s.equals("")) {
                RequestDispatcher rd = request.getRequestDispatcher("usloginerror.jsp");
                rd.forward(request, response);
            }
            int x, len, a, b, tmp;

            Statement st = con.createStatement();
             ResultSet rs1 = st.executeQuery("select count(id) from finalproj1.group");
              boolean status1 = rs1.next();
             int leng = Integer.parseInt(rs1.getString(1));
              int ar[][] = new int[leng][];
            int br[][] = new int[leng][];
            boolean opt[][] = new boolean[leng][];
            int i;
            
             %><div style="text-align:center">
        <h1 align="center">Welcome <%=s1%>!</h1>
        <form action='setTimer' class="form-horizontal" method="post">
            <fieldset>
                <div class="form-group">
                    <label class="col-md-4 control-label" for="checkboxes">Select optional subjects if available:</label><br>
  <div class="col-md-4">
        <%
            for(i=0;i<leng;i++){
                
           ResultSet rs = st.executeQuery("select id from finalproj1.group");
           for(int j=0;j<=i;j++)
               rs.next();
           String sss=rs.getString(1);
          ResultSet rs3 = st.executeQuery("select name from finalproj1.group");
           for(int j=0;j<=i;j++)
               rs3.next();
            String sss3=rs3.getString(1);
            if(sss.contains("_o")){
            %>
            <div class="checkbox">
    <label for="checkboxes-1">
      <input type="checkbox" name="check"  value="<%=i%>">
      <%=sss3%>
    </label>
	</div>
        
      <%}
             ResultSet rs2 = st.executeQuery("select count(sno) from "+sss+"");
             rs2.next();
            len = Integer.parseInt(rs2.getString(1));
             ar[i]= new int[len];
             br[i] = new int[len];
            opt[i] = new boolean[len];
            
            for (x = 1; x <= len; x++) {
                ar[i][x - 1] = x;
                br[i][x - 1]=0;
                opt[i][x - 1] = false;
            }
            for (x = 0; x < len; x++) {
                a = (int) (Math.random() * len);
                b = (int) (Math.random() * len);
                tmp = ar[i][a];
                ar[i][a] = ar[i][b];
                ar[i][b] = tmp;
            }}
            session.setAttribute("data", ar);
            session.setAttribute("sel",br);
            session.setAttribute("ques", "1");
            session.setAttribute("option", opt);
        %>
        </div>
</div>
            <input align="center" class="btn btn-success" type='submit' value='Start The Test'/>
            </fieldset>
        </form>
        <br>To exit anytime move to the last question and leave.
        <br>If you move back to a question the previous response is not changed until you tick another option.
        </div>
        </body>
</html>
