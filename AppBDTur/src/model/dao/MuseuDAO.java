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
import model.bean.Endereco;
import model.bean.Museu;
import model.bean.Ponto_Turistico;

/**
 *
 * @author IgorL
 */
public class MuseuDAO {

    private Connection con = null;

    public MuseuDAO() {

        try {
            con = ConnectionFactory.getConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao conectar com o Banco de Dados: " + ex);
        }
    }

    public boolean createMuseu(Museu museu, Ponto_Turistico pt, Endereco endereco) {
        String sql1 = "CALL pr_insere_museu (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql1);
            stmt.setString(1, pt.getNome_pt());
            stmt.setString(2, pt.getDescricao());
            stmt.setString(3, pt.getTelefone());
            stmt.setInt(4, pt.getCidade().getId_cidade());
            stmt.setString(5, endereco.getTipo_logradouro());
            stmt.setString(6, endereco.getNome_logradouro());
            stmt.setInt(7, endereco.getNumero_endereco());
            stmt.setString(8, endereco.getBairro());
            stmt.setString(9, endereco.getCep());
            stmt.setString(10, endereco.getComplemento());
            stmt.setString(11, museu.getData_fundacao());
            stmt.setFloat(12, museu.getEntrada());
            stmt.setInt(13, museu.getQtd_salas());
            stmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Museu cadastrado com Sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao cadastrar Museu: " + ex);
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }

    }

    public boolean updateMuseu(Museu museu, Ponto_Turistico pt) {
        String sql1 = "UPDATE museu SET data_fundacao = ?, entrada = ?, qtde_salas = ? WHERE pt_id = ?";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql1);
            stmt.setString(1, museu.getData_fundacao());
            stmt.setFloat(2, museu.getEntrada());
            stmt.setInt(3, museu.getQtd_salas());
            stmt.setInt(4, pt.getId_pt());
            stmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Museu atualizado com Sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizarr Museu: " + ex);
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }

    }
}
