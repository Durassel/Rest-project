<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="Allociné REST Project">
	    <meta name="author" content="Alexis DOS SANTOS - Frédéric ROSSO">
	
	    <title>${param.title}</title>
	
	    <!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	
		<!-- Custom styles for this template -->
		<link rel="stylesheet" href="custom.css" />
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-light bg-yellow">
			<header class="container">
  				<a class="navbar-brand" href="index.jsp">CineEfrey</a>

       			<div class="collapse navbar-collapse">
         			<ul class="navbar-nav mr-auto">
         				<% Map<String, String> auth = (Map<String, String>) session.getAttribute("auth");
						if (auth != null) { %>
							<li class="nav-item">
			  					<a class="nav-link" href="http://localhost:8090/RESTProject/addMovie.jsp">Add a movie</a>
							</li>
							<li class="nav-item">
			  					<a class="nav-link" href="http://localhost:8090/RESTProject/disconnect.jsp">Logout</a>
							</li> <%
						} else { %>
							<li class="nav-item">
			  					<a class="nav-link" href="http://localhost:8090/RESTProject/login.jsp">Login</a>
							</li> <%
						}
						%>
         			</ul>

	       			<form class="form-inline my-2 my-md-0 col-md-4" method="POST" action="SelectMovie.jsp">
	        			<input class="form-control search" type="text" placeholder="Search" aria-label="Search">
	        			<input type="submit" class="btn" value="Search"/>
	
	         			<div class="form-check form-check-inline">
	  						<label class="form-check-label">
	    						<input class="form-check-input" type="radio" name="radio" value="movie" checked="checked"> Movie
	  						</label>
						</div>
						<div class="form-check form-check-inline">
						  	<label class="form-check-label">
						    	<input class="form-check-input" type="radio" name="radio" value="cinema"> Cinema
						  	</label>
						</div>
						<div class="form-check form-check-inline">
						  	<label class="form-check-label">
						    	<input class="form-check-input" type="radio" name="radio" value="city"> City
						  	</label>
						</div>
     				</form>
   				</div>
   			</header>
   		</nav>
   		
   		<% String notification = (String) session.getAttribute("notification");
		if (notification != null) { %>
			<div class="container">
				<div class="alert alert-success">
					<%= notification %>
				</div>
			</div> <%
			session.removeAttribute("notification");
		}
		%>
