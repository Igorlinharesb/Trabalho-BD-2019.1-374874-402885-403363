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
import model.bean.Quarto;

/**
 *
 * @author IgorL
 */
public class QuartoDAO {

    private Connection con = null;

    public QuartoDAO() {
        try {
            con = ConnectionFactory.getConnection();
        } catch (SQLException ex) {
            System.err.println("Erro ao conectar com o Banco de Dados: " + ex);
        }
    }

    public boolean createQuarto(Quarto quarto) {
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement("INSERT INTO quarto (numero_quarto, valor, tipo, hotel_id) VALUES (?,?,?,?)");
            stmt.setInt(1, quarto.getNumero_quarto());
            stmt.setFloat(2, quarto.getValor());
            stmt.setString(3, quarto.getTipo());
            stmt.setInt(4, quarto.getHotel().getId_hotel());

            stmt.executeUpdate();

            JOptionPane.showMessageDialog(null, "Quarto cadastrada com Sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao armazenar quartp: " + ex);
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }

    }

}
