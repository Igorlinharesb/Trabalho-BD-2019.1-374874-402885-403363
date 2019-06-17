/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.bean.Cidade;
import model.bean.Endereco;
import model.bean.Igreja;
import model.bean.Ponto_Turistico;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Ignore;

/**
 *
 * @author IgorL
 */
public class IgrejaDAOTest {

    public IgrejaDAOTest() {
    }

    @Ignore
    @Test

    public void InserirIgreja() {
        Cidade cd = new Cidade();
        cd.setId_cidade(1);

        Ponto_Turistico pt = new Ponto_Turistico();

        pt.setNome_pt("Teste");
        pt.setTelefone("88 99983990");
        pt.setTipo_pt("Igreja");
        pt.setCidade(cd);

        Endereco endereco_hotel = new Endereco();

        endereco_hotel.setTipo_endereco("PontoTuristico");
        endereco_hotel.setTipo_logradouro("Rua");
        endereco_hotel.setNome_logradouro("ABC");
        endereco_hotel.setBairro("Bairro");
        endereco_hotel.setNumero_endereco(13);
        endereco_hotel.setCep("62370000");
        endereco_hotel.setComplemento("Ali perto.");

        Igreja igreja = new Igreja();
        igreja.setData_fundacao("2000-12-11");
        igreja.setEstilo("Classico");

        IgrejaDAO igrejadao = new IgrejaDAO();

        if (igrejadao.createIgreja(igreja, pt, endereco_hotel)) {
            System.out.println("Salvo com Sucesso! ");
        } else {
            System.err.println("Erro ao Salvar! ");
        }
    }

    @Test
    public void atualizarIgreja() {
        Ponto_Turistico pt = new Ponto_Turistico();
        pt.setId_pt(507);

        Igreja igreja = new Igreja();
        igreja.setData_fundacao("1888-12-11");
        igreja.setEstilo("Rococó");
        

        IgrejaDAO igrejadao = new IgrejaDAO();
        igrejadao.updateIgreja(igreja, pt);

    }
}
