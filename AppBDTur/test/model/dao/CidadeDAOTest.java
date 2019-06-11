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
        Cidade cidade = new Cidade ("Recife","PE", 2019210);
        CidadeDAO dao = new CidadeDAO();
        dao.createCidade (cidade);
        
        if(dao.createCidade(cidade)){
            System.out.println("Cidade armazenada com sucesso!");
        } else{
                fail("Falha ao Salvar cidade! ");
        }
    }
}
