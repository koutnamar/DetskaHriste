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
	private static final String LOAD = "SELECT * FROM PLAYGROUND WHERE idPlayground = ?"; // na��st v�echny z�znamy z
																							// tabulky playground
	private static final String LOAD_ALL = "SELECT * FROM PLAYGROUND";
	private static final String INSERT = "INSERT INTO PLAYGROUND(open,traffic) VALUES (?,?)";
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
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public Playground load(Long idPlayground) {
		Playground playground = new Playground(); // do toho seznamu ulo��m, co najdu
		DataSource ds = getDataSource(); // z�sk�m p�ipojen� k DB
		try (Connection con = ds.getConnection(); // p�ipojen� k DB
				PreparedStatement stmt = con.prepareStatement(LOAD)) // javovsk� konstrukce, jak se provol�v� SELECT do
																		// DB
		{
			stmt.setLong(1, idPlayground);
			ResultSet rs = stmt.executeQuery(); // vyt�hnou se koment��e pat��c� h�i�ti
			if (rs.next()) { // v rs jsou data, kter� pot�ebuju nasetovat do sv�ch objekt�
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
		ArrayList<Playground> list = new ArrayList<Playground>(); // do toho seznamu ulo��m, co najdu
		DataSource ds = getDataSource(); // z�sk�m p�ipojen� k DB
		try (Connection con = ds.getConnection(); // p�ipojen� k DB
				PreparedStatement stmt = con.prepareStatement(LOAD_ALL)) // javovsk� konstrukce, jak se provol�v� SELECT
																			// do DB
		{
			ResultSet rs = stmt.executeQuery(); // vyt�hnou se koment��e pat��c� h�i�ti
			while (rs.next()) { // v rs jsou data, kter� pot�ebuju nasetovat do sv�ch objekt�
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
		Double average;
		average = rating.getEnvironment() + rating.getEquipment() + rating.getRestZone() + rating.getSafety()
				+ rating.getTidiness() / 5;
		return average;
	}

}
