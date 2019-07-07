<%-- 
    Document   : student
    Created on : 5 May, 2016, 6:33:30 PM
    Author     : Anurag
--%>

<%@page import="com.dto.AssignmentDTO"%>
<%@page import="com.dto.NoticeUploadDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.DbUtilDAO"%>
<%@page import="com.dto.StudentDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="w3.css"/>
        <link rel="icon" href="images/sdbce.ico">
        <title>student</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%!
        StudentDTO SDto=new StudentDTO();
        NoticeUploadDTO NDto=new NoticeUploadDTO();
        String Query;
        ResultSet rs;
        int count;
        AssignmentDTO ADto=new AssignmentDTO();
    %>
    <%
        SDto.setUserId((String)session.getAttribute("name"));
        Query="Select * from Student where userid='"+SDto.getUserId()+"';";
           DbUtilDAO.getDbConnection();
        rs=DbUtilDAO.runSelectQuery(Query);
        while(rs.next())
        {
          SDto.setName(rs.getString(2));
          SDto.setBranch(rs.getString(3));
          SDto.setSem(rs.getString(4));
          System.out.println("values  :"+rs.getString(2)+""+rs.getString(3)+""+rs.getString(4));
           session.setAttribute("nameofuser",SDto.getName());
        }
 
     %>
    <body>

        <center>
            <div class="w3-container w3-teal">
             <h1><strong>Sushila Devi Bansal College Of Engineering</strong></h1>
            </div>
        </center>
    
    <header>
        <div class="w3-container">
            <center> 
                <div class="w3-section" style="width:100%">
                    <form action="loginindexstudent.jsp" style="display:inline">
                        <button class="w3-btn w3-teal w3-round-jumbo" style="width:10%">Home</button>
                    </form>  

                    <form action="trends.html" style="display:inline">   
                        <button class="w3-btn w3-teal w3-round-jumbo" style="width:10%">Trends</button>
                    </form>

                    <form action="news.html" style="display:inline">  
                        <button class="w3-btn w3-teal w3-round-jumbo" style="width:10%">News</button>
                    </form>
                    <div class="w3-dropdown-hover ">
                        <button  class="w3-btn w3-teal w3-round-jumbo"><%=SDto.getName()%></button>
                        <div  class="w3-dropdown-content w3-card-8" style="width: 15%">
                            <a href="studentUpdateInfo.jsp">Edit Information</a>
                            <a href="SignOutServlet">Sign Out</a>
                        </div>   
                    </div>   
                </div>
            </center>
        </div>
    </header>
    <center> <br>
        <%
            Query="select subjectname from subject where branch='"+SDto.getBranch() +"' and sem='"+SDto.getSem()+"'order by SUBJECTCODE";
              DbUtilDAO.getDbConnection();
            rs=DbUtilDAO.runSelectQuery(Query);
            String s[]=new String[5];
            count=0;
            while(rs.next())
            {
                s[count]=rs.getString(1);
                count++;
            }
        %>
        
        <div class="w3-row-padding">
            <div class="w3-quarter">
                <div class="w3-dropdown-hover ">
                    <button  class="w3-btn w3-teal w3-round-jumbo">View Assignments</button>
                    <div  class="w3-dropdown-content w3-card-8" style="width: 15%">
                        <a onclick="document.getElementById('id101').style.display = 'block'"><%out.print(SDto.getBranch());%>-<%out.print(SDto.getSem());%>01</a>
                        <div id="id101" class="w3-modal">
                            <div class="w3-modal-content w3-card-4">
                                <header class="w3-container w3-teal">
                                    <span onclick="document.getElementById('id101').style.display = 'none'"
                                          class="w3-closebtn">&timesb;</span>
                                    <h2><%=s[0]%></h2>
                                </header>
                                <div class="w3-container" >
                                    <p><%out.print(SDto.getBranch());%>-<%out.print(SDto.getSem());%>01 1<sup>st</sup> Assignment</p>
                                    <form action="AssignmentDownloadServlet"  style="display:inline">  
                                        <button class="w3-btn w3-teal w3-round-jumbo" value="1" name="Assno">Download</button>
                                    </form>     
                                </div><br>
                                <footer class="w3-container w3-teal">
                                    <p>Department of <%=SDto.getBranch()%><p>
                                </footer>
                            </div>
                        </div>

                        <!--Second Ass-->
                        <a onclick="document.getElementById('id102').style.display = 'block'"><%out.print(SDto.getBranch());%>-<%out.print(SDto.getSem());%>02</a>
                        <div id="id102" class="w3-modal">
                            <div class="w3-modal-content w3-card-4">
                                <header class="w3-container w3-teal">
                                    <span onclick="document.getElementById('id102').style.display = 'none'"
                                          class="w3-closebtn">&timesb;</span>
                                    <h2><%=s[1]%></h2>
                                </header>
                                <div class="w3-container">
                                    <p><%out.print(SDto.getBranch());%>-<%out.print(SDto.getSem());%>02 1<sup>st</sup> Assignment</p>
                                    <form action="AssignmentDownloadServlet"  style="display:inline">  
                                        <button class="w3-btn w3-teal" value="2" name="Assno">Download</button>
                                    </form>     
                                </div><br>
                                <footer class="w3-container w3-teal">
                                    <P>Department of <%=SDto.getBranch()%></p>
                                </footer>
                            </div>
                        </div>

                        <!--Third Ass-->
                        <a onclick="document.getElementById('id103').style.display = 'block'"><%out.print(SDto.getBranch());%>-<%out.print(SDto.getSem());%>03</a>
                        <div id="id103" class="w3-modal">
                            <div class="w3-modal-content w3-card-4">
                                <header class="w3-container w3-teal">
                                    <span onclick="document.getElementById('id103').style.display = 'none'"
                                          class="w3-closebtn">&timesb;</span>
                                    <h2><%=s[2]%></h2>
                                </header>
                                <div class="w3-container">
                                    <p><%out.print(SDto.getBranch());%>-<%out.print(SDto.getSem());%>03 1<sup>st</sup> Assignment</p>
                                    <form action="AssignmentDownloadServlet"  style="display:inline">  
                                        <button class="w3-btn w3-teal" name="Assno" value="3">Download</button>
                                    </form>     
                                </div><br>
                                <footer class="w3-container w3-teal">
                                    <P>Department of <%=SDto.getBranch()%></p>
                                </footer>
                            </div>
                        </div>
                        <!--Fourth Assignmnt-->
                        <a onclick="document.getElementById('id104').style.display = 'block'"><%out.print(SDto.getBranch());%>-<%out.print(SDto.getSem());%>04</a>
                        <div id="id104" class="w3-modal">
                            <div class="w3-modal-content w3-card-4">
                                <header class="w3-container w3-teal">
                                    <span onclick="document.getElementById('id104').style.display = 'none'"
                                          class="w3-closebtn">&timesb;</span>
                                    <h2><%=s[3]%></h2>
                                </header>
                                <div class="w3-container">
                                    <p> <%out.print(SDto.getBranch());%>-<%out.print(SDto.getSem());%>04 1<sup>st</sup> Assignment</p>
                                    <form action="AssignmentDownloadServlet"  style="display:inline">  
                                        <button class="w3-btn w3-teal" name="Assno" value="4">Download</button>
                                    </form>     
                                </div><br>
                                <footer class="w3-container w3-teal">
                                    <P>Department of <%=SDto.getBranch()%></p>
                                </footer>
                            </div>
                        </div>
                        <!--Fifth Ass-->
                        <a onclick="document.getElementById('id105').style.display = 'block'"><%out.print(SDto.getBranch());%>-<%out.print(SDto.getSem());%>05</a>
                        <div id="id105" class="w3-modal">
                            <div class="w3-modal-content w3-card-4">
                                <header class="w3-container w3-teal">
                                    <span onclick="document.getElementById('id105').style.display = 'none'"
                                          class="w3-closebtn">&timesb;</span>
                                    <h2><%=s[4]%></h2>
                                </header>
                                <div class="w3-container">
                                    <p> <%out.print(SDto.getBranch());%>-<%out.print(SDto.getSem());%>05 1<sup>st</sup> Assignment</p>
                                    <form action="AssignmentDownloadServlet"  style="display:inline">  
                                        <button class="w3-btn w3-teal" name="Assno" value="5">Download</button>
                                    </form>     
                                </div><br>
                                <footer class="w3-container w3-teal">
                                    <P>Department of <%=SDto.getBranch()%></p>
                                </footer>
                            </div>
                        </div>




                    </div>   
                </div>   
            </div>

            <div class="w3-half" >
                <center>
                     <%
                         Query="SELECT  NOTICE_CONTENT, NAME,DESIGNATION , teacher.BRANCH FROM notice,teacher WHERE teacher.USERID=notice.TUSERID AND notice.branch='"+SDto.getBranch()+"'AND notice.SEM='"+SDto.getSem()+"'";
                         rs=DbUtilDAO.runSelectQuery(Query);
                        while(rs.next())
                        {   

                            NDto.setContent(rs.getString(1));
                            NDto.setName(rs.getString(2));
                            NDto.setBranch(rs.getString(3));
                            NDto.setDesignation(rs.getString(4));
                     %>
                    <div class="w3-card-8" style="width: 100%" style="display:inline-block">
                        <header class="w3-container w3-teal ">
                            <h5 class="w3-large"><strong><%=NDto.getName()%></strong></h5>
                            <h6 style="display: inline" class="w3-small"><strong><%=NDto.getBranch()%> (<%=NDto.getDesignation()%>)</strong></h6>
                        </header>

                        <div class="w3-container">
                            <p> <%=NDto.getContent()%>
                            </p>
                        </div>

                        <footer class="w3-container w3-teal" style="height:50px ">
                            <P>Sdbce</p>
                        </footer>

                    </div>
                    <br><br>
                    <%}%>

                    
                </center>     
            </div>

            <div class="w3-quarter">
                <div class="w3-tooltip">

                        <div class="w3-container w3-teal w3-text">
                        <p>We Are the, Future Engineers Of India.
                           We are ready for upcoming future challenges, in order to provide
                           better services to our people of India and also to people around the world
                        </p>
                        </div>

                        <img src="images\student.jpg" alt="student" style="width:100%">
                 </div>
                
               </div>

        </div>   
    </center>
    
    <center>
        
            <br><br>
            
                 <footer class="w3-bottom w3-container w3-teal">
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


