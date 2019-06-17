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
import model.bean.Igreja;
import model.bean.Ponto_Turistico;

/**
 *
 * @author IgorL
 */
public class IgrejaDAO {

    private Connection con = null;

    public IgrejaDAO() {

        try {
            con = ConnectionFactory.getConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao conectar com o Banco de Dados: " + ex);
        }

    }

    public boolean createIgreja(Igreja igreja, Ponto_Turistico pt, Endereco end) {
        String sql1 = "CALL pr_igreja (?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement(sql1);
            stmt.setString(1, pt.getNome_pt());
            stmt.setString(2, pt.getDescricao());
            stmt.setString(3, pt.getTelefone());
            stmt.setInt(4, pt.getCidade().getId_cidade());
            stmt.setString(4, end.getTipo_logradouro());
            stmt.setString(5, end.getNome_logradouro());
            stmt.setInt(6, end.getNumero_endereco());
            stmt.setString(7, end.getBairro());
            stmt.setString(8, end.getCep());
            stmt.setString(9, end.getComplemento());
            stmt.setString(10, igreja.getData_fundacao());
            stmt.setString(11, igreja.getEstilo());
            stmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Igreja cadastrado com Sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao cadastrar Igreja: " + ex);
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }

    }
}

