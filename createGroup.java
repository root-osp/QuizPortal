/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

/**
 *
 * @author Aakash
 */
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
public class createGroup extends ActionSupport implements SessionAware{
    private String gname,grad,gp,gn;
    SessionMap<String,String> sessionmap;
    public createGroup() {
    }
    
    @Override
    public String execute() throws Exception {
        HttpServletRequest request=ServletActionContext.getRequest();
        HttpSession session=request.getSession();
        //session.setAttribute("usname",usid);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproj1","root","password");
        Statement st=con.createStatement();
        if(Integer.parseInt(grad)==1){
            session.setAttribute("g_c",(int)session.getAttribute("g_c")+1);
            String sss="question_c"+session.getAttribute("g_c");
            st.executeUpdate("insert into finalproj1.group values('"+sss+"','"+gname+"','"+gp+"','"+gn+"')");
           st.executeUpdate(" DROP TABLE IF EXISTS "+sss+"");
          st.executeUpdate(" CREATE TABLE "+sss+" ( sno int(10) unsigned NOT NULL AUTO_INCREMENT, ques varchar(2000) NOT NULL,op1 varchar(2000) NOT NULL,  op2 varchar(2000)NOT NULL,  op3 varchar(2000) NOT NULL,  op4 varchar(2000)NOT NULL,  ans varchar(2000) NOT NULL,  PRIMARY KEY (`sno`)) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;");
            session.setAttribute("c_t",sss);return "success";
        }
        else if(Integer.parseInt(grad)==2){
            
            session.setAttribute("g_o",(int)session.getAttribute("g_o")+1);
             String sss="question_o"+session.getAttribute("g_o");
              st.executeUpdate("insert into finalproj1.group values('"+sss+"','"+gname+"','"+gp+"','"+gn+"')");
              st.executeUpdate(" DROP TABLE IF EXISTS "+sss+"");
              st.executeUpdate(" CREATE TABLE "+sss+" ( sno int(10) unsigned NOT NULL AUTO_INCREMENT, ques varchar(2000) NOT NULL,op1 varchar(2000) NOT NULL,  op2 varchar(2000)NOT NULL,  op3 varchar(2000) NOT NULL,  op4 varchar(2000)NOT NULL,  ans varchar(2000) NOT NULL,  PRIMARY KEY (`sno`)) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;");
           
            session.setAttribute("c_t",sss);return "success";
        }
        return "error";
         }

    @Override
    public void setSession(Map<String, Object> map) {
        sessionmap=(SessionMap)map;
        sessionmap.put("login","true");
    }
     public String getGrad() {
        return grad;
    }

    
    public void setGrad(String grad) {
        this.grad = grad;
    }
    
     public String getGname() {
        return gname;
    }
    public void setGname(String gname) {
        this.gname = gname;
    }
     public String getGp() {
        return gp;
    }
    public void setGp(String gp) {
        this.gp = gp;
    }
     public String getGn() {
        return gn;
    }
    public void setGn(String gn) {
        this.gn = gn;
    }
}