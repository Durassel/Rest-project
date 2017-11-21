<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.String"%>
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
 String message;
  Connection connect = DriverManager.getConnection(url, name, password);
  Statement stat = connect.createStatement();
  String loginForm = request.getParameter("loginForm");
  String pwdForm = request.getParameter("pwdForm"); 
  ResultSet rs= stat.executeQuery("SELECT * FROM Clients WHERE ClientName='"+ loginForm + "' AND ClientPassword='"+ pwdForm + "'");
  int ctrl=0;
  while(rs.next())
  {%>
    <%@include file="NewMovie.jsp"%>
    <%
    ctrl=1;
  }
  if(ctrl==0)
  {
    if(loginForm.equals("") || pwdForm.equals(""))
    {
        message="One of the fields is empty!";
    }
    else
    {
        message="Invalid credentials. Please try again.";
    }
    
    %>
    <%session.setAttribute("error", message );%>
    <%@include file="Login.jsp"%>
    <%
}
%>