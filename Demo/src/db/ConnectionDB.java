package db;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConnectionDB {
    private static BasicDataSource ds = new BasicDataSource();

    static {
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setUrl(System.getenv("DB_URL") != null ? System.getenv("DB_URL") : "jdbc:mysql://localhost:3306/demoweb?useUnicode=true&characterEncoding=utf-8");
        ds.setUsername(System.getenv("DB_USERNAME") != null ? System.getenv("DB_USERNAME") : "root");
        ds.setPassword(System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : "");
        ds.setMinIdle(1); // minimum number of idle connections in the pool
        ds.setInitialSize(1);
        ds.setMaxIdle(2); // maximum number of idle connections in the pool
        ds.setMaxOpenPreparedStatements(50);
    }

    private ConnectionDB() {
        super();
    }

    public static Connection getConnection() throws SQLException {
        Connection con = ds.getConnection();
        PreparedStatement pst = con.prepareStatement("SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));");
        pst.execute();
        System.out.println("HERE");
        return con;
    }
}
