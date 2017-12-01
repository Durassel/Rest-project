package object;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.FormParam;

public class ArrayActors {
	private List<Person> actors = new ArrayList<Person>();

	
	public ArrayActors() {
		
	}
	
	public ArrayActors(ArrayList<Person> actors) {
		super();
		this.actors = actors;
	}
	public ArrayActors(List<String> fName,List<String> lName) {
		super();
		for(int i=0;i<fName.size();i++)
		{
			this.actors.add(new Person(fName.get(i),lName.get(i)));
		}
		
	}

	public List<Person> getActor() {
		return actors;
	}

	public void setActor(List<Person> actors) {
		this.actors = actors;
	}
}
