<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.ArrayList" %>
<%

try {//on se connecte
	Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e1) {
	// TODO Auto-generated catch block
	e1.printStackTrace();
}
String url ="jdbc:mysql://localhost:3306/moviesdb";
String  name= "root";
String password = "software";
String message = "";
Connection connect = DriverManager.getConnection(url, name, password);
Statement stat = connect.createStatement();
String cinema =  request.getParameter("cinema");
String title = request.getParameter("title");
String duration = request.getParameter("duration");
String language = request.getParameter("language");
String directorL = request.getParameter("directorL");
String directorF = request.getParameter("directorF");
int age = Integer.parseInt(request.getParameter("age"));
int nbActors = Integer.parseInt(request.getParameter("nbActor"));
ArrayList<String> actorsF = new ArrayList<String>();
ArrayList<String> actorsL = new ArrayList<String>();
for(int i=1; i<= nbActors; i++)
{
	actorsF.add(request.getParameter("actorF"+i));
	actorsL.add(request.getParameter("actorL"+i));
}
String actorF = request.getParameter("actorF1");
String actorL = request.getParameter("actorL1");
String startDate = request.getParameter("startDate");
String endDate = request.getParameter("endDate");
String day = request.getParameter("day");

if(cinema.equals(""))
{
	message+= "Please put a cinema<br/>";
}
if(title.equals(""))
{
	message+= "Please put a tile<br/>";
}
if(duration.equals(""))
{
	message+= "Please put a duration<br/>";
}
if(directorF.equals(""))
{
	message+= "Please put a a firtname to the director<br/>";
}
if(directorL.equals(""))
{
	message+= "Please put a a surname to the director<br/>";
}
for(int i=0; i<nbActors;i++)
{
	if(actorsF.get(i).equals(""))
	{
		message+= "Please put a firstname to the actor"+(i+1)+"<br/>";
	}
	if(actorsL.get(i).equals(""))
	{
		message+= "Please put a surname to the actor"+(i+1)+"<br/>";
	}
}
if(startDate.equals(""))
{
	message+= "Invalid date<br/>";
}
if(endDate.equals(""))
{
	message+= "Invalid date";
}
if(message.equals(""))
{
	request.setAttribute("actorsF", actorsF);
	request.setAttribute("actorsL", actorsL);
	out.println("ok");
	//getContextpath
	response.sendRedirect("../RESTProject/rest/sendMovies");
}
else 
{
	%>
	    <%session.setAttribute("error", message );%>
	    <%@include file="NewMovie.jsp"%>
	    <%
}
%>