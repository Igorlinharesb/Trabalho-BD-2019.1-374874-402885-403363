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
import model.bean.Endereco;
import model.bean.Igreja;
import model.bean.Ponto_Turistico;

/**
 *
 * @author IgorL
 */
public class Casa_de_ShowDAO {
    
    private Connection con = null;

    public Casa_de_ShowDAO() {

        try {
            con = ConnectionFactory.getConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao conectar com o Banco de Dados: " + ex);
        }
    }

    public boolean createCS(Casa_de_Show cs, Ponto_Turistico pt, Endereco endereco) {
        String sql1 = "CALL pr_insere_casadeshow (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            stmt.setString(11, cs.getHora_inicio());
            stmt.setString(12, cs.getDia_fechamento());
            stmt.setDouble(13, cs.getPreco_medio_rest());
            stmt.setString(14, cs.getEspecialidade_rest());
            stmt.setInt(15, cs.getRestaurante().getId_restaurante());
            stmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Casa de Show cadastrada com Sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao cadastrar Casa de Show: " + ex);
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }

    }
    
    public boolean updateCS(Casa_de_Show cs, Ponto_Turistico pt) {
        String sql1 = "UPDATE Casa_de_Show SET horario_inicio = ?, dia_de_fechamento = ?, preco_medio_rest = ?, especialidade_rest = ?, restaurante_ID = ? WHERE PT_ID = ?";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql1);
            stmt.setString(1, cs.getHora_inicio());
            stmt.setString(2, cs.getDia_fechamento());
            stmt.setDouble(3, cs.getPreco_medio_rest());
            stmt.setString(4, cs.getEspecialidade_rest());
            stmt.setInt(5, cs.getRestaurante().getId_restaurante());
            stmt.setInt(6, pt.getId_pt());
            stmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Casa de Show atualizada com Sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar Casa de Show: " + ex);
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }

    }
    
}
