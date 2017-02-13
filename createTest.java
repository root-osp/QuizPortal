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
public class createTest extends ActionSupport implements SessionAware{
    private String starttime,pass,endtime,dur,start,end,rad,qlimit,grad;
    SessionMap<String,String> sessionmap;
    public createTest() {
    }
    
    @Override
    public String execute() throws Exception {
        HttpServletRequest request=ServletActionContext.getRequest();
        HttpSession session=request.getSession();
        //session.setAttribute("usname",usid);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproj1","root","password");
        Statement st=con.createStatement();
         //int ti=Integer.parseInt(dur);
          //int sta=Integer.parseInt(start);
           //int en=Integer.parseInt(end);
       String s = (String) session.getAttribute("usname");
       
    st.executeUpdate("update finalproj1.faculty SET sho="+rad+", start="+start+",qlimit="+qlimit+",end="+end+",duration="+dur+",pass='"+pass+"' WHERE id='"+s+"' ");
    st.executeUpdate("truncate finalproj1.time");
    st.executeUpdate("truncate finalproj1.student");
    st.executeUpdate("truncate finalproj1.question_c1");
    st.executeUpdate("truncate finalproj1.group");
    st.executeUpdate("insert into finalproj1.time values('"+starttime+"','"+endtime+"')");
       
       if(Integer.parseInt(grad)==2){session.setAttribute("group",0); session.setAttribute("g_c",1);session.setAttribute("c_t","question_c1");
        return "success";}
       else{session.setAttribute("group",1);
           session.setAttribute("g_c",0);
        session.setAttribute("g_o",0);
           return "error";}
    }

    @Override
    public void setSession(Map<String, Object> map) {
        sessionmap=(SessionMap)map;
        sessionmap.put("login","true");
    }
    public String getStarttime() {
        return starttime;
    }

    
    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }
     public String getRad() {
        return rad;
    }

    
    public void setRad(String rad) {
        this.rad = rad;
    }
    public String getGrad() {
        return grad;
    }

    
    public void setGrad(String grad) {
        this.grad = grad;
    }
    
    public String getEndtime() {
        return endtime;
    }
    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }
    public String getQlimit() {
        return qlimit;
    }
    public void setQlimit(String qlimit) {
        this.qlimit = qlimit;
    }
    public String getdur() {
        return dur;
    }
    public void setDur(String dur) {
        this.dur = dur;
    }
    
    public String getPass() {
        return pass;
    }
    public void setPass(String pass) {
        this.pass = pass;
    }
    
     public String getStart() {
        return start;
    }
    public void setStart(String start) {
        this.start = start;
    }
    
     public String getEnd() {
        return end;
    }
    public void setEnd(String end) {
        this.end = end;
    }
   }
   
