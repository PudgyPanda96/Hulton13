<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hulton Services</title>
</head>
<body>
<h1>Service Type</h1>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Create a connection string
			String url = "jdbc:mysql://cs336-2.crujdr9emkb3.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "student", "student");

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the HelloWorld.jsp
			String entity = request.getParameter("command");
			//Make a SELECT query from the table specified by the 'command' parameter at the HelloWorld.jsp
			String str = "SELECT * FROM " + entity;
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("name");
			out.print("</td>");
			//make a column
			out.print("<td>");
			//depending on the radio button selection make a column header for price if the laundry service table was selected and another type of service if the other was selected
			if (entity.equals("laundry"))
				out.print("price");
			else
				out.print("Please select a type of service");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current service name:
				out.print(result.getString("name"));
				out.print("</td>");
				out.print("<td>");
				//Print out current laundry price:
				if (entity.equals("laundry"))
					out.print(result.getString("price"));
				else
					out.print(result.getString("Please select a type of service"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>