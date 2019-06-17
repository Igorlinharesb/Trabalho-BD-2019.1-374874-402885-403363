/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import Connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
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
            JOptionPane.showMessageDialog(null, "Erro ao conectar com o Banco de Dados: " + ex);
        }

    }

    public boolean createCidade(Cidade cidade) {
        String sql1 = "INSERT INTO cidade (Nome_Cidade, UF, populacao) VALUES (?,?,?)";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql1);
            stmt.setString(1, cidade.getNome_cidade());
            stmt.setString(2, cidade.getUF());
            stmt.setInt(3, cidade.getPopulacao());
            stmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Cidade cadastrada com Sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao cadastrar Cidade: " + ex);
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }
    }

    public boolean updateCidade(Cidade cidade) {
        String sql1 = "UPDATE cidade SET nome_cidade = ?, UF = ?, populacao = ? WHERE id_cidade = ?";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql1);
            stmt.setString(1, cidade.getNome_cidade());
            stmt.setString(2, cidade.getUF());
            stmt.setInt(3, cidade.getPopulacao());
            stmt.setInt(4, cidade.getId_cidade());
            stmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Cidade atualizada com sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar Cidade: " + ex);
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }

    }
}
