<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="javax.ws.rs.core.Form" %>
<%@page import="org.apache.commons.fileupload.FileItem" %>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@page import="java.io.File" %>
<%@page import="javax.servlet.ServletException" %>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<% 
String message = "";
String cinema= "";
String title= "";
String duration= "";
String language= "";
String directorL= "";
String directorF= "";

int age=0;

ArrayList<String> actorsF = new ArrayList<String>();
ArrayList<String> actorsL = new ArrayList<String>();

int monthS=0;
int dayS=0;
int yearS=0;
int monthE=0;
int dayE=0;
int yearE=0;


String day1 = "";
String day2 = "";
String day3= "";
int hour1=0;
int minute1=0;
int hour2=0;
int minute2=0;
int hour3=0;
int minute3=0;

List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);//on prend tout ce qu'il y a dans la form
for (FileItem item : items) {
    if (item.isFormField()){
        String fieldname = item.getFieldName();
        String fieldvalue = item.getString();
        if (fieldname.equals("cinema")) {//puis on stocke dans les variables les résultats
            cinema=fieldvalue;
        } else  if (fieldname.equals("title")) {
            title=fieldvalue;
        }else  if (fieldname.equals("duration")) {
            duration=fieldvalue;
        }else  if (fieldname.equals("language")) {
            language=fieldvalue;
        }else  if (fieldname.equals("directorF")) {
            directorF=fieldvalue;
        }else  if (fieldname.equals("directorL")) {
            directorL=fieldvalue;
        }else  if (fieldname.equals("age")) {
            age=Integer.parseInt(fieldvalue);
        }
        else  if (fieldname.equals("actorsF")) {
            actorsF.add(item.getString());
        } else  if (fieldname.equals("actorsL")) {
        	actorsL.add(item.getString());
        }
        else  if (fieldname.equals("monthS")) {
            monthS=Integer.parseInt(fieldvalue);
        }else  if (fieldname.equals("dayS")) {
            dayS=Integer.parseInt(fieldvalue);
        }else  if (fieldname.equals("yearS")) {
            yearS=Integer.parseInt(fieldvalue);
        }else  if (fieldname.equals("monthE")) {
            monthE=Integer.parseInt(fieldvalue);
        }else  if (fieldname.equals("dayE")) {
            dayE=Integer.parseInt(fieldvalue);
        }else  if (fieldname.equals("yearE")) {
            yearE=Integer.parseInt(fieldvalue);
        }else  if (fieldname.equals("day1")) {
            day1=fieldvalue;
        }else  if (fieldname.equals("day2")) {
            day2=fieldvalue;
        }else  if (fieldname.equals("day3")) {
            day3=fieldvalue;
        } else  if (fieldname.equals("hour1")) {
            hour1=Integer.parseInt(fieldvalue);
        }
        else  if (fieldname.equals("minute1")) {
            minute1=Integer.parseInt(fieldvalue);
        }else  if (fieldname.equals("hour2")) {
            hour2=Integer.parseInt(fieldvalue);
        }
        else  if (fieldname.equals("minute2")) {
            minute2=Integer.parseInt(fieldvalue);
        }else  if (fieldname.equals("hour3")) {
            hour3=Integer.parseInt(fieldvalue);
        }
        else  if (fieldname.equals("minute3")) {
            minute3=Integer.parseInt(fieldvalue);
        }
        
    }
    else{//pour l'image
    	if (item.getName().equals("ActorsL")) {
        	System.out.println("heyzf");
        }
        String name = new File(item.getName()).getName();
        if(!name.isEmpty())
        {
        	System.out.println("name "+name);
            item.write(new File("C:/Users/Administrateur/eclipse-workspace/RESTProject/WebContent/image" + File.separator + name));
        }
        
    }
}


//on check si c'est bon
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
for(int i=0; i<actorsF.size();i++)
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
if(yearS>yearE || (yearS>=yearE && (monthS>monthE || (monthS<=monthE && dayS>dayE))))
{
	message+="The starting date should be before the ending one";
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
if(day1.equals(day2) || day1.equals(day3) || day3.equals(day2))
{
	message+="You should put different days<br/>";
}session.setAttribute("error", message );
if(message.equals(""))
{
	RequestDispatcher rd = getServletContext().getRequestDispatcher("/rest/sendMovies");
    rd.forward(request, response);
} else { %>
	<%session.setAttribute("error", message );
	response.sendRedirect("addMovie.jsp");
} 
 %>
