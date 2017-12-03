<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.lang.String" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.sql.ResultSetMetaData" %>
<%@page import="database.Database" %>
<%@page import="app.Encryption" %>

<%
// Database connection
Connection db = Database.getConnection();
Statement stmt = db.createStatement();

// Login form data
String login = request.getParameter("login");
String password = request.getParameter("password");

// Encrypted password
String encryptedPassword = Encryption.getSecurePassword(password);

// Query
ResultSet rs = stmt.executeQuery("SELECT * FROM Cinemas WHERE CinemaName='" + login + "' AND CinemaPassword='" + encryptedPassword + "'");

// Result
boolean error = true;

ResultSetMetaData rsmd = rs.getMetaData();
int columnsNumber = rsmd.getColumnCount();

while (rs.next()) { %>
	<%--@ include file="NewMovie.jsp" --%>
	<% Map<String, String> auth = new HashMap<>();
	for (int i = 1; i <= columnsNumber; i++) {
        String columnValue = rs.getString(i);
        auth.put(rsmd.getColumnName(i), columnValue);
    }
	session.setAttribute("auth", auth);
	session.setAttribute("notification", "You are successfully logged in !");
	response.sendRedirect("index.jsp");
	error = false;
}

// Complete errors array and redirect
if (error == true) {
	Map<String, String> errors = new HashMap<>();
  	if(login.equals("") || password.equals("")) {
  		if(login.equals(""))
      		errors.put("login", "Login empty");
  		if(password.equals(""))
      		errors.put("password", "Password empty");
  	} else {
      	errors.put("invalid", "Invalid credentials. Please try again.");
  	}

	session.setAttribute("errors", errors);
    response.sendRedirect("login.jsp");
} %>