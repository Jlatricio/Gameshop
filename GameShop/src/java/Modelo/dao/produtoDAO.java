package Modelo.dao;

import Modelo.Bean.Produto;
import connectionfactory.conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class produtoDAO {

    public void novojogo(Produto P) {
        Connection con = conexao.getConexao();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("INSERT INTO produto (usuario, nomeProduto, preco, categoria, estado, descricao, quantidade, plataforma) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            stmt.setString(1, P.getUsername());
            stmt.setString(2, P.getNome());
            stmt.setString(3, P.getPreco());
            stmt.setString(4, P.getCategoria());
            stmt.setString(5, P.getEstado());
            stmt.setString(6, P.getDescricao());
            stmt.setInt(7, P.getQuantidade());
            stmt.setString(8, P.getPlataforma());

            stmt.executeUpdate();
            System.out.println("Salvo com sucesso");

        } catch (SQLException ex) {
            System.out.println(ex);

        } finally {
            conexao.closeConexao(con, stmt);
        }
    }

    public int PegarLastId() {
        Connection con = conexao.getConexao();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            stmt = con.prepareStatement("SELECT MAX(idProduto) AS last_id FROM Produto");
            rs = stmt.executeQuery();

            if (rs.next()) {
                int lastId = rs.getInt("last_id");
                return lastId;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            conexao.closeConexao(con, stmt, rs);
        }

        return -1; // Retorna -1 se não encontrar nenhum ID
    }

     public List<Produto> produto() {
        Connection con = conexao.getConexao();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Produto> us = new ArrayList<>();
        try {
            stmt = con.prepareStatement("SELECT * FROM produto");
            rs = stmt.executeQuery();

            while (rs.next()) {
                Produto p = new Produto();
                p.setIdproduto(rs.getInt("idProduto"));
                p.setNomeProduto(rs.getString("nomeProduto"));
                p.setPreco(rs.getString("preco"));
                p.setCategoria(rs.getString("categoria"));
                p.setEstado(rs.getString("estado"));
                p.setDescricao(rs.getString("descricao"));
                p.setQuantidade(rs.getInt("quantidade"));
                p.setPlataforma(rs.getString("plataforma"));
                p.setFile_name(rs.getString("file_name"));
                us.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(produtoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexao.closeConexao(con, stmt, rs);
        }
        return us;
    }
    
    public List<Produto> produtoUsuario(String user) {
        Connection con = conexao.getConexao();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Produto> us = new ArrayList<>();
        try {
            stmt = con.prepareStatement("SELECT * FROM produto WHERE usuario = ?");
            stmt.setString(1, user);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Produto p = new Produto();
                p.setIdproduto(rs.getInt("idProduto"));
                p.setNomeProduto(rs.getString("nomeProduto"));
                p.setPreco(rs.getString("preco"));
                p.setCategoria(rs.getString("categoria"));
                p.setEstado(rs.getString("estado"));
                p.setDescricao(rs.getString("descricao"));
                p.setQuantidade(rs.getInt("quantidade"));
                p.setPlataforma(rs.getString("plataforma"));
                p.setFile_name(rs.getString("file_name"));
                us.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(produtoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexao.closeConexao(con, stmt, rs);
        }
        return us;
    }
    
     public List<Produto> produtover(int id) {
        Connection con = conexao.getConexao();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Produto> us = new ArrayList<>();
        try {
            stmt = con.prepareStatement("SELECT * FROM produto INNER join perfil on produto.usuario = perfil.username WHERE idProduto = ?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Produto p = new Produto();
                p.setIdproduto(rs.getInt("idProduto"));
                p.setNome(rs.getString("nome"));
                p.setContacto(rs.getInt("contacto"));
                p.setEmail(rs.getString("email"));
                p.setNomeProduto(rs.getString("nomeProduto"));
                p.setPreco(rs.getString("preco"));
                p.setCategoria(rs.getString("categoria"));
                p.setEstado(rs.getString("estado"));
                p.setDescricao(rs.getString("descricao"));
                p.setQuantidade(rs.getInt("quantidade"));
                p.setPlataforma(rs.getString("plataforma"));
                p.setFile_name(rs.getString("file_name"));
                us.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(produtoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexao.closeConexao(con, stmt, rs);
        }
        return us;
    }

}
