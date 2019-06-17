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
public class EnderecoDAOTest {
    
    public EnderecoDAOTest() {
    }

    @Test
    public void updateEndereco() {
        
        Endereco end = new Endereco ();
         
        end.setId(509);
        
        Cidade cidade = new Cidade ();
        cidade.setId_cidade(1);
        
        Ponto_Turistico pt = new Ponto_Turistico ();
        pt.setCidade(cidade);
        
        end.setTipo_endereco("PontoTuristico");
        end.setTipo_logradouro("Praça");
        end.setNome_logradouro("da Sé");
        end.setNumero_endereco(1);
        end.setBairro("Centro");
        end.setCep("60055-150");
        end.setComplemento("-");
        
        EnderecoDAO enddao = new EnderecoDAO ();
        enddao.updateEndereco(end, pt);
    }
    
}
