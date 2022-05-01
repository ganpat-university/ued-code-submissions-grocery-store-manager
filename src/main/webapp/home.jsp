<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver ="com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "project";
String userid = "root";
String password = "1234";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Store Manager</title>
</head>
<body>
 <%try{
                    	connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                    	statement=connection.createStatement();
                    	String sql ="select * from shop";
                    	resultSet = statement.executeQuery(sql);
                    	if(resultSet.next()){
                    		
 %>
<h1><strong><%=resultSet.getString("sname") %></strong></h1>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<div class="tabs">
  
  <input type="radio" id="tab1" name="tab-control" checked>
  <input type="radio" id="tab2" name="tab-control">
  <input type="radio" id="tab3" name="tab-control">  
  <input type="radio" id="tab4" name="tab-control">
  <ul>
    <li title="Features"><label for="tab1" role="button">
    <svg viewBox="0 0 24 24">
</svg><br><span>INVENTORY</span></label></li>
    <li title="Delivery Contents"><label for="tab2" role="button"><svg viewBox="0 0 24 24">
</svg><br><span>RECORDS</span></label></li>
    <li title="Shipping"><label for="tab3" role="button"><svg viewBox="0 0 24 24">
   
</svg><br><span>INVOICE</span></label></li>    <li title="Returns"><label for="tab4" role="button"><svg viewBox="0 0 24 24">
   </svg><br><span>DELETE</span></label></li>
  </ul>
  
  <div class="slider"><div class="indicator"></div></div>
  <div class="content" >
    <section>
      <h2>INVENTORY</h2>
      <form><table>
      <thead>
     <th><button class="offset"><a href="inventory.jsp">EDIT</a>
     <button  class="offse"><a href="login.html">LOGOUT</a></button>	</th>
     </thead></table>	
     <table align = center border='0' letter-spacing=5px>
      <thead>
     <tr>
     <th style="padding-right:100px">PRODUCT ID</th>
     <th style="padding-right:100px">PRODUCT NAME</th>
     <th style="padding-right:100px">PRODUCT PRICE</th>
     <th style="padding-right:100px">PRODUCT QUANTITY</th>
     </tr>
     </thead><br>
     <br>	
     
     <tr>
     <%try{
                    	connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                    	statement=connection.createStatement();
                    	String sql ="select * from inventory";
                    	resultSet = statement.executeQuery(sql);
                    	while(resultSet.next()){
                    		
 %>
 <thead>
 	 <td style="padding-bottom:10px"><%=resultSet.getString("pid") %></td>
     <td style="padding-bottom:10px"><%=resultSet.getString("pname") %></td>
     
     <td style="padding-bottom:10px"><%=resultSet.getString("pprice") %></td>
     
     <td style="padding-bottom:10px"><%=resultSet.getString("pprice") %></td>
     </thead>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
     </tr>
     </table>
     </section>
        <section>
          <h2>RECORDS</h2>
     <table align = center border='0' letter-spacing=5px>
      <thead>
     <tr>
     <th style="padding-right:100px">INVOICE ID</th>
     <th style="padding-right:100px">CUSTOMER NAME</th>
     <th style="padding-right:100px">TOTAL PRODUCTS</th>
     <th style="padding-right:100px">TOTAL AMOUNT</th>
     </tr>
     </thead><br>
     <br>	
     
     <tr>
     <%try{
                    	connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                    	statement=connection.createStatement();
                    	String sql ="select * from record";
                    	resultSet = statement.executeQuery(sql);
                    	while(resultSet.next()){
                    		
 %>
 <thead>
 	 <td style="padding-bottom:10px"><%=resultSet.getString("iid") %></td>
     <td style="padding-bottom:10px"><%=resultSet.getString("custname") %></td>
     
     <td style="padding-bottom:10px"><%=resultSet.getString("quantity") %></td>
     
     <td style="padding-bottom:10px"><%=resultSet.getString("price") %></td>
     </thead>
   
     <button  class="offse"><a href="login.html">LOGOUT</a>
     </button>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
     </tr>
     </table></section>
        <section>
          <h2>INVOICE</h2>
          <button  class="offse"><a href="login.html">LOGOUT</a>
     </button>
     </section>
    <section>
          <h2>DELETE</h2>
          <center>
          <label for="confirm"><strong>ARE YOU SURE YOU WANT TO DELETE THIS ACCOUNT</strong></label>
         <input type="checkbox" id="confirm" name="delete" value="delete">
         </center>
          <button  class="Del"><a href="login.html">DELETE</a>
     </button>
          </section>
  </div>
</div>

</body>
</html>

<style>
@import 'https://fonts.googleapis.com/css?family=Montserrat:400,700|Raleway:300,400';
/* colors */
/* tab setting */
/* breakpoints */
/* selectors relative to radio inputs */
html {
  width: 100%;
  height: 100%;
}

body {
 background: -webkit-linear-gradient(left, #e5e4e2, #d9f144);
  background: linear-gradient(to right, #778ba5, #bcd4e6);
  font-family: "Raleway";
  height: 100%;
}
body h1 {
  text-align: center;
  color: #ffffff;
  font-weight: 300;
  padding: 40px 0 20px 0;
  margin: 0;
}

.tabs {
  left: 50%;
  transform: translateX(-50%);
  position: relative;
  background: white;
  padding: 50px;
  padding-bottom: 80px;
  width: 70%;
  height: auto;
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  border-radius: 5px;
  min-width: 240px;
}
.tabs input[name=tab-control] {
  display: none;
}
.tabs .content section h2,
.tabs ul li label {
  font-family: "Montserrat";
  font-weight: bold;
  font-size: 18px;
  color: #428BFF;
}
.tabs ul {
  list-style-type: none;
  padding-left: 0;
  display: flex;
  flex-direction: row;
  margin-bottom: 10px;
  justify-content: space-between;
  align-items: flex-end;
  flex-wrap: wrap;
}
.tabs ul li {
  box-sizing: border-box;
  flex: 1;
  width: 25%;
  padding: 0 10px;
  text-align: center;
}
.tabs ul li label {
  transition: all 0.3s ease-in-out;
  color: #929daf;
  padding: 5px auto;
  overflow: hidden;
  text-overflow: ellipsis;
  display: block;
  cursor: pointer;
  transition: all 0.2s ease-in-out;
  white-space: nowrap;
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
.tabs ul li label br {
  display: none;
}
.tabs ul li label svg {
  fill: #929daf;
  height: 1.2em;
  vertical-align: bottom;
  margin-right: 0.2em;
  transition: all 0.2s ease-in-out;
}
.tabs ul li label:hover, .tabs ul li label:focus, .tabs ul li label:active {
  outline: 0;
  color: #bec5cf;
}
.tabs ul li label:hover svg, .tabs ul li label:focus svg, .tabs ul li label:active svg {
  fill: #bec5cf;
}
.tabs .slider {
  position: relative;
  width: 25%;
  transition: all 0.33s cubic-bezier(0.38, 0.8, 0.32, 1.07);
}
.tabs .slider .indicator {
  position: relative;
  width: 110px;
  max-width: 100%;
  margin: 0 auto;
  height: 4px;
  background: #428BFF;
  border-radius: 1px;
}
.tabs .content {
  margin-top: 30px;
}
.tabs .content section {
  display: none;
  -webkit-animation-name: content;
          animation-name: content;
  -webkit-animation-direction: normal;
          animation-direction: normal;
  -webkit-animation-duration: 0.3s;
          animation-duration: 0.3s;
  -webkit-animation-timing-function: ease-in-out;
          animation-timing-function: ease-in-out;
  -webkit-animation-iteration-count: 1;
          animation-iteration-count: 1;
  line-height: 1.4;
}
.tabs .content section h2 {
  color: #428BFF;
  display: none;
}
.tabs .content section h2::after {
  content: "";
  position: relative;
  display: block;
  width: 30px;
  height: 3px;
  background: #428BFF;
  margin-top: 5px;
  left: 1px;
}
.tabs input[name=tab-control]:nth-of-type(1):checked ~ ul > li:nth-child(1) > label {
  cursor: default;
  color: #428BFF;
}
.tabs input[name=tab-control]:nth-of-type(1):checked ~ ul > li:nth-child(1) > label svg {
  fill: #428BFF;
}
@media (max-width: 600px) {
  .tabs input[name=tab-control]:nth-of-type(1):checked ~ ul > li:nth-child(1) > label {
    background: rgba(0, 0, 0, 0.08);
  }
}
.tabs input[name=tab-control]:nth-of-type(1):checked ~ .slider {
  transform: translateX(5%);
}
.tabs input[name=tab-control]:nth-of-type(1):checked ~ .content > section:nth-child(1) {
  display: block;
}
.tabs input[name=tab-control]:nth-of-type(2):checked ~ ul > li:nth-child(2) > label {
  cursor: default;
  color: #428BFF;
}
.tabs input[name=tab-control]:nth-of-type(2):checked ~ ul > li:nth-child(2) > label svg {
  fill: #428BFF;
}
@media (max-width: 600px) {
  .tabs input[name=tab-control]:nth-of-type(2):checked ~ ul > li:nth-child(2) > label {
    background: rgba(0, 0, 0, 0.08);
  }
}
.tabs input[name=tab-control]:nth-of-type(2):checked ~ .slider {
  transform: translateX(105%);
}
.tabs input[name=tab-control]:nth-of-type(2):checked ~ .content > section:nth-child(2) {
  display: block;
}
.tabs input[name=tab-control]:nth-of-type(3):checked ~ ul > li:nth-child(3) > label {
  cursor: default;
  color: #428BFF;
}
.tabs input[name=tab-control]:nth-of-type(3):checked ~ ul > li:nth-child(3) > label svg {
  fill: #428BFF;
}
@media (max-width: 600px) {
  .tabs input[name=tab-control]:nth-of-type(3):checked ~ ul > li:nth-child(3) > label {
    background: rgba(0, 0, 0, 0.08);
  }
}
.tabs input[name=tab-control]:nth-of-type(3):checked ~ .slider {
  transform: translateX(206%);
}
.tabs input[name=tab-control]:nth-of-type(3):checked ~ .content > section:nth-child(3) {
  display: block;
}
.tabs input[name=tab-control]:nth-of-type(4):checked ~ ul > li:nth-child(4) > label {
  cursor: default;
  color: #428BFF;
}
.tabs input[name=tab-control]:nth-of-type(4):checked ~ ul > li:nth-child(4) > label svg {
  fill: #428BFF;
}
@media (max-width: 600px) {
  .tabs input[name=tab-control]:nth-of-type(4):checked ~ ul > li:nth-child(4) > label {
    background: rgba(0, 0, 0, 0.08);
  }
}
.tabs input[name=tab-control]:nth-of-type(4):checked ~ .slider {
  transform: translateX(305%);
}
.tabs input[name=tab-control]:nth-of-type(4):checked ~ .content > section:nth-child(4) {
  display: block;
}
@-webkit-keyframes content {
  from {
    opacity: 0;
    transform: translateY(5%);
  }
  to {
    opacity: 1;
    transform: translateY(0%);
  }
}
@keyframes content {
  from {
    opacity: 0;
    transform: translateY(5%);
  }
  to {
    opacity: 1;
    transform: translateY(0%);
  }
}
@media (max-width: 1000px) {
  .tabs ul li label {
    white-space: initial;
  }
  .tabs ul li label br {
    display: initial;
  }
  .tabs ul li label svg {
    height: 1.5em;
  }
}
@media (max-width: 600px) {
  .tabs ul li label {
    padding: 5px;
    border-radius: 5px;
  }
  .tabs ul li label span {
    display: none;
  }
  .tabs .slider {
    display: none;
  }
  .tabs .content {
    margin-top: 20px;
  }
  .tabs .content section h2 {
    display: block;
  }
}
.offset {
  --color: #428BFF;
  --hover: #428BFF;
  position: fixed;
	bottom: 20px;
	right: 200px;
  

}
.offse {
  --color: #428BFF;
  --hover: #428BFF;
  position: fixed;
	bottom: 20px;
	right: 50px;
  

}
.Del {
  --color: #428BFF;
  --hover: #428BFF;
  position: fixed;
	bottom: 20px;
	right: 50px;
  

}
button {
  color: var(--color);
  transition: 0.25s;
}
button {
  background: none;
  border: 2px solid;
  font: inherit;
  line-height: 1;
  margin: 0.5em;
  padding: 1em 2em;
}
</style>