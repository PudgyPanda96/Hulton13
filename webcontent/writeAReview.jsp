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
<title>Hulton Review</title>
</head>
<body>
<h1>Type of Review</h1>
    <div style="position:absolute;top:0;right:0;">[<a href="index.jsp">GO HOME</a>]</div>
<h2>Review/rating
  <%
		String queryStr = request.getQueryString().toString();
		String[] cookies = queryStr.split("&");
		String reviewId = cookies[0].split("=")[1];
		String hotelReview = cookies[1].split("=")[1];
		out.println(hotelReview);
	%>
</h2>
<p></p>
  <form method="post" action="server/rateHotel.jsp">
    <table>
			<tr>
				<td>Rating: </td>
				<td>
          <input type="radio" name="rating" value="1"> 1
          <input type="radio" name="rating" value="2"> 2
          <input type="radio" name="rating" value="3" checked> 3
          <input type="radio" name="rating" value="4"> 4
          <input type="radio" name="rating" value="5"> 5
        </td>
    </tr>
    <tr>
      <td>Comment: </td>
      <td><textarea name="comment" rows="4" cols="50" placeholder="Comments:"></textarea></td>
    </tr>
  </table>
  <br>
  <input type="hidden" id="reviedId" name="reviewId" value="">
  <input type="hidden" id="hotelReview" name="hotelReview" value="">
  <input type="checkbox" name="public" value="1"> Public?<br>
  <input type="submit" value="Rate">
</form>
<script>
  document.getElementById("reviewId").value = '<%= rideId %>';
  document.getElementById("driver").value = '<%= driver %>';
</script>
</body>
</html>
