package cz.czechitas.detskahriste.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import cz.czechitas.detskahriste.bean.Playground;
import cz.czechitas.detskahriste.bean.Rating;

public class PlaygroundDao extends JdbcDao {
	private static final String LOAD = "SELECT * FROM playground WHERE idPlayground = ?"; // naèíst všechny záznamy z
																							// tabulky playground
	private static final String LOAD_ALL = "SELECT * FROM playground";
	private static final String LOAD_ALL_SELECT = "select * from playground, location where playground.idPlayground=location.idFkPlayLoc and location.city like ? and location.street like ?";
	private static final String INSERT = "INSERT INTO playground(open,traffic) VALUES (?,?)";
	private final CommentDao commentDao = new CommentDao();
	private final LocationDao locationDao = new LocationDao();
	private final PhotoDao photoDao = new PhotoDao();
	private final RatingDao ratingDao = new RatingDao();

	public void save(Playground playground) {
		DataSource ds = getDataSource();
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement(INSERT)) {
			stmt.setString(1, playground.getOpen());
			stmt.setString(2, playground.getTraffic());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public Playground load(Long idPlayground) {
		Playground playground = new Playground(); // do toho seznamu uložím, co najdu
		DataSource ds = getDataSource(); // získám pøipojení k DB
		try (Connection con = ds.getConnection(); // pøipojení k DB
				PreparedStatement stmt = con.prepareStatement(LOAD)) // javovská konstrukce, jak se provolává SELECT do
																		// DB
		{
			stmt.setLong(1, idPlayground);
			ResultSet rs = stmt.executeQuery(); // vytáhnou se komentáøe patøící høišti
			if (rs.next()) { // v rs jsou data, která potøebuju nasetovat do svých objektù
				playground.setIdPlayground(rs.getLong("idPlayground"));
				playground.setOpen(rs.getString("open"));
				playground.setTraffic(rs.getString("traffic"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		playground.setRating(ratingDao.load(playground.getIdPlayground()));
		playground.setAverageRating(calculateAverage(playground.getRating()));
		playground.setCommentList(commentDao.load(playground.getIdPlayground()));
		playground.setLocation(locationDao.load(playground.getIdPlayground()));
		playground.setPhotoList(photoDao.load(playground.getIdPlayground()));
		return playground;
	}

	public ArrayList<Playground> loadAll() {
		ArrayList<Playground> list = new ArrayList<Playground>(); // do toho seznamu uložím, co najdu
		DataSource ds = getDataSource(); // získám pøipojení k DB
		try (Connection con = ds.getConnection(); // pøipojení k DB
				PreparedStatement stmt = con.prepareStatement(LOAD_ALL)) // javovská konstrukce, jak se provolává SELECT
																			// do DB
		{
			ResultSet rs = stmt.executeQuery(); // vytáhnou se komentáøe patøící høišti
			while (rs.next()) { // v rs jsou data, která potøebuju nasetovat do svých objektù
				Playground playground = new Playground();
				playground.setIdPlayground(rs.getLong("idPlayground"));
				playground.setOpen(rs.getString("open"));
				playground.setTraffic(rs.getString("traffic"));
				list.add(playground);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		for (Playground playground : list) {
			playground.setRating(ratingDao.load(playground.getIdPlayground()));
			playground.setAverageRating(calculateAverage(playground.getRating()));
			playground.setCommentList(commentDao.load(playground.getIdPlayground()));
			playground.setLocation(locationDao.load(playground.getIdPlayground()));
			playground.setPhotoList(photoDao.load(playground.getIdPlayground()));
		}
		return list;
	}

	public ArrayList<Playground> loadCityStreet(String city, String street ) {
		if (city == null) {
			city = "";
		}
		if (street == null) {
			street = "";
		}
		ArrayList<Playground> list = new ArrayList<Playground>(); 
		DataSource ds = getDataSource(); 
		try (Connection con = ds.getConnection(); 
				PreparedStatement stmt = con.prepareStatement(LOAD_ALL_SELECT)) 
		{
			stmt.setString(1,city+"%");
			stmt.setString(2, street+"%");
			ResultSet rs = stmt.executeQuery(); 
			while (rs.next()) { 
				Playground playground = new Playground();
				playground.setIdPlayground(rs.getLong("idPlayground"));
				playground.setOpen(rs.getString("open"));
				playground.setTraffic(rs.getString("traffic"));
				list.add(playground);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		for (Playground playground : list) {
			playground.setRating(ratingDao.load(playground.getIdPlayground()));
			playground.setAverageRating(calculateAverage(playground.getRating()));
			playground.setCommentList(commentDao.load(playground.getIdPlayground()));
			playground.setLocation(locationDao.load(playground.getIdPlayground()));
			playground.setPhotoList(photoDao.load(playground.getIdPlayground()));
		}
		return list;
	}

	
	private Double calculateAverage(Rating rating) {
		if (rating == null) {
			return 0d;
		}
		Double average = 0d;
		if (rating.getEnvironment() != null) {
			average += rating.getEnvironment();
		}
		if (rating.getEquipment() != null) {
			average += rating.getEquipment();
		}
		if (rating.getRestZone() != null) {
			average += rating.getRestZone();
		}
		if (rating.getSafety() != null) {
			average += rating.getSafety();
		}
		if (rating.getTidiness() != null) {
			average += rating.getTidiness();
		}
		average = average / 5;
		return average;
	}

}
