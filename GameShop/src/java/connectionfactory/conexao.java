/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connectionfactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hp
 */
public class conexao {
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/gameshopDB";
    private static final String USER = "root";
    private static final String PASS = "";
    
    public static Connection getConexao(){
        try {    
            Class.forName(DRIVER);
            return DriverManager.getConnection(URL, USER, PASS);
            
        } catch (ClassNotFoundException | SQLException ex) {
            throw new RuntimeException("Erro na conexão: ", ex);
        }
    }
    
    public static void closeConexao(Connection con){
            
            try {
                if(con != null){
                con.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(conexao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    public static void closeConexao(Connection con, PreparedStatement stmt){
              
        closeConexao(con);
            try {

                if(stmt != null){
                stmt.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(conexao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    
    
    public static void closeConexao(Connection con, PreparedStatement stmt, ResultSet rs){
              
        closeConexao(con, stmt);
            try {

                if(rs != null){
                rs.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(conexao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    
    
}
