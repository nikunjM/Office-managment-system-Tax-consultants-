package com.bhanu.helperss;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.swing.JOptionPane;


/*This code connects to the mysql database*/
public class ConnectionHelper 
{
    public Connection con = null;
    public Statement statement= null;
    public String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    public String username = "root",password = "xlx@123";
    static String dbname = "jdbc:mysql://localhost:3307/bhanusoft";

    public Connection connect() 
    {
        try {
        	System.out.println("Before Try");
            Class.forName(JDBC_DRIVER);
            System.out.println("2222222222222222");
            con = DriverManager.getConnection(dbname,username,password);
            System.out.println("3333333333333333");
            return con;
            /*
            statement= con.createStatement();
            System.out.println ("Database connection established");
            System.out.println("capturing from database");
            ResultSet rs=statement.executeQuery(sql);
            while (rs.next())
             {
                dbtime = rs.getString(2);
                System.out.println(dbtime);
            }
            */
        }
        catch (Exception e) {
            JOptionPane.showMessageDialog(null,"not connected"+e.getMessage());
        }
		return con;
    }	
		/*
    public static void main( String args[] ) throws SQLException
    {
    	ConnectionHelper conn=new ConnectionHelper("root","xlx@123");
        Connection con= conn.Connect();
        Statement statement= con.createStatement();
        String sql="SELECT * FROM loginlog WHERE LL_userId='nikunj'";
        String dbtime;
        System.out.println ("Database connection established");
        System.out.println("capturing from database");
        ResultSet rs=statement.executeQuery(sql);
        while (rs.next()) {
            dbtime = rs.getString(2);
            System.out.println(dbtime);
    }
    }*/
    }
