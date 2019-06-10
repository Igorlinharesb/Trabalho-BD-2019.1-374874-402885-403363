/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import Connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.bean.Cidade;
/**
 *
 * @author Laboratório 7
 */
public class CidadeDAO {
    
    private Connection con = null;

    public CidadeDAO() {
        try {
            con = ConnectionFactory.getConnection();
        } catch (SQLException ex) {
            System.err.println("Erro de Conexão: "+ex);
        }
      
    }
    
    public boolean inserir (Cidade cidade){
        String sql1 = "INSERT INTO cidade (nome, UF, populacao) VALUES (?,?,?)";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql1);
            stmt.setString(1, cidade.getNome_cidade());
            stmt.setString(2, cidade.getUF());
            stmt.setInt(3, cidade.getPopulacao());
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("ERRO: "+ex);
            return false;
        } finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
        
    }
}
