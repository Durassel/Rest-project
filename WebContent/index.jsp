<% String title = "Index"; %>
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

<jsp:include page="header.jsp">
    <jsp:param name="title" value="<%= title %>"/>
</jsp:include>

	    <main class="container">
	      	<h1>Welcome on EFREI cinema !</h1>
	       	
	    </main><!-- /.container -->
<div>
	<%
	/*ArrayList<SendMovie> movies = LoadMovie.instance.getMovies();*/
	ClientConfig confi = new ClientConfig();
	Client client = ClientBuilder.newClient(confi);

     WebTarget target = client.target("http://localhost:8090/RESTProject");
     List<SendMovie> xmlAnswer = target.path("rest").path("sendMovies").request().accept(MediaType.TEXT_XML).get(new GenericType<List<SendMovie>>() {});
       
       /*WebTarget target = client.target("http://localhost:8090/rest").path("rest").path("sendMovies");
	String list = target.path("").request.accept(MediaType.TEXT_XML).get(String.class);*/
	out.println("<table>");
	for(SendMovie movie: xmlAnswer)
	{
		out.println("<tr>");
		out.println("<th><img src='"+movie.getPoster()+"' alt="+movie.getTitle()+" height='300' width='220'></th>");
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
</div>
<jsp:include flush="true" page="/footer.jsp"></jsp:include>