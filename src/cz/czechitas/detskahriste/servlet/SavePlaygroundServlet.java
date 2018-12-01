package cz.czechitas.detskahriste.servlet;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import cz.czechitas.detskahriste.bean.Comment;
import cz.czechitas.detskahriste.bean.Location;
import cz.czechitas.detskahriste.bean.Photo;
import cz.czechitas.detskahriste.bean.Playground;
import cz.czechitas.detskahriste.dao.CommentDao;
import cz.czechitas.detskahriste.dao.LocationDao;
import cz.czechitas.detskahriste.dao.PhotoDao;
import cz.czechitas.detskahriste.dao.PlaygroundDao;

/**
 * Servlet implementation class SavePlaygroundServlet
 */
@WebServlet("/savePlayground")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if ("newZone".equals(action)) {

			String open = request.getParameter("open");
			String traffic = request.getParameter("traffic");
			String city = request.getParameter("city");
			String street = request.getParameter("street");
			String latitude = request.getParameter("latitude");
			String longitude = request.getParameter("longitude");
			Playground newPlayground = new Playground();
			Location newLocation = new Location();
			newLocation.setCity(city);
			newLocation.setStreet(street);
			newLocation.setLatitude(latitude);
			newLocation.setLongitude(longitude);
			newPlayground.setOpen(open);
			newPlayground.setTraffic(traffic);
			newPlayground.setLocation(newLocation);

			PlaygroundDao daoPg = new PlaygroundDao();
			Playground playground = daoPg.save(newPlayground);

			LocationDao loc = new LocationDao();
			loc.save(newLocation, playground.getIdPlayground());

			///////////
			Photo photoMain = new Photo();
			Photo photoNext1 = new Photo();
			Photo photoNext2 = new Photo();

			PhotoDao photoDao = new PhotoDao();
			// Main
			Part part = request.getPart("imageMain");
			photoMain.setNamePhoto(getFileName(part));

			photoDao.save(photoMain, playground.getIdPlayground(), part.getInputStream());

			// Next 1
			part = request.getPart("imageNext1");
			photoNext1.setNamePhoto(getFileName(part));

			photoDao.save(photoNext1, playground.getIdPlayground(), part.getInputStream());

			// Next 2
			part = request.getPart("imageNext2");
			photoNext2.setNamePhoto(getFileName(part));

			photoDao.save(photoNext2, playground.getIdPlayground(), part.getInputStream());
			// response.getWriter().append("Served at: ").append(request.getContextPath());
		}
		
		// request.setAttribute("list", PlaygroundDao.loadAll()); //chci naèíst celý seznam i s novým høištìm a pøedat na index 
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private String getFileName(Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename"))
				return content.substring(content.indexOf("=") + 2, content.length() - 1);
		}
		return "image.jpg";
	}

}
