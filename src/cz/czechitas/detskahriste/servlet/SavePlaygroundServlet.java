package cz.czechitas.detskahriste.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cz.czechitas.detskahriste.bean.Location;
import cz.czechitas.detskahriste.bean.Playground;
import cz.czechitas.detskahriste.dao.LocationDao;
import cz.czechitas.detskahriste.dao.PlaygroundDao;

/**
 * Servlet implementation class SavePlaygroundServlet
 */
@WebServlet("/savePlayground")
public class SavePlaygroundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SavePlaygroundServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 String open = request.getParameter("open");
		 String traffic = request.getParameter("traffic");
		 String city = request.getParameter("city");
		 String street = request.getParameter("street");
		 String latitude = request.getParameter("latitude");
		 String longtitude = request.getParameter("longtitude");
		 Playground newPlayground = new Playground();
		 Location newLocation = new Location();
		 newLocation.setCity(city);
		 newLocation.setStreet(street);
		 newLocation.setLatitude(latitude);
		 newLocation.setLongtitude(longtitude);
		 newPlayground.setOpen(open);
		 newPlayground.setTraffic(traffic);
		 newPlayground.setLocation(newLocation);
		 
		 
		 PlaygroundDao daoPg = new PlaygroundDao();
		 Playground playground = daoPg.save(newPlayground);
		 
		 LocationDao loc = new LocationDao();
		 loc.save(newLocation, playground.getIdPlayground());
		 
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	 
		

}
