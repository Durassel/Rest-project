<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="restProject.LoadMovie"%>
<%@page import="restProject.SendMovie"%>
<%@page import="java.net.URI"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javax.ws.rs.core.GenericType"%>
<%@page import="javax.ws.rs.client.Client"%>
<%@page import="javax.ws.rs.client.ClientBuilder"%>
<%@page import="javax.ws.rs.client.WebTarget"%>
<%@page import="javax.ws.rs.core.MediaType"%>
<%@page import="javax.ws.rs.core.Response"%>
<%@page import="javax.ws.rs.core.UriBuilder"%>
<%@page import="org.glassfish.jersey.client.ClientConfig"%>
<%@page import="org.glassfish.jersey.model.internal.RankedComparator.Order"%>

<%@page import="javax.ws.rs.ext.MessageBodyReader"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="custom.css" />
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
<form action="SelectController.jsp">
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
	ClientConfig confi = new ClientConfig();
	Client client = ClientBuilder.newClient(confi);

     WebTarget target = client.target("http://localhost:8090/RESTProject");
     List<SendMovie> xmlAnswer = target.path("rest").path("sendMovies").path("cinema/"+request.getParameter("cinema")).request().accept(MediaType.TEXT_XML).get(new GenericType<List<SendMovie>>() {});
       
       /*WebTarget target = client.target("http://localhost:8090/rest").path("rest").path("sendMovies");
	String list = target.path("").request.accept(MediaType.TEXT_XML).get(String.class);*/
	out.println("<table>");
	for(SendMovie movie: xmlAnswer)
	{
		out.println("<tr>");
		out.println("<th><a href='http://localhost:8090/RESTProject/rest/sendMovies/"+movie.getId()+"'>"+movie.getTitle()+"</a></th>");
		out.println("<td>");
		out.println("<a href='http://localhost:8090/RESTProject/rest/sendMovies/"+movie.getId()+"'>"+movie.getTitle()+"</a>");
		out.println("<p>To "+movie.getCinema()+"</p>");
		out.println("<p>Duration :"+movie.getDuration()+"</p>");
		if(!movie.getLanguage().isEmpty())
		{
			out.println("<p>Language :"+movie.getLanguage()+"</p>");
		}
		
		out.println("<p>Director: "+movie.getDirector().getFirstName()+" "+movie.getDirector().getLastName()+"</p>");
		out.println("<p>Main actor: "+movie.getActors().getActor().get(0).getFirstName()+" "+movie.getActors().getActor().get(0).getLastName()+"</p>");
		out.println("<a href='http://localhost:8090/RESTProject/rest/sendMovies/"+movie.getId()+"'>more information...</a>");
		out.println("</td>");
		out.println("</tr>");
		//out.println(movie+"<br/><br/>");
	}
	out.println("</table>");

	%>
</article>
</body>
</html>