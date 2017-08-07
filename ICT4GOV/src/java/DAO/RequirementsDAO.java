/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import classes.Requirements;
import classes.Transaction;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author alydoubleza
 */
public class RequirementsDAO {
    
    private Connection connection;
    private DBConnectionFactory factory;
    private Statement statement;
    
    
    public Requirements find(int id){
      
      Requirements r = new Requirements();
      String req;
      ArrayList<String> reqs = new ArrayList<>();
      
      try {
            factory = DBConnectionFactory.getInstance();
            connection = factory.getConnection();
            
            String query = "select * from requirements where transaction_no = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet result = pstmt.executeQuery();
            while(result.next()){ 
                reqs.add(result.getString("name"));
            }
            
            r.setReqList(reqs);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return r;
   }
    
}
