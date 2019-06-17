/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.bean.Cidade;
import model.bean.Endereco;
import model.bean.Museu;
import model.bean.Ponto_Turistico;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Ignore;

/**
 *
 * @author IgorL
 */
public class MuseuDAOTest {
    
    public MuseuDAOTest() {
    }

    @Ignore
    @Test
    public void insereMuseu() {
        
        Cidade cd = new Cidade ();
        cd.setId_cidade(1);
        
        
        Ponto_Turistico pt = new Ponto_Turistico();
        
        pt.setNome_pt("Teste_Museu");
        pt.setTelefone("88 99983990");
        pt.setTipo_pt("Museu");
        pt.setCidade(cd);
        

        Endereco endereco_museu = new Endereco();

        endereco_museu.setTipo_endereco("PontoTuristico");
        endereco_museu.setTipo_logradouro("Rua");
        endereco_museu.setNome_logradouro("ABC");
        endereco_museu.setBairro("Bairro");
        endereco_museu.setNumero_endereco(13);
        endereco_museu.setCep("62370000");
        endereco_museu.setComplemento("Ali perto.");

        
        Museu museu = new Museu ();
        museu.setData_fundacao("1999-03-09");
        museu.setEntrada(0);
        museu.setQtd_salas(0);
        

        MuseuDAO museudao = new MuseuDAO ();
        if (museudao.createMuseu(museu, pt, endereco_museu)) {
            System.out.println("Salvo com Sucesso! ");
        } else {
            System.err.println("Erro ao Salvar! ");
        }
    }
    
    @Test
    public void atualizaMuseu() {
        Ponto_Turistico pt = new Ponto_Turistico();
        pt.setId_pt(505);
        
        Museu museu = new Museu ();
        museu.setData_fundacao("2015-12-17");
        museu.setEntrada(5);
        museu.setQtd_salas(37);
        
        MuseuDAO museudao = new MuseuDAO ();
        museudao.updateMuseu(museu, pt);
    }
}
