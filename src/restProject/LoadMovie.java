package restProject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import object.Person;
import restProject.SendMovie;

public enum LoadMovie {//c'est ici qu'on va charger les données de la DB
    instance;
	Connection connect;
	Statement stat;
    private Map<String, SendMovie> contentProvider = new HashMap<>();//ici tout les films sont stocké hors DB

    private LoadMovie() {
    	try {//on se connecte
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	String url ="jdbc:mysql://localhost:3306/moviesdb";
    	String  name= "root";
    	String password = "software";
		try {
			this.connect = DriverManager.getConnection(url, name, password);
			this.stat = this.connect.createStatement();
			ResultSet rs= stat.executeQuery("SELECT idMovies,CinemaName,title,duration,language,director.firstname,director.lastname,"
					+ "age,startDate,endDate,day " + 
					"FROM MOVIES " + 
					"INNER JOIN Persons AS director ON Movies.idDirector=director.idPersons " + 
					"INNER JOIN Cinemas ON Movies.idCinema = Cinemas.idCinemas ");
			  while(rs.next())
			  {
				  Statement stat1 = this.connect.createStatement();
				  ResultSet res= stat1.executeQuery("SELECT firstname, lastname FROM Castings "
				  		+ "INNER JOIN Persons ON Castings.idActor = Persons.idPersons "
				  		+ "WHERE idMovie='"+rs.getInt("idMovies")+"'");
				  ArrayList<Person> actor = new ArrayList<Person>();
				  while(res.next())
				  {
					  actor.add(new Person(res.getString("firstname"),res.getString("lastname")));
				  }
				  //on met tout dans la map
				  /*this.contentProvider.put(rs.getString("idMovies"), new SendMovie(rs.getString("idMovies"),rs.getString("CinemaName"),rs.getString("title"),
					rs.getString("duration"),rs.getString("language"),new Person(rs.getString("director.firstname"),rs.getString("director.lastname")),
					new Person(rs.getString("actor.firstname"),
					rs.getString("actor.lastname")),rs.getInt("age"),rs.getString("startDate"),rs.getString("endDate"),rs.getString("day")));*/
				  
				  
				  this.contentProvider.put(rs.getString("idMovies"), new SendMovie(rs.getString("idMovies"),rs.getString("CinemaName"),rs.getString("title"),
							rs.getString("duration"),rs.getString("language"),new Person(rs.getString("director.firstname"),rs.getString("director.lastname")),
							actor,rs.getInt("age"),rs.getString("startDate"),rs.getString("endDate"),rs.getString("day")));
			  }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	

    	/*SendMovie sendMovie = new SendMovie("1", "mk2", "Star Wars VIII", "2h02", "VOSTFR", "Rian", "Jhonson", "Mark", "Hamill",12, "2017-12-13", "2017-12-23", "Mercredi");
        this.contentProvider.put("1", sendMovie);
        /*SendMovie sendMovie1 = new SendMovie("2", "mk2", "Star Wars VIII", "2h02", "VOSTFR", "Rian", "Jhonson", "Mark", "Hamill",12, new Date(2017,12,13), new Date(2017-1900,12,23), "Mercredi");
        this.contentProvider.put("2", sendMovie);*/
        

    }
    public Map<String, SendMovie> getModel(){
        return this.contentProvider;
    }
    
    public ArrayList<String> getCinemas()
    {
    	ArrayList<String> cinemas = new ArrayList<String>();
    	try {
			ResultSet res= stat.executeQuery("SELECT * FROM Cinemas");
			
			while(res.next())
			{
				cinemas.add(res.getString("cinemaName"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	
    	return cinemas;
    }
    
    /*public ArrayList<SendMovie> getMovies()
    {
    	ArrayList<SendMovie> movies= new ArrayList<SendMovie>();
    	try {
			ResultSet res= stat.executeQuery("SELECT * FROM Cinemas");
			
			while(res.next())
			{
				cinemas.add(res.getString("cinemaName"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return movies;
    }*/
}