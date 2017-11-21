<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="restProject.LoadMovie"%>
<%@page import="restProject.SendMovie"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="movieShow.css" />
	<title>Insert title here</title>
</head>
<body>
<header>
		<h1>Home</h1>
	</header>
	<div class="menu">
		<table>
			<tr>
				<td><a href="Home.jsp" >Home</a></td>
				<td><a href="Login.jsp">sign in</a></td>
				<td><a href="SelectMovie.jsp">Choose a movie</a></td>
			</tr>
		</table>
	</div>
<form action="http://localhost:8090/RESTProject/rest/sendMovies">
	<label>Choose a cinema :</label><br/>
	<select name="cinema" size="1">
	<%//<input name="cinema"  value="1">
		ArrayList<String> cinemas = LoadMovie.instance.getCinemas();
		for(String cinema : cinemas)
		{
			out.write("<option>"+cinema+"</option>");
		}
	
	%>
	</select>
	<input type="submit" value="Search"/>
</form>
<article>
	<%
	/*ArrayList<SendMovie> movies = LoadMovie.instance.getMovies();*/
	%>
</article>
</body>
</html>