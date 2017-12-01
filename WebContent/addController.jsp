<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.ArrayList" %>
<%@page import="object.listAName" %>
<%

try {//on se connecte
	Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e1) {
	// TODO Auto-generated catch block
	e1.printStackTrace();
}
String url ="jdbc:mysql://localhost:3306/dbmovies";
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

int monthS = Integer.parseInt(request.getParameter("monthS"));
int dayS = Integer.parseInt(request.getParameter("dayS"));
int yearS = Integer.parseInt(request.getParameter("yearS"));
int monthE = Integer.parseInt(request.getParameter("monthE"));
int dayE = Integer.parseInt(request.getParameter("dayE"));
int yearE = Integer.parseInt(request.getParameter("yearE"));


String day1 = request.getParameter("day1");
String day2 = request.getParameter("day2");
String day3 = request.getParameter("day3");
int hour1 = Integer.parseInt(request.getParameter("hour1"));
int minute1 = Integer.parseInt(request.getParameter("minute1"));
int hour2 = Integer.parseInt(request.getParameter("hour2"));
int minute2 = Integer.parseInt(request.getParameter("minute2"));
int hour3 = Integer.parseInt(request.getParameter("hour3"));
int minute3 = Integer.parseInt(request.getParameter("minute3"));

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
if(dayS<0 || (((monthS==1 ||  monthS==3 ||  monthS==5 ||  monthS==7 ||  monthS==8 ||  monthS==10 ||  monthS==12) && dayS >31)
|| ((monthS==4 ||  monthS==6 ||  monthS==9 ||  monthS==11) && dayS >30) || (monthS==2 && dayS>28)))
{
	message+= "Wrong launching date, put a real one <br/>";
}

if(dayE<0 || (((monthE==1 ||  monthE==3 ||  monthE==5 ||  monthE==7 ||  monthE==8 ||  monthE==10 ||  monthE==12) && dayE >31)
|| ((monthE==4 ||  monthE==6 ||  monthE==9 ||  monthE==11) && dayE >30) || (monthE==2 && dayE>28)))
{
	message+= "Wrong ending date, put a real one <br/>";
}
	
if((hour1<0 || hour1>23) || (hour2<0 || hour2>23) || (hour3<0 || hour3>23) || (minute1<0 || minute1>55) || (minute2<0 || minute2>55) || (minute3<0 || minute3>55))
{
	message+= "Invalid schedule<br/>";
}
if(message.equals(""))
{
	listAName actors = new listAName(actorsF,actorsL);
	//request.setAttribute("actors", actors);
	/*request.setAttribute("actorsF", actorsF);
	request.setAttribute("actorsL", actorsL);
	out.println("ok");*/
	//request.getContextpath("RESTProject/rest/sendMovies");
	//response.sendRedirect("NewMovie.jsp");
    RequestDispatcher rd = getServletContext().getRequestDispatcher("/rest/sendMovies");
    rd.forward(request, response);
    /*SendMoviesResource movie = new SendMoviesResource();
    movie.newSendMovie(id,cinema,title,duration,language,directorF,directorL,nbActors,actorsF,actorsL,age,startDate,endDate,day);*/
    
    
}
else 
{
	%>
	    <%session.setAttribute("error", message );%>
	    <%@include file="NewMovie.jsp"%>
	    <%
}
%>