package dao;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbConnection {
	
	public static Connection createDatabaseConnection()
			throws ClassNotFoundException, SQLException, NamingException {
		Context initContext = null;
		Context envContext = null;
		Connection conn = null;
		DataSource ds = null;
		initContext = new InitialContext();
		envContext = (Context) initContext.lookup("java:/comp/env");
		ds = (DataSource) envContext.lookup("jdbc/MYSQLDB");
		conn = ds.getConnection();

		return conn;
	}

}
