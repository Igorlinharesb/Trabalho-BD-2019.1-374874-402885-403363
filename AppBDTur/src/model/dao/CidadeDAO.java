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
import javax.swing.JOptionPane;
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
            System.err.println("Erro ao conectar com o Banco de Dados: "+ex);
        }
    }
    
    public boolean createCidade (Cidade cidade){
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement("INSERT INTO cidade (nome, UF, populacao) VALUES (?,?,?)");
            stmt.setString(1, cidade.getNome_cidade());
            stmt.setString(2, cidade.getUF());
            stmt.setInt(3, cidade.getPopulacao());
            
            stmt.executeUpdate();
            
            JOptionPane.showConfirmDialog(null, "Cidade armazenada com Sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showConfirmDialog(null, "Erro ao armazenar cidade: "+ex);
            return false;
        } finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
        
    }
}
