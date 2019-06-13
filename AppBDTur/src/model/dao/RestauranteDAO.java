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
import model.bean.Restaurante;

/**
 *
 * @author IgorL
 */
public class RestauranteDAO {
    private Connection con = null ;

    public RestauranteDAO() {
        
        try {
            con = ConnectionFactory.getConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao conectar com o Banco de Dados: "+ex);
        }
        
    }
        
        public boolean createRestaurante (Restaurante restaurante){
        String sql1 = "INSERT INTO cidade (Nome, Categoria) VALUES (?,?)";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql1);
            stmt.setString(1, restaurante.getNome_restaurante());
            stmt.setString(2, restaurante.getCategoria());
            //stmt.setInt(3, restaurante.);
            stmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Cidade cadastrada com Sucesso!");
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao cadastrar cidade: "+ex);
            return false;
        } finally{
            ConnectionFactory.closeConnection(con, stmt);
        }               
            
}
    
    
    
    
}
