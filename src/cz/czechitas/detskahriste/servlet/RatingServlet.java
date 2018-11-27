package cz.czechitas.detskahriste.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cz.czechitas.detskahriste.bean.Comment;
import cz.czechitas.detskahriste.bean.Rating;
import cz.czechitas.detskahriste.dao.CommentDao;
import cz.czechitas.detskahriste.dao.RatingDao;

/**
 * Servlet implementation class RatingServlet
 */
@WebServlet("/saveRating")
public class RatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RatingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String vyb = request.getParameter("vyb");	//vyètu parametry z requestu
		Double vyb = Double.parseDouble(request.getParameter("vyb"));
		Double cist = Double.parseDouble(request.getParameter("cist")); 
		Double bezp = Double.parseDouble(request.getParameter("bezp"));
		Double zelen = Double.parseDouble(request.getParameter("zelen"));
		Double zazemi = Double.parseDouble(request.getParameter("zazemi"));
		Long idPlayground = Long.parseLong(request.getParameter("idPlayground"));
		
		Rating rating = new Rating();
		rating.setEnvironment(zelen);
		rating.setEquipment(vyb);
		rating.setRestZone(zazemi);
		rating.setTidiness(cist);
		rating.setSafety(bezp);
		
		RatingDao dao = new RatingDao();
		dao.save(rating, idPlayground);
		
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
