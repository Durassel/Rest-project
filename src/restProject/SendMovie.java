package restProject;

import object.ArrayActors;
import object.Day;
import object.Person;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;
//la class qui stocke un film diffusé
@XmlRootElement
public class SendMovie {
	private String id;
    private String cinema;
    private String title;
    private String duration;
    private String language;
    private Person director;
    private ArrayActors actors;
    //private List<Person> actors;
    private int age;
    private String startDate;
    private String endDate;
    private List<Day> show;
    private String poster;
   
    
    public SendMovie()
    {
    	
    }
    public SendMovie (String id, String cinema, String title, String duration, String language, String dFName, String dLName, List<String> aFName, 
    		List<String> aLName, int age, String startDate, String endDate, String day1, String day2, String day3, String schedule1, String schedule2,
    		String schedule3,String poster){
        this.id = id;
        this.cinema = cinema;
        this.title = title;
        this.duration = duration;
        this.language = language;
        this.director = new Person(dFName,dLName);
        
        this.actors = new ArrayActors(aFName,aLName);
        /*this.actors = new ArrayList<Person>();
        for(int i=0;i<aFName.size();i++)
        {
        		this.actors.add(new Person(aFName.get(i),aLName.get(i)));
        }*/
        this.age = age;
        this.startDate = startDate;
        this.endDate = endDate;
        this.show= new ArrayList<Day>();
        this.show.add(new Day(day1,schedule1));
        this.show.add(new Day(day2,schedule3));
        this.show.add(new Day(day3,schedule3));
        this.poster=poster;
    }
    public SendMovie (String id, String cinema, String title, String duration, String language, Person director, ArrayList<Person> actorNames, 
    		 int age, String startDate, String endDate, String day1, String day2, String day3, String schedule1, String schedule2, String schedule3
    		 ,String poster){
        this.id = id;
        this.cinema = cinema;
        this.title = title;
        this.duration = duration;
        this.language = language;
        this.director = director;
        
        this.actors = new ArrayActors(actorNames);
        /*this.actors = new ArrayList<Person>();
        for(Person actorName : actorNames)
        {
        		this.actors.add(actorName);
        }*/
        this.age = age;
        this.startDate = startDate;
        this.endDate = endDate;
        this.show= new ArrayList<Day>();
        this.show.add(new Day(day1,schedule1));
        this.show.add(new Day(day2,schedule3));
        this.show.add(new Day(day3,schedule3));
        this.poster=poster;
    }
   
    public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getCinema() {
        return cinema;
    }
    public void setCinema(String cinema) {
        this.cinema = cinema;
    }
    public String getTitle() {
        return title;
    }
    public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public Person getDirector() {
		return director;
	}
	public void setDirector(Person director) {
		this.director = director;
	}
	public ArrayActors getActors() {
		return actors;
	}
	public void setActors(ArrayActors actor) {
		this.actors= actor;
	}
	/*public List<Person> getActors() {
		return actors;
	}
	public void setActors(List<Person> actors) {
		this.actors = actors;
	}*/
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	

	public List<Day> getShow() {
		return show;
	}
	public void setShow(List<Day> day) {
		this.show = show;
	}
	public void setTitle(String title) {
        this.title = title;
    }


}