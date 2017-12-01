package restProject;

import java.io.IOException;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.UriInfo;
import object.ArrayActors;
import object.Person;
import restProject.LoadMovie;
import restProject.SendMovie;

// Will map the resource to the URL sendMovies
@Path("/sendMovies")
public class SendMoviesResource {

    // Allows to insert contextual objects into the class,
    // e.g. ServletContext, Request, Response, UriInfo
    @Context
    UriInfo uriInfo;
    @Context
    Request request;
    
    // Return the list of sendMovies to the user in the browser
    @GET
    @Produces(MediaType.TEXT_XML)
    public List<SendMovie> getSendMoviesBrowser() {
        List<SendMovie> sendMovies = new ArrayList<SendMovie>();
        sendMovies.addAll(LoadMovie.instance.getModel().values());
        return sendMovies;
    }

    // Return the list of sendMovies for applications
    @GET
    @Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
    public List<SendMovie> getSendMovies() {
        List<SendMovie> sendMovies = new ArrayList<SendMovie>();
        sendMovies.addAll(LoadMovie.instance.getModel().values());
        return sendMovies;
    }

    // returns the number of sendMovies
    // Use http://localhost:8090/restProject/rest/sendMovies/count
    // to get the total number of records
    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String getCount() {
        int count = LoadMovie.instance.getModel().size();
        return String.valueOf(count);
    }

    @POST
    @Produces(MediaType.TEXT_HTML)
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    //@Consumes(MediaType.MULTIPART_FORM_DATA)
    public void newSendMovie(
            @FormParam("cinema") String cinema,
            @FormParam("title") String title,
            @FormParam("duration") String duration,
            @FormParam("language") String language,
            @FormParam("directorF") String directorF,
            @FormParam("directorL") String directorL,
            @FormParam("actorsF") List<String> actorsF,
            @FormParam("actorsL") List<String> actorsL,
            @FormParam("nbActor") int nbActor,
            @FormParam("age") int age,
            @FormParam("dayS") int dayS,
            @FormParam("dayE") int dayE,
            @FormParam("monthS") int monthS,
            @FormParam("monthE") int monthE,
            @FormParam("yearS") int yearS,
            @FormParam("yearE") int yearE,
            @FormParam("day1") String day1,
            @FormParam("day2") String day2,
            @FormParam("day3") String day3,
            @FormParam("hour1") int hour1,
            @FormParam("hour2") int hour2,
            @FormParam("hour3") int hour3,
            @FormParam("minute1") int minute1,
            @FormParam("minute2") int minute2,
            @FormParam("minute3") int minute3,
            @Context HttpServletResponse servletResponse) throws IOException 
    		
