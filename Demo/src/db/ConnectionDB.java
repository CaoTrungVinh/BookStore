package db;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.apache.tomcat.jdbc.pool.PoolProperties;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConnectionDB {
    private static DataSource datasource = new DataSource();

    static {
        PoolProperties p = new PoolProperties();
        p.setUrl(System.getenv("DB_URL") != null ? System.getenv("DB_URL") : "jdbc:mysql://localhost:3306/demoweb?useUnicode=true&characterEncoding=utf-8");
        p.setDriverClassName("com.mysql.cj.jdbc.Driver");
        p.setUsername(System.getenv("DB_USERNAME") != null ? System.getenv("DB_USERNAME") : "root");
        p.setPassword(System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : "");
        p.setJmxEnabled(true);
        p.setTestWhileIdle(false);
        p.setTestOnBorrow(true);
        p.setValidationInterval(30000);
        p.setTimeBetweenEvictionRunsMillis(30000);
        p.setMaxActive(10); //Server online support tối đa 10 kết nối
        p.setMaxIdle(10);
        p.setInitialSize(3);
        p.setRemoveAbandonedTimeout(8); //Thời gian tối đa cho 1 query tính theo giây
        p.setMinEvictableIdleTimeMillis(30000);
        p.setMinIdle(3);
        p.setRemoveAbandoned(true);
        p.setJdbcInterceptors(
                "org.apache.tomcat.jdbc.pool.interceptor.ConnectionState;" +
                        "org.apache.tomcat.jdbc.pool.interceptor.StatementFinalizer");
        datasource.setPoolProperties(p);
    }

    private ConnectionDB() {
        super();
    }

    public static Connection getConnection() throws SQLException {
        Connection con = datasource.getConnection();
        PreparedStatement pst = con.prepareStatement("SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));");
        pst.execute();
        return con;
    }
}
