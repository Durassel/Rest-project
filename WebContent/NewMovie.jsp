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
    	out.write("<label for='actorsF'>Actor");
    	if(i>1)
    	{
    		out.write(i+"");
        }
    	out.write(" : <br/> Firstname :</label>");
    	out.write(" <input name='actorsF' /><br/>");
    	out.write("<label for='actorsL'>Name :</label>");
    	out.write("<input name='actorsL' /><br/>");
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
	    <select  name="monthS" size="1">
	    	<%
	    	String monthI="";
	    		for(int i=1;i<13;i++)
	    		{
	    			monthI +="<option value='"+i+"'>"+i+"</option>";
	    		}
	    		out.write(monthI);
	    	%>
	    </select>
	     <select  name="dayS" size="1">
	    	<%
	    	String monthD="";
	    		for(int i=1;i<32;i++)
	    		{
	    			monthD +="<option value='"+i+"'>"+i+"</option>";
	    		}
	    		out.write(monthD);
	    	%>
	    </select>
	     <select  name="yearS" size="1"/>
	    	<%
	    	String monthY="";
	    		for(int i=2017;i<2028;i++)
	    		{
	    			monthY +="<option value='"+i+"'>"+i+"</option>";
	    		}
	    	out.write(monthY);
	    	%>
	    </select>
	    <br/>
	    <label for="endDate">EndDate : </label>
	    <select  name="monthE" size="1">
	    	<%
	    		out.write(monthI);
	    	%>
	    </select>
	     <select  name="dayE" size="1">
	    	<%
	    		out.write(monthD);
	    	%>
	    </select>
	     <select  name="yearE" size="1">
	    	<%
	    		out.write(monthY);
	    	%>
	    </select>
    </td></tr>
    <tr><td>
	    <label for="day1">Day : </label>
	    <select name='day1' size='1'>
		<% String allDay="  "+
                "<option >Monday</option>" +
                "<option >Tuesday</option>" +
                "<option >Wednesday</option>" +
                "<option >Thursday</option>" +
                "<option >Friday</option>" +
                "<option >Saturday</option>" +
                "<option >Sunday</option>";
	    out.write(allDay); %>
	    </select><br>
            <label>schedule</label>
            <select name="hour1" size='1'>
            	<%String h= "";
            	for(int i=0;i<24;i++)
	    		{
	    			h +="<option value='"+i+"'>"+i+"</option>";
	    		}
	    	out.write(h); %>
            </select>
            <label> : </label>
            <select name="minute1" size='1'>
            	<%String m= "";
            	for(int i=0;i<12;i++)
	    		{
	    			m +="<option value='"+i+"'>"+(i*5)+"</option>";
	    		}
	    	out.write(m); %>
            </select>
    </td>
    <td><label for="day2">Day : </label>
    <select name='day2' size='1'>
	     <%out.write(allDay); %>
	     </select><br>
            <label>schedule</label>
            <select name='hour2' size='1'>
            	<%
	    			out.write(h);
            	%>
            </select>
            <label> : </label>
            <select name='minute2' size='1'>
            	<%
            	out.write(m); 
            	%>
            </select>
    </td>
    <td><label for="day3">Day : </label>
    <select name='day3' size='1'>
	     <%out.write(allDay); %>
	     </select><br>
            <label>schedule</label>
            <select name='hour3' size='1'>
            	<%
            	out.write(h); 
            	%>
            </select>
            <label> : </label>
            <select name='minute3' size='1'>
            	<%
            	out.write(m);
            	%>
            </select>
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