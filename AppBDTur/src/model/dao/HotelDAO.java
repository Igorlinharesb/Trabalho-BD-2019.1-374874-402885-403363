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
import model.bean.Endereco;
import model.bean.Hotel;

/**
 *
 * @author IgorL
 */
public class HotelDAO {

    private Connection con = null;

    public HotelDAO() {
        try {
            con = ConnectionFactory.getConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao conectar com o Banco de Dados: "+ex);
        }
    }
    
  
    public boolean createHotel(Hotel hotel, Endereco endereco) {
        String sql1 = "CALL pr_insere_hotel (?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql1);
            stmt.setString(1, hotel.getNome_hotel());
            stmt.setInt(2, hotel.getCategoria());
            stmt.setInt(3, hotel.getCidade().getId_cidade());
            stmt.setInt (4, hotel.getRestaurante().getId_restaurante());
            stmt.setString(5, endereco.getTipo_logradouro());
            stmt.setString(6, endereco.getNome_logradouro());
            stmt.setInt(7, endereco.getNumero_endereco());
            stmt.setString(8, endereco.getBairro());
            stmt.setString (9, endereco.getCep());
            stmt.setString(10, endereco.getComplemento());
            stmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Hotel cadastrado com Sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao cadastrar Hotel: " + ex);
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }

    }
}
