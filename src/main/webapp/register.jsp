<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

try{
	
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");
        String name = request.getParameter("nm");
		String email = request.getParameter("em");
		String cn = request.getParameter("cn");
		String pass= request.getParameter("pass");
		String que="INSERT INTO shop(`sname`,`contact`,`email`,`pass`) values (?,?,?,?)";		
	
		PreparedStatement p = con.prepareStatement(que);
		p.setString(1,name);
		p.setString(2,cn);
		p.setString(3,email);
		p.setString(4,pass);
		p.executeUpdate();
		out.println("<h1>Values Added successfully!!!</h1>");
		RequestDispatcher rd=request.getRequestDispatcher("register.html");
		rd.forward(request,response);
		p.close();
		con.close();
}
catch(Exception e) {
System.out.println(e);
}
%>

</body>
</html>