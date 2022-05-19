package com.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/*
   Druid连接池的工具类
 */
public class JDBCUtils {
    private static DataSource ds;

    static {
        try {
            Properties pro = new Properties();
            pro.load(JDBCUtils.class.getClassLoader().getResourceAsStream("druid.properties"));
            ds = DruidDataSourceFactory.createDataSource(pro);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return ds.getConnection();
    }

    public static void close(Statement st, Connection con) {

        close(null, st, con);
    }

    public static void close(ResultSet rs, Statement st, Connection con) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            rs = null;
        }
        if (st != null) {
            try {
                st.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            st = null;
        }
        if (con != null) {
            try {
                con.close();  //归还连接
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            con = null;
        }
    }

    //获取连接池
    public static DataSource getDataSource() {
       return ds;
    }

}
