package cz.czechitas.detskahriste.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cz.czechitas.detskahriste.bean.Photo;
import cz.czechitas.detskahriste.dao.PhotoDao;

/**
 * Servlet implementation class DownloadServlet
 */
@WebServlet("/DownloadPhoto")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PhotoDao photoDao = new PhotoDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String idPhoto = request.getParameter("idPhoto");
		if (idPhoto == null) {
			System.out.println("Parametr idPlayground nebyl zadán!");
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		Photo photo = photoDao.loadPhoto(Long.parseLong(idPhoto));
		
		byte[] content = photoDao.loadContent(photo);
		if (content == null) {
			System.out.println("Obrázky s id=" + idPhoto + " nebyl zadán!");
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;			
		}
		
		ServletContext cntx = request.getServletContext();
		String mime = cntx.getMimeType(photo.getNamePhoto());
		if (mime == null) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}

		response.setContentType(mime);
		response.setContentLength(content.length);

		OutputStream out = response.getOutputStream();

		out.write(content);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
