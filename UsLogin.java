/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Dell
 */
public class UsLogin extends ActionSupport implements SessionAware{
    private String usid,pass;
    SessionMap<String,String> sessionmap;
    public UsLogin() {
    }
    
    @Override
    public String execute() throws Exception {
        HttpServletRequest request=ServletActionContext.getRequest();
        HttpSession session=request.getSession();
        session.setAttribute("usname",usid);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproj1","root","password");
        Statement st=con.createStatement();
        boolean status=true;
        try { 
        Integer.parseInt(usid); 
    } catch(NumberFormatException e) { 
        status=false; 
    } catch(NullPointerException e) {
        status=false;
    }
    // only got here if we didn't return fals
    if(status==true){
       ResultSet rs=st.executeQuery("select * from student where er='"+usid+"'");
        status=rs.next();
        if(status==true)
            status=false;
        else status=true;}
       ResultSet start=st.executeQuery("select * from finalproj1.faculty");
       start.next();
        int r1=start.getInt("start");
        int r2=start.getInt("end");
        int tt=start.getInt("duration");
        int ql=start.getInt("qlimit");
        int show=start.getInt("sho");
        String pa=start.getString("pass");
       if( !pa.equals(pass)) {status=false;}
            //ResultSet end=st.executeQuery("select end from faculty ");
        //int r2=end.getInt("end");
        //end.next();
    if(status==true&&(Integer.parseInt(usid)<r1||Integer.parseInt(usid)>r2))
        status=false;
    if(status==true){
    PreparedStatement tim = (PreparedStatement) con.prepareStatement("Select timestampdiff(second,start,now()) from time;");
                ResultSet rst = tim.executeQuery();
                rst.next();
                long timer = Long.parseLong(rst.getString(1));
                if(timer>0) {
        } else {
                    status=false;
        }
                PreparedStatement timd = (PreparedStatement) con.prepareStatement("Select timestampdiff(second,end,now()) from time;");
                ResultSet rstd = timd.executeQuery();
                rstd.next();
                timer = Long.parseLong(rstd.getString(1));
                if(timer<0) {
        } else {
                    status=false;
        }
    }  if(status==true){
        session.setAttribute("id", usid);
      session.setAttribute("dura", tt);
      session.setAttribute("qlimit", ql);
      session.setAttribute("show", show);
        int use=Integer.parseInt(usid);
 
        //st.executeUpdate("insert into finalproj.student values("+usid+",0,DATE_ADD(now(), INTERVAL "+tt+" MINUTE)) ; ");
        }return status?"success":"error";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        sessionmap=(SessionMap)map;
        sessionmap.put("login","true");
    }
    public String logout()
    {
        sessionmap.invalidate();
        return "success";
    }


    /**
     * @return the usid
     */
    public String getUsid() {
        return usid;
    }

    /**
     * @param usid the usid to set
     */
    public void setUsid(String usid) {
        this.usid = usid;
    }

    /**
     * @return the pass
     */
    public String getPass() {
        return pass;
    }

    /**
     * @param pass the pass to set
     */
    public void setPass(String pass) {
        this.pass = pass;
    }
    
}
