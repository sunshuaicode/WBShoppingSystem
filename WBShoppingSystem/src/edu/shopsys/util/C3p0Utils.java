package edu.shopsys.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3p0Utils {
	private static DataSource dataSource = null;

    static{
           //dataSource资源只能初始化一次
           dataSource= new ComboPooledDataSource("mvcApp");
    }
    //获取数据源
  	public static DataSource getDS() {
  		return dataSource;
  	}
    //释放链接
    public static void releaseConnection(Connection connection){

           try {

                  if(connection != null ) {

                         connection.close();

                  }

           }catch (Exception e) {

                  e.printStackTrace();

           }

    }
    //获取链接
    public static Connection getConnection() throws SQLException{

           return dataSource.getConnection();
    }
    
 // 关闭资源
 	public static void closeResource(Connection conn, Statement stm, ResultSet rs) {
 		if (null != rs) {
 			try {
 				rs.close();
 			} catch (SQLException e) {
 				e.printStackTrace();
 			}
 		}
 		if (null != stm) {
 			try {
 				stm.close();
 			} catch (SQLException e) {
 				e.printStackTrace();
 			}
 		}

 		if (null != conn) {
 			try {
 				conn.close();
 			} catch (SQLException e) {
 				e.printStackTrace();
 			}
 		}
 	}

 }