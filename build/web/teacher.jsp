<%@page import="com.dto.NoticeUploadDTO"%>
<%@page import="com.dao.DbUtilDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dto.TeacherDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String Query;
    TeacherDTO tdto=new TeacherDTO();
    NoticeUploadDTO NDto=new NoticeUploadDTO();
    ResultSet rs;
%>
<%
    DbUtilDAO.getDbConnection();
    tdto.setUserId((String)session.getAttribute("name"));
    Query ="Select * from teacher where userid='"+tdto.getUserId()+"'";
    rs=DbUtilDAO.runSelectQuery(Query);
    while(rs.next())
    {
        tdto.setName(rs.getString(2));
        session.setAttribute("nameofuser",tdto.getName());
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Teachers</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/sdbce.ico">
        <link rel="stylesheet" href="w3.css">
    </head>
    <body class="w3-container">
        <style>
            webkit-input-placeholder{
                color:#009688 
            }
        </style>
            <center>
                <div class="w3-container w3-teal">
                <h1><strong>Sushila Devi Bansal College Of Engineering</strong> </h1>
                </div>
            </center>
                
            <center>
                 <header>
                    <div class="w3-container">
                        <center> 
                            <div class="w3-section " style="width:100%">
                                <form action="loginindexteacher.jsp" style="display:inline">
                                    <button class="w3-btn w3-teal w3-round-jumbo" style="width:10%">Home</button>
                                </form>  

                                <form action="mynotice.jsp" style="display:inline">   
                                    <button class="w3-btn w3-teal w3-round-jumbo" style="width:10%">My Notices</button>
                                </form>
                                <div class="w3-dropdown-hover ">
                                    <button  class="w3-btn w3-teal w3-round-jumbo"><%=tdto.getName()%></button>
                                    <div  class="w3-dropdown-content w3-card-8" style="width: 15%">
                                        <a href="teacherUpdateInfo.jsp">Edit Information</a>
                                        <a href="SignOutServlet">Sign Out</a>
                                    </div>   
                                </div>   
                            </div>
                        </center>
                    </div>
                </header>
          </center>   <br>
           <div class="w3-row-padding w3-container">
               <div class="w3-quarter">
                   
                   <div class =" w3-padding w3-card-8 " >
                         <form action="noticeupload.html">
                             <button class="w3-btn w3-teal w3-section w3-ripple w3-round-jumbo" style="width:74%">upload Notice</button>
                         </form>
                        
                          <form action="assignmentupload.html">
                            <div>
                                 <button class="w3-btn w3-teal w3-section w3-ripple w3-round-jumbo" style="width:74%">upload Assignment</button>
                            </div>
                        </form>
                     </div>
               </div>
               
               <div class="w3-half">
                  <center>
               <%                   
                    Query="SELECT NOTICE_CONTENT , NAME ,DESIGNATION FROM  notice , teacher WHERE notice.TUSERID=teacher.USERID and teacher.userid!='"+tdto.getUserId()+"';";
                    rs=DbUtilDAO.runSelectQuery(Query);
                    while(rs.next())
                    {
                        NDto.setContent(rs.getString(1));
                        NDto.setName(rs.getString(2));
                        NDto.setDesignation(rs.getString(3));
                    
                %>
                       <div class="w3-card-8" style="width: 100%" style="display: inline-block">
                        <header class="w3-container w3-teal ">
                            <p class="w3-content ">
                                <strong><%=NDto.getName()%></strong> 
                            <h6><%=NDto.getDesignation()%></h6>
                            </p>
                        </header>

                        <div class="w3-container ">
                            <p> <%=NDto.getContent()%>
                            </p>
                        </div>
             
                        <footer class="w3-container w3-teal" style="height:50px ">
                            <P>Sdbce</p>
                        </footer>

                    </div><br>
                    <%}%>
                  </center>
               </div>
               
               
           </div>
   
    
    <center>
        <br><br>
        
            <footer class="w3-bottom w3-teal w3-padding">
                        <form action="aboutus.html" style="display:inline">
                               <button class="w3-btn w3-teal w3-round-jumbo" style="width:10%">About Us</button>
                       </form>

                        <form action="contact.html" style="display:inline">
                               <button class="w3-btn w3-teal w3-round-jumbo" style="width:10%">Contact Us</button>
                       </form>
                       <form action="policy.html" style="display:inline">
                               <button class="w3-btn w3-teal w3-round-jumbo" style="width:15%">Privacy Policy</button>
                       </form>
                        <form action="#" style="display:inline">
                            <button class="w3-btn w3-teal w3-round-jumbo" style="width:10">&Uparrow;Top</button>
                       </form>

                            <br>
               
                 <h4>&copy;Sdbce</h4><h6 style="display:inline">&nbsp;All Rights Reserved</h6>
              </footer>
    </center>
 </body>
</html>
