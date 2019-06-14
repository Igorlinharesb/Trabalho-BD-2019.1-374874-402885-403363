/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.bean.Cidade;
import model.bean.Endereco;
import model.bean.Ponto_Turistico;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author IgorL
 */
public class PontoTuristicoDAOTest {
    
    public PontoTuristicoDAOTest() {
    }

    @Test
    public void PTTest() {
        Cidade cidade_hotel = new Cidade ();
        cidade_hotel.setId_cidade(1);
        
        Endereco endereco_pt = new Endereco ();
        
        endereco_pt.setTipo_endereco("PontoTuristico");
        endereco_pt.setTipo_logradouro("Rua");
        endereco_pt.setNome_logradouro("ABC");
        endereco_pt.setBairro("Bairro");
        endereco_pt.setNumero_endereco(13);
        endereco_pt.setCep("62370000");
        endereco_pt.setComplemento("Ali perto.");
        
        Ponto_Turistico pt = new Ponto_Turistico ();
        pt.setNome_pt("Museu do Eclipse");
        pt.setDescricao("aaaaaaaaaaaaaaaa");
        pt.setTelefone("88 99999999");
        pt.setTipo_pt("Museu");
        
        PontoTuristicoDAO ptdao = new PontoTuristicoDAO ();
        
        if (ptdao.createPT(pt, endereco_pt)){
            System.out.println("PT Salvo");
        }else{
            System.err.println("ERRO");
        }
        
        
    }
    
}
