package cz.czechitas.detskahriste.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import cz.czechitas.detskahriste.bean.Rating;

public class RatingDao extends JdbcDao {
	
	private static final String LOAD ="SELECT * FROM RATING WHERE idFkPlayRating=?"; 
	private static  final String INSERT = "INSERT INTO RATING(equipment, tidiness, safety, environment, restZone, idFkPlayRating) VALUES(?,?,?,?,?,?)";
	
	public void save(Rating rating, Long idPlayground) {
		DataSource ds = getDataSource();
		try (Connection con = ds.getConnection();
				PreparedStatement stmt = con.prepareStatement(INSERT))
		{
			stmt.setDouble(1, rating.getEquipment());
			stmt.setDouble(2, rating.getTidiness());
			stmt.setDouble(3, rating.getSafety());
			stmt.setDouble(4, rating.getEnvironment());
			stmt.setDouble(5, rating.getRestZone());
			stmt.setLong(6, idPlayground);
			stmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();}
		}

	public ArrayList<Rating> load(Long idPlayground) {
		ArrayList<Rating> ratList = new ArrayList<>();
		DataSource ds = getDataSource();
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement(LOAD)) {
			stmt.setLong(1, idPlayground);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Rating rat = new Rating();
				rat.setIdRating(rs.getLong("idRating"));
				rat.setEquipment(rs.getDouble("equipment"));
				rat.setTidiness(rs.getDouble("tidiness"));
				rat.setSafety(rs.getDouble("safety"));
				rat.setEnvironment(rs.getDouble("environment"));
				rat.setRestZone(rs.getDouble("restZone"));
				ratList.add(rat);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ratList;
	}
}
