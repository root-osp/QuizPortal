<%-- 
    Document   : displayq
    Created on : 25 Aug, 2015, 5:43:26 PM
    Author     : Dell
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <script type = "text/javascript" >
    history.pushState(null, null, 'question');
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, 'question');
    });
    
    var vis = (function(){
    var stateKey, eventKey, keys = {
        hidden: "visibilitychange",
        webkitHidden: "webkitvisibilitychange",
        mozHidden: "mozvisibilitychange",
        msHidden: "msvisibilitychange"
    };
    for (stateKey in keys) {
        if (stateKey in document) {
            eventKey = keys[stateKey];
            break;
        }
    }
    return function(c) {
        if (c) document.addEventListener(eventKey, c);
        return !document[stateKey];
    }
})();

    </script>
        <style>
            html,body
            {
                margin:0;padding:0;
            }
            #space
            {
                padding: 2%;
            }
        </style>
        <script>
            function over()
            {
                
                window.location="final.jsp";
            }
        </script>
        <link type="text/css" rel="stylesheet" href="clock_assets/flipclock.css" />
        <link type="text/css" rel="stylesheet" href="css/displayq.css" />
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
         <script src="jquery/jquery-1.12.0.min.js"></script>
         <script src="bootstrap/js/bootstrap.min.js"></script>
  <script src="js/displayq.js"></script>
   

    </head>
   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>JSP Page</title>

    

                    <%
                        String s = (String) session.getAttribute("login");
                        String s1 = (String) session.getAttribute("id");
                        int lim=(int)session.getAttribute("qlimit");
                        if (s == null || s.equals("")) {
                            RequestDispatcher rd = request.getRequestDispatcher("usloginerror.jsp");
                            rd.forward(request, response);
                        }
                        String n = (String) session.getAttribute("ques");
                        int k = Integer.parseInt(n);
                         int cg=(int)session.getAttribute("cur_group");
                        int ar[][] = (int[][]) session.getAttribute("data");
                        if (k - 1 >= ar[cg].length||k-1>=lim) {
                            RequestDispatcher rd = request.getRequestDispatcher("final.jsp");
                            rd.forward(request, response);
                        }
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/finalproj1", "root", "password");
                       Statement st = con.createStatement();
                        ResultSet rs1 = st.executeQuery("select id from finalproj1.group");
                        for(int i=0;i<=cg;i++)
                            rs1.next();
                         String sss=rs1.getString(1);
             
                        PreparedStatement pstm = (PreparedStatement) con.prepareStatement("Select * from "+sss+" where sno=?;");
                        pstm.setString(1, String.valueOf(ar[cg][k - 1]));
                        ResultSet rs = pstm.executeQuery();
                        boolean b = rs.next();
                        int use=Integer.parseInt(s1);
                        PreparedStatement tim = (PreparedStatement) con.prepareStatement("Select timestampdiff(second,now(),time) from student where er="+use+";");
                        ResultSet rst = tim.executeQuery();
                        rst.next();
                        long timer = Long.parseLong(rst.getString(1));
                        long timi=timer*1000;
                        int br[][] = (int[][]) session.getAttribute("sel");
                       %>
                       <script>setTimeout("over()",<%=timi%>);
                        vis(function(){
  if(!vis())window.location="final.jsp";
});   
                       </script>
                       <%
                        if(timer<=0)
                        {
                            %>
                            <script>//setTimeout('over()',timer*1000);
                             over();
                            </script>
                    <%
                       } 
                    %>
                 <body bgcolor="#ffffff">   
        <table style="height:100%;width:100%; position: absolute; top: 0; bottom: 0; left: 0; right: 0;">
            <tr>
                <td width="100%" height="15%" colspan="2" valign="top" >
                    <h1 align="center">JUET QUIZ PORTAL </h1>
                  <!--  <form action="final.jsp" align="right">
                        <input type="submit" value="Leave Test" >
                    </form>-->
                </td>
            </tr>
            <tr>

                <td width="75%" height="75%" valign="top" id="space">
                    
                    <form action='Question' method='post'>
                        <div class="container-fluid bg-info">
    <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <h3><span class="label label-warning" id="qid"><%=k%></span>&nbsp;&nbsp;<%=rs.getString(2).replace("<", "&lt;")%></h3>
        </div>
        <script>
          $(document).ready(
    $('form radio[name="opt"]').filter('[value=<%=br[cg][k-1]%>]').attr('checked', true););
    jQuery(function(){
   jQuery('form radio[name="opt"]'.filter('[value=<%=br[cg][k-1]%>]')').click();
});
                       </script>

          <div class="quiz" data-toggle="text_input">

           <label class="element-animation1 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="opt" <% if(br[cg][k-1]==3){ %>checked="checked"<%}%> value=3><%=rs.getString(3).replace("<", "&lt;")%></label>
           <label class="element-animation2 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="opt" <% if(br[cg][k-1]==4){ %>checked="checked"<%}%> value=4><%=rs.getString(4).replace("<", "&lt;")%></label>
           <label class="element-animation3 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="opt" <% if(br[cg][k-1]==5){ %>checked="checked"<%}%> value=5><%=rs.getString(5).replace("<", "&lt;")%></label>
           <label class="element-animation4 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="opt"  <% if(br[cg][k-1]==6){ %>checked="checked"<%}%>value=6><%=rs.getString(6).replace("<", "&lt;")%></label>
                </div>

</div>
</div>
</div>
</div>

                        <input type='hidden' name='ques' value='<%=k + 1%>'>
                        
                        <% if(k==lim)
                        {
                           
                        }else
{
%><button name="navig" class="btn btn-info" value="<%=k + 1%>" type="submit">Next Question</button>
<!--Next Question:<input type="submit" class="btn btn-info" name="navig" value="<%=k + 1%>" >--><%
}%>
<button name="navig" class="btn btn-primary" value="<%=0%>" type="submit">Change Group</button>
<!--Go to group page:<input type="submit" class="btn btn-info" name="navig" value="<%=0%>" >-->
                        
                        </td>
                        <td width="25%" height="75%" valign="top">
                            <div class="clock-builder-output"></div>
                            <script type="text/javascript" src="jquery/jquery-1.12.0.min.js"></script>
                            <script type="text/javascript" src="clock_assets/flipclock.js"></script>
                            <style text="text/css">body .flip-clock-wrapper ul li a div div.inn, body .flip-clock-small-wrapper ul li a div div.inn { color: #CCCCCC; background-color: #333333; } body .flip-clock-dot, body .flip-clock-small-wrapper .flip-clock-dot { background: #323434; } body .flip-clock-wrapper .flip-clock-meridium a, body .flip-clock-small-wrapper .flip-clock-meridium a { color: #323434; }</style>
                            <script type="text/javascript">
                                 $(function() {
                                    FlipClock.Lang.Custom = {days: 'Days', hours: 'Hours', minutes: 'Minutes', seconds: 'Seconds'};
                                    var opts = {
                                        clockFace: 'HourCounter',
                                        countdown: true,
                                        language: 'Custom'
                                    };
                                    opts.classes = {
                                        active: 'flip-clock-active',
                                        before: 'flip-clock-before',
                                        divider: 'flip-clock-divider',
                                        dot: 'flip-clock-dot',
                                        label: 'flip-clock-label',
                                        flip: 'flip',
                                        play: 'play',
                                        wrapper: 'flip-clock-small-wrapper'
                                    };
                                    var countdown = <%=timer%>;
                                    countdown = Math.max(1, countdown);
                                    $('.clock-builder-output').FlipClock(countdown, opts);
                                });
                            </script>
                            Unanswered:<br>
                            <% 
                                int x;
                                for (x = 1; x <= lim; x++) {
                                    if(br[cg][x-1]==0)
                                    {
                            %>
                         <!--   <input type="submit" name="navig" value="<%=x%>">-->
<button name="navig" class="btn btn-warning" value="<%=x%>" type="submit"><%=x%></button>

                            <%}
                                }%><br>Answered:<br>
                                <% 
                                for (x = 1; x <= lim; x++) {
                                    if(br[cg][x-1]!=0){
                            %>
                           <button name="navig" class="btn btn-success" value="<%=x%>" type="submit"><%=x%></button>

                            <%}
                                }%>
                    </form>
                </td>
            </tr>
        </table>      
    </body>
</html>
