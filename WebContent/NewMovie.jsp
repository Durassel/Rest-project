<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title>Form to create a new movie</title>
  <link rel="stylesheet" href="movieShow.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 </head>
<body>
<header>
		<h1>Home</h1>
	</header>
	<div class="menu">
		<table>
			<tr>
				<td><a href="Home.jsp" >Home</a></td>
				<td><a href="SelectMovie.jsp">Choose a movie</a></td>
			</tr>
		</table>
	</div>
<%
	    	int nbActor=1;
	    	if(request.getParameter("nbActor") !=null )
	    	{
	    		nbActor=Integer.parseInt(request.getParameter("nbActor"));
	    	}
            String errMessage = (String) session.getAttribute("error");
            if(errMessage != null)
            {
                out.println(errMessage);
            }

            //../RESTProject/rest/sendMovies
        %>
<form action="addController.jsp" method="POST">
<table id="new">
	<tr><td>
    	<label for="cinema">Cinema :</label>
    	<input name="cinema" />
    </td></tr>
    <tr><td>
   		<label for="title">Title :</label>
   		<input name="title" />
    </td></tr>
    <tr><td>
	    <label for="duration">Duration :</label>
	    <input name="duration" />
    </td></tr>
    <tr><td>
	    <label for="Language">Language :</label>
	    <input type="checkbox" name="checklanguage" value="ON" />
	    <input name="language" />
    </td></tr>
    <tr><td>
	    <label for="directorF">Director : <br/> Firstname :</label>
	    <input name="directorF" />
	    
	    <br/>
	    <label for="directorL">Name :</label>
	    <input name="directorL" />
    </td></tr>
    <tr><td>
    <% out.write("<input type='hidden' name='nbActor' value='"+nbActor+"'/>");
    for(int i=1;i<=nbActor;i++)
    {
    	out.write("<label for='actorF"+i+"'>Actor");
    	if(i>1)
    	{
    		out.write(i+"");
        }
    	out.write(" : <br/> Firstname :</label>");
    	out.write(" <input name='actorF"+i+"' /><br/>");
    	out.write("<label for='actorL"+i+"'>Name :</label>");
    	out.write("<input name='actorL"+i+"' /><br/>");
    }	
    %>
    

    </td></tr>
    <tr><td>
    <label for="age">Age : </label>
    	<input type="radio" id="age0" name="age" value="0" checked/>
    	<label for="age0"> none</label>
    	<input type="radio" id="age12" name="age" value="12" />
    	<label for="age12">+12</label>
    	<input type="radio" id="age16" name="age" value="16" />
    	<label for="age16">+16</label>
    	<input type="radio" id="age18" name="age" value="18" />
    	<label for="age18">+18</label>
    	
    </td></tr>
    <tr><td>
	    <label for="startDate">StartDate : </label>
	    <input  name="startDate" />
	    <br/>
	    <label for="endDate">EndDate : </label>
	    <input  name="endDate" />
    </td></tr>
    <tr><td>
	    <label for="day">Day : </label>
	     <select name="day" size="1">
                <option>Monday</option>
                <option>Tuesday</option>
                <option>Wednesday</option>
                <option>Thursday</option>
                <option>Friday</option>
                <option>Saturday</option>
                <option>Sunday</option>
            </select>
            <label>schedule</label>
            <input name="schedule1"/>
    </td>
    <td><label for="day">Day : </label>
	     <select name="day" size="1">
                <option>Monday</option>
                <option>Tuesday</option>
                <option>Wednesday</option>
                <option>Thursday</option>
                <option>Friday</option>
                <option>Saturday</option>
                <option>Sunday</option>
            </select>
            <label>schedule</label>
            <input name="schedule2"/>
    </td>
    <td><label for="day1">Day : </label>
	     <select name="day1" size="1">
                <option>Monday</option>
                <option>Tuesday</option>
                <option>Wednesday</option>
                <option>Thursday</option>
                <option>Friday</option>
                <option>Saturday</option>
                <option>Sunday</option>
            </select>
            <label>schedule</label>
            <input name="schedule3"/>
    </td>
    </tr>
    <tr><td>
    	<input type="submit" value="Submit" />
    </td></tr>
</table>
</form>
 <form action="NewMovie.jsp">
	    	<Label>+</Label>
	    	<% 
	    	out.write("<input type='hidden' name='nbActor' value='"+(++nbActor)+"'/>");
	    	%>
	    	<input type="submit" value="Add an actor"/>
	    </form>
</body>
</html>