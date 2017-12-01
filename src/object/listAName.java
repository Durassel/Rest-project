package object;

import java.util.List;

import javax.ws.rs.FormParam;

public class listAName {
	private static List<String> fName;
	
	private static List<String> lName;

	
	public listAName(List<String> fName,List<String> lName) {
		this.fName = fName;
		this.lName=lName;
	}
	public listAName() {
		// TODO Auto-generated constructor stub
	}

	public static List<String> getfName() {
		return fName;
	}

	public void setfName(List<String> fName) {
		this.fName = fName;
	}

	public static List<String> getlName() {
		return lName;
	}

	public void setlName(List<String> lName) {
		this.lName = lName;
	}

}
