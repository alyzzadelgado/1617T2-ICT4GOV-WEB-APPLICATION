/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import classes.Appointment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author alydoubleza
 */
public class AppointmentDAO {
    
    private Connection connection;
    private DBConnectionFactory factory;
    private Statement statement;
    
    public Appointment book(Appointment app)
    {
        ResultSet result = null;
      int id = 0;
      
        try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            
            String query = "insert into appointment (user_no, user_set, transaction_no, app_date, app_time, app_status, reason) values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            pstmt.setInt(1, app.getUser_no());
            pstmt.setInt(2, app.getUser_set());
            pstmt.setInt(3, app.getTransaction_no());
            pstmt.setString(4, app.getDate());
            pstmt.setString(5, app.getTime());
            pstmt.setString(6, app.getStatus());  
            pstmt.setString(7, app.getReason());
            pstmt.executeUpdate();
            
            result = pstmt.getGeneratedKeys();
            if(result.next()){
              id = result.getInt(1);  //app_no column
            }
            connection.close();
        } catch (Exception e){
            e.printStackTrace();
        }       
        return find(id);
    }
    
    public Appointment find(int id){
      
      Appointment book = new Appointment();
      
      try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            
            String query = "select * from appointment where app_no = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet result = pstmt.executeQuery();
            if(result.next()){ 
                book.setApp_no(id);
                book.setDate(result.getString("app_date"));
                book.setUser_set(result.getInt("user_set"));
                book.setTime(result.getString("app_time"));
                book.setUser_no(result.getInt("user_no"));
                book.setTransaction_no(result.getInt("transaction_no"));
                book.setStatus(result.getString("app_status"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return book;
   }
    
    public void cancel(int id)
    {
        try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            statement = connection.createStatement();
            
            String query = "update appointment set app_status = 'cancelled' where app_no = " + id;
            statement.executeUpdate(query);
            
        } catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public void set(int id)
    {
        try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            statement = connection.createStatement();
            
            String query = "update appointment set app_status = 'set' where app_no = " + id;
            statement.executeUpdate(query);
            
        } catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public void delete(int id)
    {
        
        try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            statement = connection.createStatement();
            
            String query = "delete from appointment where app_no =  " + id;
            statement.executeUpdate(query);

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
}
