
package com.servlets;

import com.dao.DbUtilDAO;
import com.dto.NoticeUploadDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;


public class NoticeUploadServlet extends HttpServlet {
    @Override
    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session =request.getSession(false);
        NoticeUploadDTO ndto=new NoticeUploadDTO();
        
       try{
           SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
          java.util.Date d0 =sdf.parse(request.getParameter("issuedate"));
          java.sql.Date issuedate =new java.sql.Date(d0.getTime());
        
          java.util.Date d1=sdf.parse(request.getParameter("returndate"));
          java.sql.Date  returndate=new java.sql.Date(d1.getTime());
          
            ndto.setBranch(request.getParameter("branch"));
            ndto.setSem(request.getParameter("sem"));
            ndto.setContent(request.getParameter("noticecontent"));
            ndto.setIssueDate(issuedate);
            ndto.setReturnDate(returndate);
            ndto.setTuserid((String)session.getAttribute("name"));

            DbUtilDAO.getDbConnection();
            String Query="INSERT INTO notice(TUSERID,BRANCH,SEM,NOTICE_CONTENT,ISSUEDATE,RETURNDATE) VALUES ('"+ndto.getTuserid()+"','"+ndto.getBranch()+"','"+ndto.getSem()+"','"+ndto.getContent()+"','"+ndto.getIssueDate()+"','"+ndto.getReturnDate()+"');";
            DbUtilDAO.runDDLQuery(Query);
            out.println("<html><h1>successfully uploaded</h1><script>alert(\"Notice uploaded Successfully   😃 \")</script>");
            out.println("<script>location.href=\"teacher.jsp\"</script></html>");
            
        }
        catch(Exception se){
            
            out.println("<html><h1>failed to upload notice</h1><script>alert(\"sorry    😓 failed to upload notice\")</script>");
            out.println("<script>location.href=\"noticeupload.html\"</script></html>");
        }
    
    }

}