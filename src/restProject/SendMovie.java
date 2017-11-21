package restProject;

import object.Person;

import java.sql.Date;
import java.util.ArrayList;

import javax.xml.bind.annotation.XmlRootElement;
//la class qui stocke un film diffus�
@XmlRootElement
public class SendMovie {
	private String id;
    private String cinema;
    private String title;
    private String duration;
    private String language;
    private Person director;
    private Person actor;
    private int age;
    private String startDate;
    private String endDate;
    private String day;

    public SendMovie()
    {
    	
    }
    
    public SendMovie (String id, String cinema, String title, String duration, String language, String dFName, String dLName, /*ArrayList<*/String/*>*/ aFName, 
    		/*ArrayList<*/String/*>*/ aLName, int age, String startDate, String endDate, String day){
        this.id = id;
        this.cinema = cinema;
        this.title = title;
        this.duration = duration;
        this.language = language;
        this.director = new Person(dFName,dLName);
        this.actor = new Person (aFName, aLName);
        this.age = age;
        this.startDate = startDate;
        this.endDate = endDate;
        this.day = day;
        
    }
    
    public SendMovie (String id, String cinema, String title, String duration, String language, Person director , /*ArrayList<*/Person/*>*/ actors,
    		int age, String startDate, String endDate, String day){
        this.id = id;
        this.cinema = cinema;
        this.title = title;
        this.duration = duration;
        this.language = language;
        this.director = director;
        this.actor = actors;
        this.age = age;
        this.startDate = startDate;
        this.endDate = endDate;
        this.day = day;
        
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
	public Person getActor() {
		return actor;
	}
	public void setActor(Person actor) {
		this.actor = actor;
	}
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
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public void setTitle(String title) {
        this.title = title;
    }


}