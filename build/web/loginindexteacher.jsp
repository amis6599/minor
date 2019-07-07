<%-- 
    Document   : loginindex
    Created on : 30 May, 2016, 5:25:50 PM
    Author     : Anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="w3.css">
    <head>
        <title>Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/sdbce.ico">
    </head>
    <body>
    <center>
        
            <div class="w3-container w3-teal">
            <h1><strong>Sushila Devi Bansal College Of Engineering</strong> </h1>
            </div><br>
       
    </center>
    <header>
        <div class="w3-container">
           <center>
               
                <form action="teacher.jsp" style="display:inline">
                      <button class="w3-btn w3-teal w3-round-jumbo" style="width:11%">My Dashboard</button>
                </form> 
                <div class="w3-dropdown-hover ">
                    <button  class="w3-btn w3-teal w3-round-jumbo"><%=(String)session.getAttribute("nameofuser")%></button>
                    <div  class="w3-dropdown-content w3-card-8 w3-round-jumbo" style="width: 15%">
                        <a href="teacherUpdateInfo.jsp" class="w3-round-jumbo">Edit Information</a>
                        <a href="SignOutServlet" class="w3-round-jumbo">Sign Out</a>
                    </div>   
                </div>
           </center>
        </div><br>
    </header>
    
       
    
    <div class="w3-row-padding">
        <div class="w3-quarter" ><br>
            
            <!--Deaprtment Model-->
            
            <button onclick="document.getElementById('id101').style.display='block'"
                    class="w3-btn w3-teal w3-round-jumbo" style="width:55%">Departments</button>
                    
            <div id="id101" class="w3-modal w3-round-jumbo">
                <div class="w3-modal-content w3-card-4 w3-round-jumbo">
                    <header class="w3-container w3-teal w3-round-jumbo">
                        <span onclick="document.getElementById('id101').style.display='none'"
                              class="w3-closebtn">&timesb;</span>
                              <h2>Courses</h2>
                    </header>
                              <div class="w3-container w3-round-jumbo">
                                  <p>We Offer B.E. in Streams</p>
                                  <p>&nbsp;&CircleTimes;Computer Science & Engineering</p>
                                  <p>&nbsp;&CircleTimes;Information Technology </p>
                                  <p>&nbsp;&CircleTimes;Civil Engineering</p>
                                  <p>&nbsp;&CircleTimes;Mechanical Engineering</p>
                                  <p>&nbsp;&CircleTimes;Electronics & Communication Engineering</p>
                              </div>
                         <footer class="w3-container w3-round-jumbo w3-teal">
                             <P>sdbce</p>
                         </footer>
                         </div>
            </div>
            <br><br>
            <!--Recruiters Model
            -->
            <button onclick="document.getElementById('id102').style.display='block'"
                    class="w3-btn w3-teal w3-round-jumbo" style="width:55%">Our Recruiters</button>
                    
            <div id="id102" class="w3-modal w3-round-jumbo">
                <div class="w3-modal-content w3-card-4 w3-round-jumbo">
                    <header class="w3-container w3-teal w3-round-jumbo">
                        <span onclick="document.getElementById('id102').style.display='none'"
                              class="w3-closebtn">&timesb;</span>
                              <h2>Our Recruiters</h2>
                    </header>
                              <div class="w3-container">
                                 
                                  <p>&nbsp;&CircleTimes;Persistent</p>
                                  <p>&nbsp;&CircleTimes;Cognizant</p>
                                  <p>&nbsp;&CircleTimes;Zensar Technologies</p>
                                  <p>&nbsp;&CircleTimes;Zycus </p>
                                  <p>&nbsp;&CircleTimes;LNT InfoTech</p>
                                  <p>&nbsp;&CircleTimes;Tech Mahindra</p>
                                  
                              </div>
                         <footer class="w3-container w3-teal w3-round-jumbo">
                             <P>Sdbce</p>
                         </footer>
                         </div>
            </div>
        </div>
            
            
            
            
            
            
        
        <div class="w3-half"> 
            <div class="w3-card-8 w3-round-large" style="width:100% ">
                  <img src="images/sdbce.jpg" alt="sdbce" style="width:100%;height: 50%">
                  
            </div>  <br><br>
            <div class="w3-card-8" style="width:100%;height:50%">
                  <img src="images/notice.png" alt="Car" style="width:100%;height:25%">
            </div>   <br><br>
            
            <div class="w3-card-8" style="width:100%;height:50%">
                  <img src="images/assignment.jpg" alt="Car" style="width:100%;height:25%">
            </div>   <br><br>
            
       </div>
        <div class="w3-quarter"> 
            <li><p>Mechincal Riders Got Selected For <strong><i style="color: #009688">Ecokart 2016</i></strong></p></li>
            <li><p>Mechincal Riders Got Selected For <strong><i style="color: #009688">Ecokart 2016</i></strong></p></li>
            <li><p>Mechincal Riders Got Selected For <strong><i style="color: #009688">Ecokart 2016</i></strong></p></li>                    
        </div>
    </div>
    
    <center>
        <footer>
            <br><br>
             <div class="w3-container w3-teal">
                 <form action="aboutus.html" style="display:inline">
                        <button class="w3-btn w3-teal w3-round-jumbo" style="width:10%">About Us</button>
                </form>
                 
                 <form action="contact.html" style="display:inline">
                        <button class="w3-btn w3-teal w3-round-jumbo" style="width:10%">Contact Us</button>
                </form>
                 
                 <form action="policy.html" style="display:inline">
                        <button class="w3-btn w3-teal w3-round-jumbo" style="width:10%">Privacy Policy</button>
                </form><br>
                <h4>&copy;Sdbce</h4><h6> &nbsp; All Rights Reserved</h6>
             </div> 
        </footer>
    </center>
</body>
</html>
