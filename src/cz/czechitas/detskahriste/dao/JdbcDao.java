package cz.czechitas.detskahriste.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcDao {
	
	protected DataSource getDataSource() {
		try {
			Context ctx = new InitialContext();
			return (DataSource)ctx.lookup("java:/comp/env/jdbc/detskahristeDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
