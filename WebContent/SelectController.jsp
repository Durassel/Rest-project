<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String cinema =  request.getParameter("cinema");
	/*RequestDispatcher rd = getServletContext().getRequestDispatcher("/rest/sendMovies/cinema/"+cinema);
	rd.forward(request, response);	*/
	response.sendRedirect("/RESTProject/rest/sendMovies/cinema/"+cinema);
%>