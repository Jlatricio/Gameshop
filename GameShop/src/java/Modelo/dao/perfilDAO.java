
package Modelo.dao;

import Modelo.Bean.Produto;
import Modelo.Bean.Usuario;
import Modelo.Bean.perfil;
import connectionfactory.conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class perfilDAO {
     public void Create(perfil P){
        Connection con = conexao.getConexao();
        PreparedStatement stmt = null;
        
        try {
            stmt = con.prepareStatement("INSERT INTO perfil (nome, username, bilhete, senha, tipo, email, contacto) VALUES ( ?, ?, ?, ?, ?, ?, ?)");
            stmt.setString(1, P.getNome());
            stmt.setString(2, P.getUsername());
            stmt.setString(3, P.getBilhete());
            stmt.setString(4, P.getSenha());
            stmt.setString(5, "usuario");
            stmt.setString(6, P.getEmail());
            stmt.setInt(7, P.getContacto());

            stmt.executeUpdate();
            System.out.println("Salvo com sucesso");
            
        } catch (SQLException ex) {
            System.out.println(ex);
                 
        }
        finally{
            conexao.closeConexao(con, stmt);
        }
    }
    
      public boolean checkinLogin(String nomeUsuario, String senhaUsuario ){
         Connection con = conexao.getConexao();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            stmt = con.prepareStatement("SELECT * FROM perfil WHERE username = ? and senha = ?");
            stmt.setString(1, nomeUsuario);
            stmt.setString(2, senhaUsuario);
            
            rs = stmt.executeQuery();
           
            
            if (rs.next()) {                
               check = true;
                
            }
        }
            catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            conexao.closeConexao(con, stmt, rs);
        }
        return check;
    }
         public boolean checknivel(String nivel){
         Connection con = conexao.getConexao();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            stmt = con.prepareStatement("SELECT * FROM perfil WHERE tipo = ? ");
            stmt.setString(1, nivel);
            rs = stmt.executeQuery();
           
            
            if (rs.next()) {                
               check = true;
                
            }
        }
            catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            conexao.closeConexao(con, stmt, rs);
        }
        return check;
    }
      
      public List<perfil> usuario() {
        Connection con = conexao.getConexao();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<perfil> us = new ArrayList<>();
        try {
            stmt = con.prepareStatement("SELECT * FROM perfil WHERE tipo = ?");
            stmt.setString(1, "usuario");
            rs = stmt.executeQuery();

            while (rs.next()) {
                perfil p = new perfil();
                p.setIdperfil(rs.getInt("idPerfil"));
                p.setNome(rs.getString("nome"));
                p.setBilhete(rs.getString("bilhete"));
                p.setContacto(rs.getInt("contacto"));
                p.setEmail(rs.getString("email"));
                us.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexao.closeConexao(con, stmt, rs);
        }
        return us;
    }
      public List<perfil> nivel(String user) {
        Connection con = conexao.getConexao();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<perfil> us = new ArrayList<>();
        try {
            stmt = con.prepareStatement("SELECT * FROM perfil WHERE username = ?");
            stmt.setString(1, user);
            rs = stmt.executeQuery();

            while (rs.next()) {
                perfil p = new perfil();
                p.setTipo(rs.getString("tipo"));
                us.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexao.closeConexao(con, stmt, rs);
        }
        return us;
    }
      
        public void Delete(perfil P){
        Connection con = conexao.getConexao();
        PreparedStatement stmt = null;
        
        try {
            stmt = con.prepareStatement("DELETE FROM perfil WHERE idPerfil = ?");
            stmt.setInt(1, P.getIdperfil());
          
            
            stmt.executeUpdate();
            System.out.println("Usuário apagado");
            
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex);
                 
        }
        finally{
            conexao.closeConexao(con, stmt);
        }
    }
    
}
