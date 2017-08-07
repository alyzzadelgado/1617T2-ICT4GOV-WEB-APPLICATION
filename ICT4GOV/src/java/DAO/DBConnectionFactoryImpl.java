/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author alydoubleza
 */
public class DBConnectionFactoryImpl extends DBConnectionFactory {

    @Override
    public Connection getConnection() {
        try{
            Class.forName(getDriver());
            Connection con = DriverManager.getConnection(getUrl(), getUsername(), getPassword());
            
            // theres a red underline underneath InitialContext(); and getDataSourceName();
            
            //Context ctx = new InitialContext();
            //DataSource ds = (DataSource) ctx.lookup(getDataSourceName());
            //Connection con = ds.getConnection();
            
            return con;
        } catch (SQLException ex) {
            Logger.getLogger(DBConnectionFactoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnectionFactoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    
    }
}
