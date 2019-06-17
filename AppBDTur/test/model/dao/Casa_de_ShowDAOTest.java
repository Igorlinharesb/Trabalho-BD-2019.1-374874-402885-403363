/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.bean.Casa_de_Show;
import model.bean.Cidade;
import model.bean.Endereco;
import model.bean.Ponto_Turistico;
import model.bean.Restaurante;
import org.junit.Ignore;
import org.junit.Test;

/**
 *
 * @author IgorL
 */
public class Casa_de_ShowDAOTest {
    
    public Casa_de_ShowDAOTest() {
    }
    
    @Ignore
    @Test
    public void insereCasadeShow() {
        Cidade cd = new Cidade ();
        cd.setId_cidade(3);
        
        Restaurante rest = new Restaurante ();
        rest.setId_restaurante(518);
        
        Ponto_Turistico pt = new Ponto_Turistico();
        
        pt.setNome_pt("Noate Haus");
        pt.setTelefone("88 99983990");
        pt.setTipo_pt("Casa de Show");
        pt.setCidade(cd);
        

        Endereco endereco_cs = new Endereco();

        endereco_cs.setTipo_endereco("PontoTuristico");
        endereco_cs.setTipo_logradouro("Rua");
        endereco_cs.setNome_logradouro("ABC");
        endereco_cs.setBairro("Bairro");
        endereco_cs.setNumero_endereco(13);
        endereco_cs.setCep("62370000");
        endereco_cs.setComplemento("Ali perto.");

        Casa_de_Show cs = new Casa_de_Show();
        cs.setHora_inicio("22:00");
        cs.setDia_fechamento("Segunda-Feira");
        cs.setPreco_medio_rest(35);
        cs.setRestaurante(rest);
        
        Casa_de_ShowDAO csdao = new Casa_de_ShowDAO ();
        csdao.createCS(cs, pt, endereco_cs);
        
        
        if (csdao.createCS(cs, pt, endereco_cs)) {
            System.out.println("Salvo com Sucesso! ");
        } else {
            System.err.println("Erro ao Salvar! ");
        }
    }
    
    @Test
    public void atualizaCasadeShow() {
        Cidade cd = new Cidade ();
        cd.setId_cidade(3);
        
        Restaurante rest = new Restaurante ();
        rest.setId_restaurante(1000);
        
        Ponto_Turistico pt = new Ponto_Turistico();
        pt.setId_pt(501);

        Casa_de_Show cs = new Casa_de_Show();
        cs.setHora_inicio("22:00");
        cs.setDia_fechamento("Segunda-Feira");
        cs.setPreco_medio_rest(35);
        cs.setEspecialidade_rest("Comida Nacional");
        cs.setRestaurante(rest);
        
        Casa_de_ShowDAO csdao = new Casa_de_ShowDAO ();
        csdao.updateCS(cs, pt);
        
        
    }
}
