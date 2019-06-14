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
import model.bean.Ponto_Turistico;

/**
 *
 * @author IgorL
 */
public class PontoTuristicoDAO {
    private Connection con = null;

    public PontoTuristicoDAO() {
        try {
            con = ConnectionFactory.getConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao conectar com o Banco de Dados: "+ex);
        }
    }
    
  
    public boolean createPT(Ponto_Turistico pt, Endereco endereco) {
        String sql1 = "CALL pr_endereco_pt (?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql1);
            stmt.setString(1, pt.getNome_pt());
            stmt.setString(2, pt.getDescricao());
            stmt.setString(3, pt.getTelefone());
            stmt.setString (4, pt.getTipo_pt());
            stmt.setInt (5, pt.getCidade().getId_cidade());
            stmt.setString(6, endereco.getTipo_logradouro());
            stmt.setString(7, endereco.getNome_logradouro());
            stmt.setInt(8, endereco.getNumero_endereco());
            stmt.setString(9, endereco.getBairro());
            stmt.setString (10, endereco.getCep());
            stmt.setString(11, endereco.getComplemento());
            stmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Ponto Turístico cadastrado com Sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao cadastrar Ponto Turistico: " + ex);
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
}
