

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Aakash
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
public class setTimer extends ActionSupport implements SessionAware{
    private String check;
    SessionMap<String,String> sessionmap;
    public setTimer() {
    }
    
    @Override
    public String execute() throws Exception {
        HttpServletRequest request=ServletActionContext.getRequest();
        HttpSession session=request.getSession();
        //session.setAttribute("usname",usid);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproj1","root","password");
        Statement st=con.createStatement();
        session.setAttribute("opt", check);
         //int ti=Integer.parseInt(dur);
          //int sta=Integer.parseInt(start);
           //int en=Integer.parseInt(end);
       String s = (String) session.getAttribute("usname");
       ResultSet start=st.executeQuery("select * from finalproj1.faculty");
       int tt=(int)session.getAttribute("dura");
       session.setAttribute("cur_group", 0);
    st.executeUpdate("insert into finalproj1.student values("+s+",0,DATE_ADD(now(), INTERVAL "+tt+" MINUTE)) ; ");
        return "success";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        sessionmap=(SessionMap)map;
        sessionmap.put("login","true");
    }
    public String getCheck() {
        return check;
    }

    /**
     * @param ques the ques to set
     */
    public void setCheck(String check) {
        this.check = check;
    }
}