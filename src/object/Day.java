package object;

public class Day {
	private String day;
	private String schedule;
	
	public Day() {
		
	}
	public Day(String day,String schedule) {
		this.day=day;
		this.schedule=schedule;
	}

	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	
}
