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
public class EnderecoDAO {

    private Connection con = null;

    public EnderecoDAO() {

        try {
            con = ConnectionFactory.getConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao conectar com o Banco de Dados: " + ex);
        }
    }

    public boolean updateEndereco(Endereco end, Ponto_Turistico pt) {
        String sql1 = "UPDATE Endereco SET TipoEndereco = ?, Tipo_Logradouro = ?, Nome_Logradouro = ?, Numero_End= ?, Bairro = ?, CEP = ?, Complemento = ? WHERE  ID_Endereco = ?";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql1);
            stmt.setInt(1, pt.getCidade().getId_cidade());
            stmt.setString(2, end.getTipo_logradouro());
            stmt.setString(3, end.getNome_logradouro());
            stmt.setInt(4, end.getNumero_endereco());
            stmt.setString(5, end.getBairro());
            stmt.setString(6, end.getCep());
            stmt.setString(7, end.getComplemento());
            stmt.setInt(8, end.getId());
            stmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Endereço atualizado com Sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar Endereço: " + ex);
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }

    }

}
