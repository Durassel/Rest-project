package restProject;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.lang.String;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

/**
 * Servlet implementation class newController
 */
@WebServlet("/newController")
public class newController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

		try {//on se connecte
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String url ="jdbc:mysql://localhost:3306/moviesdb";
		String  name= "root";
		String password = "software";
		String message = "";
		Connection connect = DriverManager.getConnection(url, name, password);
		Statement stat = connect.createStatement();
		String cinema =  request.getParameter("cinema");
		String title = request.getParameter("title");
		String duration = request.getParameter("duration");
		String language = request.getParameter("language");
		String directorL = request.getParameter("directorL");
		String directorF = request.getParameter("directorF");
		int age = Integer.parseInt(request.getParameter("age"));
		int nbActors = Integer.parseInt(request.getParameter("nbActor"));
		ArrayList<String> actorsF = new ArrayList<String>();
		ArrayList<String> actorsL = new ArrayList<String>();
		
		for(int i=1; i<= nbActors; i++)
		{
			actorsF.add(request.getParameter("actorF"+i));
			actorsL.add(request.getParameter("actorL"+i));
		}
		String actorF = request.getParameter("actorF1");
		String actorL = request.getParameter("actorL1");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String day = request.getParameter("day");
		
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
		for(int i=0; i<nbActors;i++)
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
		if(startDate.equals(""))
		{
			message+= "Invalid date<br/>";
		}
		if(endDate.equals(""))
		{
			message+= "Invalid date";
		}
		if(message.equals(""))
		{
			request.setAttribute("actorsF", actorsF);
			request.setAttribute("actorsL", actorsL);
			//request.getContextpath("RESTProject/rest/sendMovies");
			//response.sendRedirect("NewMovie.jsp");
		    //RequestDispatcher rd = getServletContext().getRequestDispatcher("/rest/sendMovies");
		    //rd.forward(request, response);
		    SendMoviesResource movie = new SendMoviesResource();
		    movie.newSendMovie(cinema,title,duration,language,directorF,directorL,nbActors,actorsF,actorsL,age,startDate,endDate,day);
		    message = "succes";
		    request.setAttribute("error", message );
            //out.println(message);
            request.getRequestDispatcher("NewMovie.jsp").forward(request, response);
		    
		}
		else 
		{
			 request.setAttribute("error", message );
             //out.println(message);
             request.getRequestDispatcher("NewMovie.jsp").forward(request, response);
		}
    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
