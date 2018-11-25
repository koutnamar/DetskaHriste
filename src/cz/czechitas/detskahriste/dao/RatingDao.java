package cz.czechitas.detskahriste.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import cz.czechitas.detskahriste.bean.Rating;

public class RatingDao extends JdbcDao {

	private static final String LOAD = "SELECT AVG(equipment) as avgEquipment, AVG(tidiness) as avgTidiness, "
			+ "AVG(safety) as avgSafety, AVG(environment) as avgEnvironment, AVG(restZone) as avgRestZone "
			+ "FROM rating WHERE idFkPlayRating=?";
	private static final String INSERT = "INSERT INTO rating(equipment, tidiness, safety, "
			+ "environment, restZone, idFkPlayRating) VALUES(?,?,?,?,?,?)";

	public void save(Rating rating, Long idPlayground) {
		DataSource ds = getDataSource();
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement(INSERT)) {
			stmt.setDouble(1, rating.getEquipment());
			stmt.setDouble(2, rating.getTidiness());
			stmt.setDouble(3, rating.getSafety());
			stmt.setDouble(4, rating.getEnvironment());
			stmt.setDouble(5, rating.getRestZone());
			stmt.setLong(6, idPlayground);
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Rating load(Long idPlayground) {
		Rating rat = new Rating();
		DataSource ds = getDataSource();
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement(LOAD)) {
			stmt.setLong(1, idPlayground);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				rat.setEquipment(rs.getDouble("avgEquipment"));
				rat.setTidiness(rs.getDouble("avgTidiness"));
				rat.setSafety(rs.getDouble("avgSafety"));
				rat.setEnvironment(rs.getDouble("avgEnvironment"));
				rat.setRestZone(rs.getDouble("avgRestZone"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rat;
	}
}
