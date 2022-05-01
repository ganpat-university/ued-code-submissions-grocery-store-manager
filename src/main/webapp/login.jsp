<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<h1>login</h1>
<%
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");
String email = request.getParameter("email");
String password = request.getParameter("password");
PreparedStatement pst = con.prepareStatement("SELECT * FROM shop where email=? and pass=?");
pst.setString(1, email);
pst.setString(2, password);
ResultSet rs = pst.executeQuery();
if(rs.next()){
out.println("================LOGIN SUCCESSFULLY===============");
response.setContentType("text/html");

RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
rd.forward(request,response);
}
else
{
out.println("Invalid credentials!!! Pls try again");
response.setContentType("text/html");
RequestDispatcher rd=request.getRequestDispatcher("login.html");
rd.forward(request,response);
}
}
catch(Exception e){
out.println("Something went wrong, Please try again");
}
%>
</body>
</html>
