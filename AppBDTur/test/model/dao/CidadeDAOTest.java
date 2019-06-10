/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.bean.Cidade;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Laboratório 7
 */
public class CidadeDAOTest {
    
    public CidadeDAOTest() {
    }

    @Test
    public void Inserir() {
        Cidade cidade = new Cidade ("Belém","PA", 2478746);
        CidadeDAO dao = new CidadeDAO();
        dao.inserir (cidade);
        
        if(dao.inserir(cidade)){
            System.out.println("Cidade armazenada com sucesso!");
        } else{
                fail("Falha ao Salvar! ");
        }
    }
}
