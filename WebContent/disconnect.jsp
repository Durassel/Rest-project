<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>

<% Map<String, String> auth = (Map<String, String>) session.getAttribute("auth");
if (auth != null) {
	// User connected -> disconnect him
	session.removeAttribute("auth");
	session.setAttribute("notification", "You are successfully logged out !");
	response.sendRedirect("index.jsp");
}
%>