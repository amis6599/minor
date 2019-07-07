
package com.servlets;

import com.dao.DbUtilDAO;
import com.dto.StudentDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterStudentServlet extends HttpServlet {
    @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        StudentDTO SDto=new StudentDTO();
        SDto.setName(request.getParameter("name"));
        SDto.setUserId(request.getParameter("userid"));
        SDto.setPassword(request.getParameter("password"));
        SDto.setBranch(request.getParameter("branch"));
        SDto.setSem(request.getParameter("sem"));
        
        try{
           DbUtilDAO.getDbConnection();
           
        }
        catch(Exception e){
           
        }
        try{
            String Query="INSERT INTO student(USERID,NAME,BRANCH,SEM,PASSWORD) VALUES ( '"+SDto.getUserId()+"','"+SDto.getName()+"','"+SDto.getBranch()+"',"+SDto.getSem()+",'"+SDto.getPassword()+"');";
            DbUtilDAO.runDDLQuery(Query);
            
            out.println("<html><h1>successfully registered</h1><script>alert(\"Welcome   😃 \nYou are Succesfully registered\")</script>");
            out.println("<script>location.href=\"login.html\"</script></html>");
            
        }
        catch(SQLException se){
            
            out.println("<html><h1>successfully registered</h1><script>alert(\"sorry    😓 \nfailed to register\n user already exists\")</script>");
            out.println("<script>location.href=\"studentsignup.html\"</script></html>");
        }
    }

}
