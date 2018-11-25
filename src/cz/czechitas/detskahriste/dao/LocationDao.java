package cz.czechitas.detskahriste.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import cz.czechitas.detskahriste.bean.Location;

public class LocationDao extends JdbcDao {

	private static final String LOAD = "SELECT * FROM LOCATION WHERE idFkPlayLoc = ?";
	private static final String INSERT = "INSERT INTO LOCATION(street,city,latitude,longtitude,idFkPlayLoc) VALUES (?, ?,?,?,?)";

	public void save(Location location, Long idPlayground) {

		DataSource ds = getDataSource();
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement(INSERT)) {
			stmt.setString(1, location.getStreet());
			stmt.setString(2, location.getCity());
			stmt.setString(3, location.getLatitude());
			stmt.setString(4, location.getLongtitude());
			stmt.setLong(5, idPlayground);
			stmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Location load(Long idPlayground) {
		Location loc = new Location();
		DataSource ds = getDataSource();
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement(LOAD)) {
			stmt.setLong(1, idPlayground);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				loc.setStreet(rs.getString("street"));
				loc.setCity(rs.getString("city"));
				loc.setLatitude(rs.getString("latitude"));
				loc.setLongtitude(rs.getString("longtitude"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return loc; 
	}

}
