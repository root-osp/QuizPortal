/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com;
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
/**
 *
 * @author Dell
 */
public class upload extends ActionSupport implements SessionAware{
    private String usid,pass;
    private File file;
     private File myFile;
   private String myFileContentType;
   private String myFileFileName;
   private String destPath;
    SessionMap<String,String> sessionmap;
    public upload() {
    }
    
    @Override
    public String execute() throws Exception {
        HttpServletRequest request=ServletActionContext.getRequest();
        HttpSession session=request.getSession();
        String f_code= (String) session.getAttribute("code");
data.database db= new data.database();
String path="abcdefghij";
String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
Random rnd = new Random();

    for( int i = 0; i <10; i++ )
    {
        int a= rnd.nextInt(36);
        char req=AB.charAt(a);
        char rep=path.charAt(i);
        path=path.replace(rep, req);
   }       
    //path=path.concat(".xlsx");           
   File file = null ;
   int maxFileSize = 50000 * 1024;
   int maxMemSize = 50000 * 1024;
   
   String filePath="C:\\Users\\Aakash\\Documents\\NetBeansProjects\\Project_vm\\web\\other_data\\";
           
   String whole_path_name=filePath.concat(path);
  // String contentType = request.getContentType();
   try{
     	// System.out.println("Src File name: " + myFile);
     	 //System.out.println("Dst File name: " + myFileFileName);
     	    	 
     	 File destFile  = new File(whole_path_name, myFileFileName);
    	 FileUtils.copyFile(myFile, destFile);
  
      }catch(IOException e){
         e.printStackTrace();
         return ERROR;
      }
   //if ((contentType.indexOf("multipart/form-data") >= 0)) 
   //{

    //  DiskFileItemFactory factory = new DiskFileItemFactory();
    //  factory.setSizeThreshold(maxMemSize);
     // ServletFileUpload upload = new ServletFileUpload(factory);
     // upload.setSizeMax( maxFileSize );
     // try{
       //   List fileItems = upload.parseRequest(request);
        //  Iterator i = fileItems.iterator();
 //while ( i.hasNext () ) 
         //{
           // FileItem fi = (FileItem)i.next();
           // if ( !fi.isFormField () )	
            //{
            // String fileName = path;
          // if( fileName.lastIndexOf("\\") >= 0 )
          //  {
          // file = new File( filePath + fileName) ;
           // }
          //  else
           // {
           //  file = new File( filePath + fileName) ;
           // }
            
          //  fi.write( file ) ;
          //  }
        // }
        // }
    //  catch(Exception ex) {
      //   System.out.println(ex);
     // }
  // }
   Class.forName("com.mysql.jdbc.Driver");
              Connection   conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproj1","root","password");  
 try {
     int rc=0;
     int cc=0;
    FileInputStream file1 = new FileInputStream(new File(whole_path_name+"\\"+myFileFileName));
     
    XSSFWorkbook workbook = new XSSFWorkbook(file1);
 
     XSSFSheet sheet = workbook.getSheetAt(0);
     int sno=0;
     String ques="";
     String op1="";
     String op2="";
     String op3="";
     String op4="";
     String ans="";
    Iterator<Row> rowIterator = sheet.iterator();
    Row row;
    Statement stmt = conn.createStatement();
    //stmt.executeUpdate("insert into finalproj1.err values("+sheet.getLastRowNum()+")");
    
    for(int i=1; i<=sheet.getLastRowNum(); i++)
        //for(int i=1;i<=3;i++)
    { 
            row = (Row) sheet.getRow(i);

                 
                   //sno= Integer.parseInt(row.getCell(0).toString());
                   ques= row.getCell(1).toString();
                   op1= row.getCell(2).toString();
                   op2= row.getCell(3).toString();
                   op3= row.getCell(4).toString();
                   op4= row.getCell(5).toString();
                   ans= row.getCell(6).toString();

        //  Statement stmt = conn.createStatement();
          stmt.executeUpdate("insert into finalproj1."+session.getAttribute("c_t")+"(sno,ques,op1,op2,op3,op4,ans) values("+i+",'"+ques+"','"+op1+"','"+op2+"','"+op3+"','"+op4+"','"+ans+"')");
         //db.add_question(sno, ques, op1, op2, op3 ,op4 ,ans);
        }
    
    
        
    
    file1.close();
    FileOutputStream out1 = new FileOutputStream(new File(whole_path_name));
   workbook.write(out1);
    out1.close();
     
} catch (FileNotFoundException e) {
    e.printStackTrace();
} catch (IOException e) {
    e.printStackTrace();
} 
        return "success";
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

public File getMyFile() {
      return myFile;
   }
   public void setMyFile(File myFile) {
      this.myFile = myFile;
   }
   public String getMyFileContentType() {
      return myFileContentType;
   }
   public void setMyFileContentType(String myFileContentType) {
      this.myFileContentType = myFileContentType;
   }
   public String getMyFileFileName() {
      return myFileFileName;
   }
   public void setMyFileFileName(String myFileFileName) {
      this.myFileFileName = myFileFileName;
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
    public void setFile(File file)
    {
        this.file=file;
    }
    
}
