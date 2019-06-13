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

/**
 *
 * @author IgorL
 */
public class EnderecoDAO {
    private Connection con = null ;

    public EnderecoDAO() {
        
        try {
            con = ConnectionFactory.getConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao conectar com o Banco de Dados: "+ex);
        }
    }
    
    public boolean createEndereco (Endereco endereco){
        String sql1 = "INSERT INTO cidade (ID_Endereco, tipo_logradouro, nome, numero, bairro, cep, complemento) VALUES (?,?,?,?,?,?,?)";
        PreparedStatement stmt = null;
        try {
            
            stmt = con.prepareStatement(sql1);
            stmt.setString(2, endereco.getTipo_logradouro());
            stmt.setString(3, endereco.getNome_logradouro());
            stmt.setInt(4, endereco.getNumero_endereco());
            stmt.setString(5, endereco.getBairro());
            stmt.setString(6, endereco.getCep());
            stmt.setString(7, endereco.getComplemento());
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao cadastrar Endereço: "+ex);
            return false;
        } finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
}
