/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import classes.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author alydoubleza
 */
public class UserDAO {
    
    private Connection connection;
    private DBConnectionFactory factory;
    
    public User login (User user){
       
        ResultSet result = null;
        int id = 0;
        
        try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            
            String query = "select * from user where username = ? and password = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            result = pstmt.executeQuery();
            
            while(result.next()) {
              id = result.getInt("user_no");
            }
            
            result.close();
            pstmt.close();
            connection.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        
        
        return find(id);
    }
    
    public boolean findTin(String tin) {
      
      User user = null;
      ResultSet result = null;
      
      try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            
            String query = "select * from user where tin_no = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, tin);
            result = pstmt.executeQuery();
            if(result.next()){ 
                user = new User();
                user.setTin_no(result.getString("tin_no"));
            }
            
            result.close();
            pstmt.close();
            connection.close();
            
        } catch(Exception e) {
            e.printStackTrace();
        }
      
      if (user == null)
        return false;
      else
        return true;
   }
    
    public boolean findUsername(String username) {
      
      User user = null;
      ResultSet result = null;
      
      try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            
            String query = "select * from user where username = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, username);
            result = pstmt.executeQuery();
            if(result.next()){ 
                user = new User();
                user.setUsername(result.getString("username"));
            }
            
            result.close();
            pstmt.close();
            connection.close();
            
        } catch(Exception e) {
            e.printStackTrace();
        }
      
      if (user == null)
        return false;
      else
          return true;
   }
    
    public boolean checkPassword(String username, String password) {
      
      String pass="";
      ResultSet result = null;
      
      try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            
            String query = "select password from user where username = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, username);
            result = pstmt.executeQuery();
            if(result.next()){ 
                pass = result.getString("password");
            }
            
            result.close();
            pstmt.close();
            connection.close();
            
        } catch(Exception e) {
            e.printStackTrace();
        }
      
      if (pass == password)
        return true;
      else
        return false;
   }
    
    public boolean checkUsername(String username, String password) {
      
      String user="";
      ResultSet result = null;
      
      try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            
            String query = "select username from user where password = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, password);
            result = pstmt.executeQuery();
            if(result.next()){ 
                user = result.getString("username");
            }
            
            result.close();
            pstmt.close();
            connection.close();
            
        } catch(Exception e) {
            e.printStackTrace();
        }
      
      if (username == user)
        return true;
      else
        return false;
   }
    
    public User find(int id) {
      
      User user = new User();
      ResultSet result = null;
      
      try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            
            String query = "select * from user where user_no = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, id);
            result = pstmt.executeQuery();
            if(result.next()){ 
                user.setUser_no(result.getInt("user_no"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setOfficer_no(result.getInt("officer_no"));
                user.setFirst_name(result.getString("first_name"));
                user.setMiddle_initial(result.getString("middle_initial"));
                user.setLast_name(result.getString("last_name"));
                user.setTin_no(result.getString("tin_no"));
                user.setPhone_no(result.getString("phone_no"));
                user.setAvail_days(result.getString("avail_days"));
                user.setAvail_time(result.getString("avail_time"));
            }
            
            result.close();
            pstmt.close();
            connection.close();
            
        } catch(Exception e) {
            e.printStackTrace();
        }
      
        return user;
   }
    
    public User register(User user)
    {
        ResultSet result = null;
        int id = 0;
        try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            
            String query = "insert into user (username, password, officer_no, first_name, middle_initial, last_name, tin_no, phone_no, avail_days, avail_time)"
                    + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement pstmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setInt(3, 3);
            pstmt.setString(4, user.getFirst_name());
            pstmt.setString(5, user.getMiddle_initial());
            pstmt.setString(6, user.getLast_name());
            pstmt.setString(7, user.getTin_no());
            pstmt.setString(8, user.getPhone_no());
            pstmt.setString(9, user.getAvail_days());
            pstmt.setString(10, user.getAvail_time());
            pstmt.executeUpdate();
            
            result = pstmt.getGeneratedKeys();
            if(result.next()){
              id = result.getInt(1);  // gets user id
            }
            connection.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
        return this.find(id);
    }
    
    public void editAccount(User user)
    {
        try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            Statement statement = connection.createStatement();
                
            String query = "update user set username = '"+user.getUsername()+"', password = '"+user.getPassword()+"', phone_no = '"+user.getPhone_no()+"', avail_days = '"+user.getAvail_days()+"', avail_time = '"+user.getAvail_time()+ "' where user_no = "+user.getUser_no()+"";
            
            statement.executeUpdate(query);
            statement.close();
            connection.close();
            //return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        //return false;
    }
    
    public void setOfficer(int user_no, int officer_no)
    {
        try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            Statement statement = connection.createStatement();
                
            String query = "update user set officer_no = "+officer_no+" where user_no = "+user_no+"";
            
            statement.executeUpdate(query);
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
