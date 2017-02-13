/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import java.sql.*;

/**
 *
 * @author Dell
 */
public class changeGroup extends ActionSupport {

    private String  navig;
    private String gr;

    public changeGroup() {
    }

    public String execute() throws Exception {
         HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        if(navig.charAt(0)=='e'){
            session.setAttribute("ques", "1000");
            return "error";}
        String g="",q="";
        int l;
        for( l=0;navig.charAt(l)!='>';l++)
            g+=navig.charAt(l);
        l+=2;
        for(;l<navig.length();l++)
            q+=navig.charAt(l);
            
        session.setAttribute("ques", q);
        session.setAttribute("cur_group",Integer.parseInt(g));
    return "success";

    }
     public String getGr() {
        return gr;
    }

    /**
     * @param opt the opt to set
     */
    public void setGr(String gr) {
        this.gr = gr;
    }

    /**
     * @return the navig
     */
    public String getNavig() {
        return navig;
    }

    /**
     * @param navig the navig to set
     */
    public void setNavig(String navig) {
        this.navig = navig;
    }

}