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
import model.bean.Restaurante;

/**
 *
 * @author IgorL
 */
public class RestauranteDAO {

    private Connection con = null;

    public RestauranteDAO() {

        try {
            con = ConnectionFactory.getConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao conectar com o Banco de Dados: " + ex);
        }

    }

    public boolean createRestaurante(Restaurante restaurante, Endereco endereco) {
        String sql1 = "CALL pr_insere_restaurante (?,?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql1);
            stmt.setString(1, restaurante.getNome_restaurante());
            stmt.setString(2, restaurante.getCategoria());
            stmt.setInt(3, restaurante.getCidade().getId_cidade());
            stmt.setString(4, endereco.getTipo_logradouro());
            stmt.setString(5, endereco.getNome_logradouro());
            stmt.setInt(6, endereco.getNumero_endereco());
            stmt.setString(7, endereco.getBairro());
            stmt.setString(8, endereco.getCep());
            stmt.setString(9, endereco.getComplemento());
            stmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Restaurante cadastrado com Sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao cadastrar Restaurante: " + ex);
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }

    }

    public boolean updateRestaurante(Restaurante restaurante) {
        String sql1 = "UPDATE restaurante SET nome_restaurante = ?, categoria_restaurante = ?, cidade_ID = ? WHERE id_restaurante = ?";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql1);
            stmt.setString(1, restaurante.getNome_restaurante());
            stmt.setString(2, restaurante.getCategoria());
            stmt.setInt(3, restaurante.getCidade().getId_cidade());
            stmt.setInt(4, restaurante.getId_restaurante());
            stmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Restaurante atualizado com Sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar Restaurante: " + ex);
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }

    }
}
