
package Modelo.dao;

import Modelo.Bean.Produto;
import Modelo.Bean.faleconosco;
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

public class faleconoscoDAO {
    
     public void Create(faleconosco FC){
        Connection con = conexao.getConexao();
        PreparedStatement stmt = null;
        
        try {
            stmt = con.prepareStatement("INSERT INTO faleconosco (usuario, texto) VALUES (?, ?)");
            stmt.setString(1, FC.getUsuario());
            stmt.setString(2, FC.getTexto());

            stmt.executeUpdate();
            System.out.println("Salvo com sucesso");
            
        } catch (SQLException ex) {
            System.out.println(ex);
                 
        }
        finally{
            conexao.closeConexao(con, stmt);
        }
    }
      public List<faleconosco> mensagem() {
        Connection con = conexao.getConexao();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<faleconosco> us = new ArrayList<>();
        try {
            stmt = con.prepareStatement("SELECT * FROM faleconosco INNER JOIN perfil on faleconosco.usuario = perfil.username");
            rs = stmt.executeQuery();

            while (rs.next()) {
                faleconosco fc = new faleconosco();
                fc.setNome(rs.getString("nome"));
                fc.setTexto(rs.getString("texto"));
                fc.setEmail(rs.getString("email"));
                fc.setContacto(rs.getInt("contacto"));
                us.add(fc);
            }

        } catch (SQLException ex) {
            Logger.getLogger(faleconoscoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexao.closeConexao(con, stmt, rs);
        }
        return us;
    }
     
}
