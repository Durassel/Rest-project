<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="movieShow.css" />
<title>Login</title>
</head>
<body>
	<header>
		<h1>Login</h1>
	</header>
	<div class="menu">
		<a href="Home.jsp" >Back</a>
	</div>
	<nav class="login">
        <%
            String errMessage = (String) session.getAttribute("error");
            if(errMessage != null)
            {
                out.println(errMessage);
            }
            
        %>
        
	        <form method="GET" action="controller.jsp">
	            Login : <input type="text" name="loginForm" value="" /><br>
	            Password : <input type="password" name="pwdForm" value="" /><br>
	            <input type="submit" value="accept" />
	        </form>
       </nav>
    </body>
</html>