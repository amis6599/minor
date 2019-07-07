package com.servlets;
import com.dao.DbUtilDAO;
import com.dto.AssignmentDTO;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AssignmentUploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            String Query;
            ResultSet rs;
            HttpSession session=request.getSession(false);
            AssignmentDTO AssDto=new AssignmentDTO();
            String FileName;
            String FilePath;
            //file upload
            MultipartRequest m=new MultipartRequest(request,"d:\\sources",15*1024*1024);
            //date
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date d0 =sdf.parse(m.getParameter("issuedate"));
            java.sql.Date issuedate =new java.sql.Date(d0.getTime());
            java.util.Date d1=sdf.parse(m.getParameter("returndate"));
            java.sql.Date  returndate=new java.sql.Date(d1.getTime());

            //fetching request parameter
            AssDto.setBranch(m.getParameter("branch"));
            AssDto.setSem(m.getParameter("sem"));
            AssDto.setSubjectCode(m.getParameter("subject"));
            AssDto.setAssignmentNo((Integer.parseInt(m.getParameter("assignmentno"))));
            AssDto.setIssueDate(issuedate);
            AssDto.setReturnDate(returndate);
            AssDto.setTuserid((String)session.getAttribute("name"));

            //file 
            String oldFile= m.getFilesystemName("file");
            StringTokenizer st=new StringTokenizer(oldFile,".");
            st.nextToken();
            String str =st.nextToken();
            FileName=AssDto.getBranch()+"-"+AssDto.getSubjectCode()+"-Ass-"+AssDto.getAssignmentNo()+"."+str;

            FilePath="d:\\sources\\"+AssDto.getBranch()+"-"+AssDto.getSubjectCode()+"-Ass-"+AssDto.getAssignmentNo()+"."+str;   
            m.getFile("file").renameTo(new File(FilePath)) ;
            FilePath="d:\\\\\\r\\\\sources\\\\\\\\"+AssDto.getBranch()+"-"+AssDto.getSubjectCode()+"-Ass-"+AssDto.getAssignmentNo()+"."+str;
            AssDto.setSubjectCode(m.getParameter("branch")+""+m.getParameter("subject"));
            AssDto.setPath(FilePath);
          
            Query="INSERT INTO assignment(SUBCODE,FILEPATH,TUSERID,ISSUEDATE,RETURNDATE,ASSIGNMENTNO) VALUES ";
            Query=Query+"('"+AssDto.getSubjectCode()+"','"+AssDto.getPath()+"','"+AssDto.getTuserid()+"','"+AssDto.getIssueDate()+"','"+AssDto.getReturnDate()+"','"+AssDto.getAssignmentNo()+"');"; 
            
            DbUtilDAO.getDbConnection();
            DbUtilDAO.runDDLQuery(Query);
            out.println("<html><h1>successfully uploaded</h1><script>alert(\"Asssignment uploaded Successfully   😃 \")</script>");
            out.println("<script>location.href=\"teacher.jsp\"</script></html>");
        } 
        catch(Exception e) 
        {
            out.println("<html><h1>failed to upload notice</h1><script>alert(\"sorry    😓 failed to upload assignment\")</script>");
            out.println("<script>location.href=\"asssignmentupload.html\"</script></html>");
        }
    }

  
}
