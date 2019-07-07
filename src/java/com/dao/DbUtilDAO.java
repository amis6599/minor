
package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbUtilDAO {
     public static Connection conn;
     public static ResultSet rs;
     public static Statement st;
     public static Connection getDbConnection() throws SQLException, ClassNotFoundException{
         Class.forName("com.mysql.jdbc.Driver");
         conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?user=root&password=root");
         st=conn.createStatement();
         return conn;    
     }
     public static ResultSet runSelectQuery(String Query) throws SQLException{
         rs=st.executeQuery(Query);
         return rs;
     }
     public static boolean runDDLQuery(String Query) throws SQLException{
         boolean execute = st.execute(Query);
         return true;   
     }
     public static void closeConnection() throws SQLException
     {
         conn.close();
     }
     
}
