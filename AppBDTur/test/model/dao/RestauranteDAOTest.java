/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.bean.Cidade;
import model.bean.Endereco;
import model.bean.Restaurante;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Ignore;

/**
 *
 * @author IgorL
 */
public class RestauranteDAOTest {

    public RestauranteDAOTest() {
    }

    
    @Ignore
    @Test
    public void insereRestaurante() {
        Cidade cidade = new Cidade();
        cidade.setId_cidade(1);

        Endereco endereco_hotel = new Endereco();

        endereco_hotel.setTipo_endereco("Hotel");
        endereco_hotel.setTipo_logradouro("Rua");
        endereco_hotel.setNome_logradouro("ABC");
        endereco_hotel.setBairro("Bairro");
        endereco_hotel.setNumero_endereco(13);
        endereco_hotel.setCep("62370000");
        endereco_hotel.setComplemento("Ali perto.");

        Restaurante rest = new Restaurante();
        rest.setNome_restaurante("La Gula");
        rest.setCategoria("Geral");
        rest.setCidade(cidade);

        RestauranteDAO restdao = new RestauranteDAO();
        restdao.createRestaurante(rest, endereco_hotel);
       
    }
    
    @Test
    public void atualizaRestaurante() {
        Cidade cidade = new Cidade();
        cidade.setId_cidade(2);

        Restaurante rest = new Restaurante();
        
        rest.setId_restaurante(110);
        rest.setNome_restaurante("Coco Bambu");
        rest.setCategoria("Luxo");
        rest.setCidade(cidade);

        RestauranteDAO restdao = new RestauranteDAO();
        restdao.updateRestaurante(rest);
       
    }
}
