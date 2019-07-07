/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dao.DbUtilDAO;
import com.dto.AssignmentDTO;
import com.dto.StudentDTO;
import com.sun.xml.internal.txw2.output.ResultFactory;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AssignmentDownloadServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ResultSet rs;
        int Assignmentno[]=new int[10];
        String filetoken[]=new String[10];
        int i=1;
        try {
            
            HttpSession session=request.getSession(false);
            AssignmentDTO Assdto=new AssignmentDTO();
            StudentDTO Sdto=new StudentDTO();
            Sdto.setUserId((String)session.getAttribute("name"));
            
            String Query="select * from student where userid='"+Sdto.getUserId()+"'";
            DbUtilDAO.getDbConnection();
            rs=DbUtilDAO.runSelectQuery(Query);
            while(rs.next())
            {
                Sdto.setBranch(rs.getString(3));
                Sdto.setSem(rs.getString(4));
            }
            Query="SELECT ASSIGNMENTNO ,FILEPATH,SUBJECTCODE FROM assignment , SUBJECT WHERE ";
            Query=Query+"assignment.SUBCODE=subject.SUBJECTCODE AND SUBJECT.BRANCH='"+Sdto.getBranch()+"' AND SUBJECT.SEM='"+Sdto.getSem()+"' ORDER BY SUBCODE";
            rs=DbUtilDAO.runSelectQuery(Query);
            while(rs.next())
            {
                Assignmentno[i]=rs.getInt(1);
                filetoken[i]=rs.getString(2);
                i++;
            }
            StringTokenizer st=new StringTokenizer(filetoken[Integer.parseInt(request.getParameter("Assno"))],".");
            st.nextToken();
            String filename = Sdto.getBranch()+"-"+Sdto.getSem()+"0"+request.getParameter("Assno")+"-Ass-"+Assignmentno[Integer.parseInt((request.getParameter("Assno")))]+"."+st.nextToken();  
            String filepath = "d:\\sources\\";   
            response.setContentType("APPLICATION/OCTET-STREAM");   
            response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   

            FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);  
            
         
            while ((i=fileInputStream.read()) != -1) {  
              out.write(i);   
            }   
            fileInputStream.close();   
            
        }
        catch(Exception e)
        {
             out.println("<html><h1>failed to upload notice</h1><script>alert(\"sorry    😓 \nfailed to download assignment\")</script>");
            out.println("<script>location.href=\"student.jsp\"</script></html>");
        
        }
                
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AssignmentDownloadServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AssignmentDownloadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AssignmentDownloadServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AssignmentDownloadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
