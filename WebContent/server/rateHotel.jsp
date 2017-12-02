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
<title>Rate Hotel</title>
</head>
<body>
	<div style="position:absolute;top:0;right:0;">[<a href="../index.jsp">GO HOME</a>]</div>
	<%
  try {
    //Create a connection string
    String url = "jdbc:mysql://cs336g32.cyi4cdd85yp2.us-east-1.rds.amazonaws.com:3306/cs336g32";
    //Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
    Class.forName("com.mysql.jdbc.Driver");

    //Create a connection to your DB
    Connection con = DriverManager.getConnection(url, "admin", "password");

    //Create a SQL statement
    Statement stmt = con.createStatement();

    //Get parameters from the HTML form
    String userRated = request.getParameter("hotelReview");
    String userRater = session.getAttribute("user.username").toString();
    String rating = request.getParameter("rating");
    String comment = request.getParameter("comment");
    String reviewId = request.getParameter("reviewId");
    String isPublic = request.getParameter("public");
    if(isPublic==null)
      isPublic = "0";


    String str = "INSERT INTO ratings(isPublic, userRated, userRater, reviewId, value, comment) VALUES (?, ?, ?, ?, ?, ?)";


    PreparedStatement ps = con.prepareStatement(str);


    ps.setString(1, isPublic);
    ps.setString(2, userRated);
    ps.setString(3, userRater);
    ps.setString(4, reviewId);
    ps.setString(5, rating);
    ps.setString(6, comment);


    ps.executeUpdate();


    con.close();

    response.sendRedirect("../index.jsp");
  } catch (Exception ex) {
    out.print("Rating insert failed <br> " + ex);
  }


  %>
</body>
</html>
