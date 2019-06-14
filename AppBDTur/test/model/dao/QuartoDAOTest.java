/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.bean.Hotel;
import model.bean.Quarto;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author IgorL
 */
public class QuartoDAOTest {
    
    public QuartoDAOTest() {
    }

    @Test
    public void testCreateHotel() {
        Quarto quarto = new Quarto ();
        Hotel hotel_quarto = new Hotel ();
        hotel_quarto.setId_hotel(209);
        
        quarto.setNumero_quarto(6);
        quarto.setTipo("Luxo");
        quarto.setValor(230);
        quarto.setHotel(hotel_quarto);
        
        QuartoDAO quartodao = new QuartoDAO();
        if(quartodao.createQuarto(quarto)){
            System.out.println("Salvo");
        } else {
            System.err.println("ERRO");
        }
    }
    
}
