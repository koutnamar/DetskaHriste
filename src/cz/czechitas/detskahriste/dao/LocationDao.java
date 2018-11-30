package cz.czechitas.detskahriste.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import cz.czechitas.detskahriste.bean.Comment;
import cz.czechitas.detskahriste.bean.Location;

public class LocationDao extends JdbcDao {

	private static final String LOAD = "SELECT * FROM location WHERE idFkPlayLoc = ?";
	private static final String LOAD_CITY = "SELECT DISTINCT city AS uniqueCity FROM location";
	private static final String INSERT = "INSERT INTO location(street,city,latitude,longitude,idFkPlayLoc) VALUES (?, ?,?,?,?)";

	public void save(Location location, Long idPlayground) {

		DataSource ds = getDataSource();
		try (Connection con = ds.getConnection(); 
				PreparedStatement stmt = con.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS)) {
			stmt.setString(1, location.getStreet());
			stmt.setString(2, location.getCity());
			stmt.setString(3, location.getLatitude());
			stmt.setString(4, location.getLongitude());
			stmt.setLong(5, idPlayground);
			stmt.executeUpdate();
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
				loc.setLongitude(rs.getString("longitude"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return loc;
	}

	public ArrayList<String> loadCity() {
		ArrayList<String> listCity = new ArrayList<>();

		DataSource ds = getDataSource();
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement(LOAD_CITY)) {
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				String newCity = rs.getString("uniqueCity");
				listCity.add(newCity);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listCity;
	}

}
