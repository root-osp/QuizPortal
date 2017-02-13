/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
 import com.sun.org.apache.xpath.internal.axes.SubContextList;
 import data.database;
 import org.apache.poi.xssf.usermodel.XSSFSheet;
 import org.apache.poi.xssf.usermodel.XSSFWorkbook;
 import java.io.FileInputStream;
 import java.io.IOException;
import java.io.FileNotFoundException;
 import java.io.FileOutputStream;
 import org.apache.poi.ss.usermodel.Cell;
 import org.apache.poi.ss.usermodel.Row;
 import java.util.Iterator;
 import org.apache.poi.hssf.usermodel.HSSFSheet;
 import org.apache.poi.hssf.usermodel.HSSFWorkbook;
 import java.io.File;
import java.io.*;
import java.util.*;
import javax.servlet.*;
 import javax.servlet.http.*;
 import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
 import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.output.*;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import java.io.File;
import org.apache.commons.io.FileUtils;
import java.io.IOException; 
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import com.opensymphony.xwork2.ActionSupport;
/**
 *
 * @author Dell
 */
public class download extends ActionSupport implements SessionAware{
    SessionMap<String,String> sessionmap;
    private InputStream fileInputStream;
    public download() {
    }
    
    @Override
    public String execute() throws Exception {
        HttpServletRequest request=ServletActionContext.getRequest();
        HttpSession session=request.getSession();
         Class.forName("com.mysql.jdbc.Driver");
      Connection connect = (Connection)DriverManager.getConnection( "jdbc:mysql://localhost:3306/finalproj1" , "root" , "password");
      Statement statement = connect.createStatement();
      ResultSet resultSet = statement.executeQuery("select * from finalproj1.student");
       session.setAttribute("dresponse",1);
      XSSFWorkbook workbook = new XSSFWorkbook(); 
      XSSFSheet spreadsheet = workbook.createSheet("employe db");
      XSSFRow row=spreadsheet.createRow(1);
      XSSFCell cell;
      cell=row.createCell(1);
      cell.setCellValue("Enrollment Number");
      cell=row.createCell(2);
      cell.setCellValue("Marks Obtained");
      int i=2;
      while(resultSet.next())
      {
         row=spreadsheet.createRow(i);
         cell=row.createCell(1);
         cell.setCellValue(resultSet.getInt("er"));
         cell=row.createCell(2);
         cell.setCellValue(resultSet.getInt("marks"));
         i++;
      }
      FileOutputStream out = new FileOutputStream(
      new File("C:\\Users\\Aakash\\Documents\\NetBeansProjects\\Project_vm\\web\\other_data\\result.xlsx"));
      workbook.write(out);
      out.close();
     

      fileInputStream = new FileInputStream(new File("C:\\Users\\Aakash\\Documents\\NetBeansProjects\\Project_vm\\web\\other_data\\result.xlsx"));
        return "success";
    }
    public InputStream getFileInputStream() {
		return fileInputStream;
	}


    @Override
    public void setSession(Map<String, Object> map) {
        sessionmap=(SessionMap)map;
        sessionmap.put("login","true");
    }
    
    
}
