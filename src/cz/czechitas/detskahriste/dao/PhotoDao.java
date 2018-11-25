package cz.czechitas.detskahriste.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import cz.czechitas.detskahriste.bean.Photo;

public class PhotoDao extends JdbcDao {

	private static final String LOAD_CONTENT = "select CONTENT from PHOTO where idPhoto=?";
	private static final String LOAD = "select idPhoto, namePhoto from PHOTO WHERE idFkPlayPhoto = ?";
	private static final String INSERT = "insert into PHOTO(namePhoto,idFkPlayPhoto, CONTENT) values ( ?, ?,?)";

	public void save(Photo photo, Long idPlayground, InputStream is) {
		DataSource ds = getDataSource();
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement("INSERT")) {
			stmt.setString(1, photo.getNamePhoto());
			stmt.setLong(2, idPlayground);
			stmt.setBinaryStream(3, is);

			stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<Photo> load(Long idPlayground) {
		List<Photo> photos = new ArrayList<Photo>();

		DataSource ds = getDataSource();
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement("LOAD")) {
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Photo photo = new Photo();
				photo.setIdPhoto(rs.getLong("idPhoto"));
				photo.setNamePhoto(rs.getString("namePhoto"));
				photos.add(photo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return photos;
	}

	public byte[] loadContent(Photo photo) {
		byte[] content = null;

		System.out.println("Get image content for id=" + photo.getIdPhoto());
		DataSource ds = getDataSource();
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement("LOAD_CONTENT")) {
			stmt.setLong(1, photo.getIdPhoto());

			ResultSet rs = stmt.executeQuery();
			rs.next();

			content = rs.getBinaryStream("CONTENT").readAllBytes();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return content;
	}

}
