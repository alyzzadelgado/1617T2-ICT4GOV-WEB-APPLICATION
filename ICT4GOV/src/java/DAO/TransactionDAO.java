/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import classes.Appointment;
import classes.Transaction;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author alydoubleza
 */
public class TransactionDAO {
    
    private Connection connection;
    private DBConnectionFactory factory;
    private Statement statement;
    
    
    public Transaction find(int id){
      
      Transaction t = new Transaction();
      
      try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            
            String query = "select * from transaction where transaction_no = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet result = pstmt.executeQuery();
            if(result.next()){ 
                t.setTransaction_no(id);
                t.setName(result.getString("name"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return t;
   }
    
}