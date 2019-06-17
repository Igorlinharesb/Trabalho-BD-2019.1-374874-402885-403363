/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.bean.Cidade;
import model.bean.Endereco;
import model.bean.Hotel;
import model.bean.Restaurante;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Ignore;

/**
 *
 * @author IgorL
 */
public class HotelDAOTest {

    public HotelDAOTest() {
    }

    @Ignore
    @Test
    public void inserirHotel() {
        Restaurante rest = new Restaurante();
        rest.setId_restaurante(518);

        Cidade cidade_hotel = new Cidade();
        cidade_hotel.setId_cidade(1);

        Endereco endereco_hotel = new Endereco();

        endereco_hotel.setTipo_endereco("Hotel");
        endereco_hotel.setTipo_logradouro("Rua");
        endereco_hotel.setNome_logradouro("ABC");
        endereco_hotel.setBairro("Bairro");
        endereco_hotel.setNumero_endereco(13);
        endereco_hotel.setCep("62370000");
        endereco_hotel.setComplemento("Ali perto.");

        Hotel hotel = new Hotel();
        hotel.setNome_hotel("Hotel Exemplo");
        hotel.setCategoria(3);
        hotel.setCidade(cidade_hotel);
        hotel.setRestaurante(rest);

        HotelDAO hoteldao = new HotelDAO();

        if (hoteldao.createHotel(hotel, endereco_hotel)) {
            System.out.println("Salvo com Sucesso! ");
        } else {
            System.err.println("Erro ao Salvar! ");
        }
    }
    
    @Test
    

    public void atualizarHotel() {
        Restaurante rest = new Restaurante();
        rest.setId_restaurante(1000);

        Cidade cidade_hotel = new Cidade();
        cidade_hotel.setId_cidade(1);

        Hotel hotel = new Hotel();
        hotel.setId_hotel(201);
        hotel.setNome_hotel("Visconde");
        hotel.setCategoria(3);
        hotel.setCidade(cidade_hotel);
        hotel.setRestaurante(rest);

        HotelDAO hoteldao = new HotelDAO();

        hoteldao.updateHotel(hotel);

    }
}
