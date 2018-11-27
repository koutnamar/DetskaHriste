package cz.czechitas.detskahriste.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import cz.czechitas.detskahriste.bean.Comment;

public class CommentDao extends JdbcDao {
	private static final String LOAD = "SELECT * FROM comment WHERE idFkPlayCom = ? order by date desc"; //naèíst všechny záznamy z tabulky comment
	private static final String INSERT = "INSERT INTO comment(user,text,date,idFkPlayCom) VALUES (?,?,?,?)";

	public void save(Comment comment, Long idPlayground) {
		DataSource ds = getDataSource();
		try (Connection con = ds.getConnection();
			PreparedStatement stmt = con.prepareStatement(INSERT))
		{
			stmt.setString(1, comment.getUser());
			stmt.setString(2, comment.getText());
			stmt.setTimestamp(3, java.sql.Timestamp.valueOf(comment.getDate()));
			stmt.setLong(4, idPlayground);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}	

	}

	public ArrayList<Comment> load(Long idPlayground) {
		ArrayList<Comment> list = new ArrayList<>(); //do toho seznamu uložím, co najdu
		DataSource ds = getDataSource(); //získám pøipojení k DB
		try (Connection con = ds.getConnection(); //pøipojení k DB
			PreparedStatement stmt = con.prepareStatement(LOAD))//javovská konstrukce, jak se provolává SELECT do DB
		{
			stmt.setLong(1, idPlayground);
			ResultSet rs = stmt.executeQuery();	//vytáhnou se komentáøe patøící høišti
			while (rs.next()) { //v rs jsou data, která potøebuju nasetovat do svých objektù
				Comment com = new Comment();
				com.setIdComment(rs.getLong("idComment"));
				com.setUser(rs.getString("user"));
				com.setText(rs.getString("text"));
				com.setDate(rs.getTimestamp("date").toLocalDateTime());
				list.add(com);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
