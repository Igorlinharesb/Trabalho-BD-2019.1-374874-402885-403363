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
import model.bean.Casa_de_Show;
import model.bean.Ponto_Turistico;

/**
 *
 * @author IgorL
 */
public class Ponto_TuristicoDAO {
    private Connection con = null;

    public Ponto_TuristicoDAO() {
        try {
            con = ConnectionFactory.getConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao conectar com o Banco de Dados: " + ex);
        }
    }
    
    public boolean updatePT(Ponto_Turistico pt) {
        String sql1 = "UPDATE Ponto_Turistico SET nome_PT = ?, descricao = ?, telefone = ?, tipo_pt = ?, cidade_ID = ? WHERE  ID_PT = ?";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql1);
            stmt.setString(1, pt.getNome_pt());
            stmt.setString(2, pt.getDescricao());
            stmt.setString(3, pt.getTelefone());
            stmt.setString(4, pt.getTipo_pt());
            stmt.setInt(5, pt.getCidade().getId_cidade());
            stmt.setInt(6, pt.getId_pt());
            stmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Ponto Turístico atualizado com Sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar Ponto Turístico: " + ex);
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }

    }
}
