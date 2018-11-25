
package cz.czechitas.detskahriste.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cz.czechitas.detskahriste.bean.Comment;
import cz.czechitas.detskahriste.dao.CommentDao;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
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

	public void createComment(HttpServletRequest request) {
		String user = request.getParameter("userField");
		String text = request.getParameter("commentField");
		LocalDateTime date = LocalDateTime.now();
		Long idPlayground = Long.valueOf(request.getParameter("idPlayground"));
		
		Comment com = new Comment();
		com.setUser(user);
		com.setText(text);
		com.setDate(date);
		
		CommentDao dao = new CommentDao();
		dao.save(com, idPlayground);
	
	}
	 
}
