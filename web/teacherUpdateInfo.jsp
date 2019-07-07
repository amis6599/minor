
<%@page import="com.dto.TeacherDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.DbUtilDAO"%>
<%@page import="com.dto.StudentDTO"%>
   <%!
            TeacherDTO tdto=new TeacherDTO();
            String Query;
            ResultSet rs;
          %>
            <%
                tdto.setUserId((String)session.getAttribute("name"));
                Query ="select * from teacher where userid='"+tdto.getUserId()+"';";
                DbUtilDAO.getDbConnection();
                rs=DbUtilDAO.runSelectQuery(Query);
                while(rs.next())
                {
                    tdto.setName(rs.getString(2));
                    tdto.setBranch(rs.getString(5));
                    tdto.setDesignation(rs.getString(4));
                    tdto.setPassword(rs.getString(3));
                   
                }     
                       
                   
            %>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Information</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/sdbce.ico">
        <link rel="stylesheet" href="w3.css">
    </head>
    
    <header>
        <div class="w3-container w3-teal">
                <center> 
                    <h1 class="w3-animate-bottom"><strong>Sushila Devi Bansal College Of Engineering</strong></h1>
            <div class="w3-section" style="width:100%">
                <form action="loginindexteacher.jsp" style="display:inline">
                        <button class="w3-btn w3-teal" style="width:10%">Home</button>
                </form>                
               
                <form action="trends.html" style="display:inline">   
                        <button class="w3-btn w3-teal" style="width:10%">Trends</button>
                 </form>
                
                <form action="news.html" style="display:inline">  
                        <button class="w3-btn w3-teal" style="width:10%">News</button>
                </form>
               </div>
           </center>
        </div>
    </header>

    <body class="w3-padding">
    <center>
        <form class="w3-padding w3-card-4" style="width:50%" >
            
         
            <h1 style="color: #006666" class="w3-animate-top"><strong>Update Information</strong></h1>
          <div class="w3-group">      
              <input class="w3-input" type="text" style="width:40%" name="name" value="<%=tdto.getName()%>"required placeholder="name">
            <label class="w3-label">Name</label>
          </div><br>
          
      <div class="w3-group">
          <select class="w3-select" style="width:40%"name="branch">
            <option value="<%=tdto.getBranch()%>"><%=tdto.getBranch()%></option>
            <option value="CS">CS</option>
            <option value="IT">IT</option>
            <option value="ME">ME</option>
            <option value="CE">CE</option>
            <option value="EC">EC</option>
          </select><br>
          <label class="w3-label">Department</label>
      </div><br
          <div class="w3-group">      
              <input class="w3-input" type="text" value="<%=tdto.getDesignation()%>" name="designation" style="width:40%" >
            <label class="w3-label">Designation</label>  
          </div><br>
          <div class="w3-group">      
              <input class="w3-input" type="text" value="<%=tdto.getPassword()%>" name="password" style="width:40%" >
            <label class="w3-label">Password</label>  
          </div><br>
          <div class="w3-group">
              <button name="update"class="w3-btn w3-teal w3-ripple" onClick="Update()" style="width:15%">Update</button>
          </div>
        <Script>
            function Update(){
         <%
             if(request.getParameter("update")!=null)
             {            try{
             tdto.setName(request.getParameter("name"));
             tdto.setBranch(request.getParameter("branch"));
             tdto.setDesignation(request.getParameter("designation"));
             tdto.setPassword(request.getParameter("password"));
             Query="UPDATE teacher set name='"+tdto.getName()+"',designation='"+tdto.getDesignation()+"',branch='"+tdto.getBranch()+"',password='"+tdto.getPassword()+"' WHERE USERID='"+tdto.getUserId()+"'";
             
             DbUtilDAO.getDbConnection();
             DbUtilDAO.runDDLQuery(Query);
             
         %>
             alert("Profile updated");
             showModalDialog("studentUpdateInfo.jsp","Profile updated");
             <%
             request.getRequestDispatcher("teacher.jsp").forward(request, response);
            }finally {%>
                 alert("failed to update");
            <% }}
           %>              
         }
        </script>               
            
        </form>
    </body>
</center>
    
<center>
        <footer>
            <br><br>
             <div class="w3-container w3-teal">
                 <form action="aboutus.html" style="display:inline">
                        <button class="w3-btn w3-teal" style="width:10%">About Us</button>
                </form>
                 
                 <form action="contact.html" style="display:inline">
                        <button class="w3-btn w3-teal" style="width:10%">Contact Us</button>
                </form>
                 
                 <form action="policy.html" style="display:inline">
                        <button class="w3-btn w3-teal" style="width:15%">Privacy Policy</button>
                </form>
                 <form action="#" style="display:inline">
                     <button class="w3-btn w3-teal" style="width:10%">&Uparrow;Top</button>
                </form>
                 <br>
                 <h4>&copy;Sdbce &nbsp; All Rights Reserved</h4>
             </div> 
        </footer>
    </center>
</html>
                                                                                