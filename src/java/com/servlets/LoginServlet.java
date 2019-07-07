package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.*;
import com.dto.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        LoginDTO LDto=new LoginDTO();
        HttpSession session=request.getSession();
        ResultSet result;
 
        LDto.setUserName(request.getParameter("userid"));
        LDto.setPassword(request.getParameter("password"));
        LDto.setUserType(request.getParameter("usertype"));
        try{
           DbUtilDAO.getDbConnection();
        }
        catch(Exception e){
        }
        if(LDto.getUserType().equalsIgnoreCase("teacher"))
        {
          try{
             
             result= DbUtilDAO.runSelectQuery("SELECT * FROM TEACHER WHERE USERID='"+LDto.getUserName()+"'&& PASSWORD='"+LDto.getPassword()+"';");
              if(result.next())
             {
              session.setAttribute("name",LDto.getUserName());
              request.getRequestDispatcher("teacher.jsp").include(request, response);
              
             }
             else{
                  System.out.println("Mismatched Username or password");
                  out.println("<html><h1>failed to login</h1><script>alert(\"Login Failure 😓 Incorrect username or password\")</script>");
                  out.println("<script>location.href=\"login.html\"</script></html>");
             }
              
          } catch(SQLException se) {
           }
        }
        else if(LDto.getUserType().equalsIgnoreCase("student")){
            try{
             
             result=DbUtilDAO.runSelectQuery("SELECT * FROM STUDENT WHERE USERID='"+LDto.getUserName()+"'&& PASSWORD='"+LDto.getPassword()+"';");
             if(result.next())
             {
                session.setAttribute("name",LDto.getUserName());
                 request.getRequestDispatcher("student.jsp").include(request, response);
             }
             else{
                  out.println("<html><h1>failed to Login</h1><script>alert(\"Login Failure    😓 Incorrect username or password\")</script>");
                  out.println("<script>location.href=\"login.html\"</script></html>");
             }
            
          } catch(SQLException se) {
   
          } 
        }
       
    }
}
