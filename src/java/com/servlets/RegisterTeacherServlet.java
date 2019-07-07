/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dao.DbUtilDAO;
import com.dto.TeacherDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterTeacherServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          response.setContentType("text/html;charset=UTF-8");
          PrintWriter out = response.getWriter();
          TeacherDTO TDto=new TeacherDTO();
          TDto.setName(request.getParameter("name"));
          TDto.setUserId(request.getParameter("userid"));
          TDto.setPassword(request.getParameter("password"));
          TDto.setBranch(request.getParameter("branch"));
          TDto.setDesignation(request.getParameter("designation"));
        try {
            DbUtilDAO.getDbConnection();

        } catch (Exception ex) {

        }
            
        try{
            String Query="INSERT INTO TEACHER(USERID,NAME,PASSWORD,BRANCH,DESIGNATION) VALUES('"+TDto.getUserId()+"','"+TDto.getName()+"','"+TDto.getPassword()+"','"+TDto.getBranch()+"','"+TDto.getDesignation()+"');";
                DbUtilDAO.runDDLQuery(Query);
     
            out.println("<html><h1>successfully registered</h1><script>alert(\"Welcome   😃 \nYou are Succesfully registered\")</script>");
            out.println("<script>location.href=\"login.html\"</script></html>");
        
          }
        
        catch(SQLException se){
            out.println("<html><h1>failed to registered</h1><script>alert(\"sorry    😓 \nfailed to register\nuser already exists\")</script>");
            out.println("<script>location.href=\"teachersignup.html\"</script></html>");
        }
    }
}
