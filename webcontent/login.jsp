<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/WEB-INF/CSS/myStyle.css" type="text/css"/>


<title>Hulton Hotel</title>
</head>
<body>
<h1>Login</h1>					  
	<div style="position:absolute;top:0;right:0;">[<a href="index.jsp">GO HOME</a>]</div>
<br>
	<p>Please login to continue...</p>
	<form method="post" action="server/checkUser.jsp">
	<table>
	<tr>    
		<td>Username</td><td><input type="text" name="username"></td>
	</tr>
	<tr>
		<td>Password</td><td><input type="password" name="password"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="Login">
	</form>
</body>
</html>