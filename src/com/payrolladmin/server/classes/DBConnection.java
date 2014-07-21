/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payrolladmin.server.classes;

import java.sql.*;
//import com.mysql.jdbc.*;
/**
 *
 * @author mahder
 */
public class DBConnection {

    private static Connection con;
    private static Statement stmt;
    private static ResultSet rSet;
    private static final String DATABASE_DRIVER = "com.mysql.jdbc.Driver";
    private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/db_empadmin_sandford";
    private static boolean connected;

    public DBConnection() {
        
    }

    private static void connect() throws Exception {
        Class.forName(DATABASE_DRIVER).newInstance();
        con = DriverManager.getConnection(DATABASE_URL, "root", "");
        if(con != null){
        		stmt = con.createStatement();
        		connected = true;
        }else{
        		connected = false;
        }
    }

    public static Connection getDatabaseConnection() throws Exception
    {
        connect();
        Connection connection = getCon();
        return connection;
    }

    

    public static void disconnectDatabase() {
        try {
            stmt.close();
            con.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } 
    }

    public static ResultSet readFromDatabase(String query) {
        try {
            connect();
            if(isConnected()){
            		rSet = stmt.executeQuery(query);
            }else{
            		System.out.println("MySQL is not running!");
            }
        } catch (Exception sqle) {
            sqle.printStackTrace();
        } 
        return rSet;
    }

    public static boolean isConnected() {
        return connected;
    }

    public static void writeToDatabase(String command) {
        try {
            connect();
            if(isConnected()){
            		int count = stmt.executeUpdate(command);
            }else{
            		System.out.println("MySQL is not running!");
            }
        } catch (Exception sqle) {
            sqle.printStackTrace();
        }
    }
    
    public static void writeToDatabase(PreparedStatement preparedStatement){
    		try{
    			preparedStatement.executeUpdate();
    		}catch(Exception e){
    			e.printStackTrace();
    		}
    }
    
    public static PreparedStatement getPreparedStatement(String sqlString){
    		PreparedStatement preparedStatement = null;
    		try{
    			connect();
    			preparedStatement = getCon().prepareStatement(sqlString);
    		}catch(Exception e){
    			e.printStackTrace();
    		}
    		return preparedStatement;
    }

    public static Connection getCon() {
        return con;
    }

    public static void setCon(Connection con) {
        DBConnection.con = con;
    }

    
}//end class

