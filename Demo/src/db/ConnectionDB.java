package db;

import java.sql.*;

public class ConnectionDB {
    static Connection con;

    public static Statement connect() throws ClassNotFoundException, SQLException {
        if (con == null || con.isClosed()) {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoweb?useUnicode=true&characterEncoding=utf-8", "root", "");
            return con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        } else {
            return con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        }

    }

//    public static void main(String[] args) throws Exception {
//        Statement s = ConnectionDB.connect();
//        ResultSet rs = s.executeQuery("select * from users");
////        int i=rs.
//        rs.last();
//        System.out.println(rs.getRow());
//        rs.beforeFirst();
//        while (rs.next()) {
//            System.out.println(rs.getString(2));
//        }
//    }

}
