/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.bean.Cidade;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Ignore;

/**
 *
 * @author Laboratório 7
 */
public class CidadeDAOTest {

    public CidadeDAOTest() {
    }

    @Ignore
    @Test
    public void insereCidade() {
        Cidade cidade = new Cidade("Belém", "PA", 2478746);
        CidadeDAO dao = new CidadeDAO();
        dao.createCidade(cidade);

        if (dao.createCidade(cidade)) {
            System.out.println("Cidade armazenada com sucesso!");
        } else {
            fail("Falha ao Salvar! ");
        }
    }

    @Test
    public void atualizaCidade() {
        Cidade cidade = new Cidade("Sobral", "CE", 158000);
        cidade.setId_cidade(1);
        CidadeDAO dao = new CidadeDAO();
        
        dao.updateCidade(cidade);
    }
}
