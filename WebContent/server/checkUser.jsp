<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Check user</title>
	</head>
	<body>
	<div style="position:absolute;top:0;right:0;">[<a href="../login.jsp">Try Again...</a>]</div>
		<%
		try {
			//Create a connection string
			//String url = "jdbc:mysql://cs336-2.crujdr9emkb3.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
			String url = "placeholder";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");
	
			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "admin", "admin");
	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Get parameters from the HTML form
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			//Check counts once again (the same as the above)
			String str = "SELECT * FROM users WHERE users.username = '" + username + "' AND users.password = '" + password +"'";
			ResultSet result = stmt.executeQuery(str);
			result.next();
			
			
			String email = result.getString("email");
			String name = result.getString("name");
			String address = result.getString("address"); 
			String phone = result.getString("phone");
			String type = result.getString("type");
			
			
			
			session.setAttribute("user.username", username);
			session.setAttribute("user.password", password);
			session.setAttribute("user.email", email);
			session.setAttribute("user.name", name);
			session.setAttribute("user.address", address);
			session.setAttribute("user.phone", phone);		
	
			
			response.sendRedirect("../index.jsp");
		} catch (Exception ex) {
			out.print("Login Failed <br> " + ex);
		}
		%>
	</body>
</html>