    		{
    	/*ArrayList<String> actorsF= new ArrayList<String>();
    	for(FormDataBodyPart actors: actorF)
    	{
    		actorsF.add(actors.getValueAs(String.class));
    	}
    	ArrayList<String> actorsL= new ArrayList<String>();
    	for(FormDataBodyPart actors: actorL)
    	{
    		actorsL.add(actors.getValueAs(String.class));
    	}
    		/*Person actor = new Person("Allan","Keer");
    		ArrayList<String> actorsF= new ArrayList<String>();
    				actorsF.add(actor.getFirstName());
    				ArrayList<String> actorsL= new ArrayList<String>();
    				actorsL.add(actor.getLastName());*/
    	//connexion a la DB pour y ajouter le nouveau film
    	//List<String> actorsF = listAName.getfName();
    	//List<String> actorsL = listAName.getlName();
    	try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	String url ="jdbc:mysql://localhost:3306/dbmovies";
    	String  name= "root";
    	String password = "software";
    	Connection connect;
		try {//on creer un film
			connect = DriverManager.getConnection(url, name, password);
			Statement stat = connect.createStatement();
			ResultSet rs=stat.executeQuery("SELECT idMovies FROM Movies WHERE idMovies=(SELECT MAX(idMovies) FROM Movies)");
			int a=1;
			while(rs.next())
			{
				a=rs.getInt("idMovies")+1;
			}
			
			String id=Integer.toString(a);
			SendMovie sendMovie = new SendMovie(id,cinema, title, duration, language, directorF, directorL, actorsF/*.get(0)*/, actorsL/*.get(0)*/,age , 
					(String)(yearS+"-"+monthS+"-"+dayS),(String)(yearE+"-"+monthE+"-"+dayE), day1,day2,day3, 
					(String)(hour1+":"+minute1), (String)(hour2+":"+minute2), (String)(hour3+":"+minute3) );
	    	LoadMovie.instance.getModel().put(id, sendMovie);
			
			
			//ici on va regarder si le lieu existe déjà ainsi que les differentes personnes
			rs= stat.executeQuery("SELECT * FROM Persons "
											+ "WHERE firstname='"+directorF + "' "
											+ "AND lastname='"+ directorL+"'");
			int ctrl=0;
			
			while(rs.next())
			{
				ctrl=1;
			}
			if(ctrl==0)//si ça n'existe pas
			{
				stat.executeUpdate("INSERT INTO Persons "
									+ "VALUES (null,'"+directorF + "','"+ directorL+"')");
			}
			rs=stat.executeQuery("SELECT idPersons FROM Persons "
					+ "WHERE firstname='"+directorF + "' "
					+ "AND lastname='"+ directorL+"'");
			rs.next();
			int idDirector= rs.getInt("idPersons");//on prend l'ID
			
			
			
			rs= stat.executeQuery("SELECT * FROM Cinemas "
					+ "WHERE cinemaName='"+ cinema + "'");
			ctrl=0;
			while(rs.next())
			{
				ctrl=1;
			}
			if(ctrl==0)
			{
				stat.executeUpdate("INSERT INTO Cinemas VALUES(null,'"+cinema +"')");
			}
			rs= stat.executeQuery("SELECT idCinemas FROM Cinemas WHERE cinemaName='"+ cinema + "'");
			rs.next();
			String startD=yearS+"-"+monthS+"-"+dayS;
			String endD=yearE+"-"+monthE+"-"+dayE;
			int idCinema= rs.getInt("idCinemas");
			//on creer la requete d'ajout puis on l'envoie à la DB
			//String sql1=;
			 stat.executeUpdate("INSERT INTO Movies VALUES(null,'"+title+"','"+duration+"','"+language+"','"+age+"'"
						+ ",'"+startD+"','"+endD+"','"+day1+"','"+day2+"','"+day3+"','"+(String)(hour1+":"+minute1*5)+"','"+(String)(hour2+":"+minute2*5)
						+"','"+(String)(hour3+":"+minute3*5)+"','"+idCinema+"','"+idDirector+"')");
			 rs = stat.executeQuery("SELECT idMovies FROM Movies WHERE idMovies=(SELECT MAX(idMovies) FROM Movies)");
			 rs.next();
			 int idMovie= rs.getInt("idMovies");
			ArrayList<Person> actors = new ArrayList<Person>();
			actors= (ArrayList<Person>) sendMovie.getActors().getActor();
			 for(int i=0; i<actors.size();i++)
				 
				{
				 	ctrl=0;
					rs= stat.executeQuery("SELECT * FROM Persons "
							+ "WHERE firstname='"+actors.get(i).getFirstName() + "' "
							+ "AND lastname='"+ actors.get(i).getLastName()+"'");
					while(rs.next())
					{
						ctrl=1;
					}
					if(ctrl==0)
					{
						stat.executeUpdate("INSERT INTO Persons "
								+ "VALUES (null,'"+actors.get(i).getFirstName() + "','"+ actors.get(i).getLastName()+"')");
					}
					rs=stat.executeQuery("SELECT idPersons FROM Persons WHERE firstname='"+actors.get(i).getFirstName()+"' AND lastname='"+actors.get(i).getLastName()+"'");
					rs.next();
					int idActor = rs.getInt("idPersons");
					stat.executeUpdate("INSERT INTO Castings "
							+ "VALUES (null,'"+idMovie + "','"+ idActor+"')");
					/*rs= stat.executeQuery("SELECT idPersons FROM Persons "
							+ "WHERE firstname='"+actorsF.get(i) + "' "
							+ "AND lastname='"+ actorsL.get(i)+"'");
					rs.next();
					*/
					//int idActor= rs.getInt("idPersons");
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


        //servletResponse.sendRedirect("../NewMovie.jsp"); //refresh de la page
    }

    // Defines that the next path parameter after sendMovies is
    // treated as a parameter and passed to the SendMoviesResources
    // Allows to type http://localhost:8080/com.vogella.jersey.todo/rest/sendMovies/1
    // 1 will be treaded as parameter sendMovie and passed to SebMoviesResource
    //@Path("{sendMovie}")
    @Path("{sendMovie}")
    public SendMovieResource getSendMovie(@PathParam("sendMovie") String id) {
        return new SendMovieResource(uriInfo, request, id);
    }
    @GET
    @Path("cinema/{sendMovie}")
    @Produces(MediaType.TEXT_XML)
    public List<SendMovie> getSendMovieByCinema(@PathParam("sendMovie") String cinema) {
    	 List<SendMovie> sendMovies = new ArrayList<SendMovie>();
         sendMovies.addAll(LoadMovie.instance.getModel().values());
         for(int i=sendMovies.size()-1;i>=0;i--)
         {
        	 if(!sendMovies.get(i).getCinema().equals(cinema))
        	 {
        		 sendMovies.remove(i);
        	 }
         }
         return sendMovies;
    }
    
    private int dayInt(String day)
    {
    	if(day=="Monday")
    	{
    		return 1;
    	}
    	else if(day=="Tuesday")
    	{
    		return 2;
    	}
    	else if(day=="Wednesday")
    	{
    		return 3;
    	}
    	else if(day=="Thursday")
    	{
    		return 4;
    	}
    	else if(day=="Friday")
    	{
    		return 5;
    	}
    	else if(day=="Saturday")
    	{
    		return 6;
    	}
    	else
    	{
    		return 7;
    	}
    }

    
}