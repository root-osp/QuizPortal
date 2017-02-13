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
public class Question extends ActionSupport {

    private String ques, navig;
    private int opt;

    public Question() {
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        int cg=(int)session.getAttribute("cur_group");
        int ar[][] = (int[][]) session.getAttribute("data");
        int br[][] = (int[][]) session.getAttribute("sel");
        boolean op[][] = (boolean[][]) session.getAttribute("option");
        int sno = Integer.parseInt(ques) - 1;
        if (opt == 3||opt == 4||opt == 5||opt == 6) {
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/finalproj1", "root", "password");
            Statement st = con.createStatement();
            ResultSet rs1 = st.executeQuery("select id from finalproj1.group");
            for(int i=0;i<=cg;i++)
                rs1.next();
                         String sss=rs1.getString(1);
            PreparedStatement pstm = (PreparedStatement) con.prepareStatement("Select * from "+sss+" where sno=?;");
            pstm.setString(1, String.valueOf(ar[cg][sno - 1]));
            ResultSet rs = pstm.executeQuery();
            br[cg][sno-1]=opt;
            if (rs.next() && rs.getString(7).equals(rs.getString(opt))) {
                op[cg][sno - 1] = true;
            } else {
                op[cg][sno - 1] = false;
            }
       }
        
        
        session.setAttribute("sel", br);
        session.setAttribute("option", op);
        if(Integer.parseInt(navig)==0)
        {
            session.setAttribute("ques", navig+1);
            return "error";
        }
        session.setAttribute("ques", navig);    
        return "success";
    }

    /**
     * @return the ques
     */
    public String getQues() {
        return ques;
    }

    /**
     * @param ques the ques to set
     */
    public void setQues(String ques) {
        this.ques = ques;
    }

    /**
     * @return the opt
     */
    public int getOpt() {
        return opt;
    }

    /**
     * @param opt the opt to set
     */
    public void setOpt(int opt) {
        this.opt = opt;
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
