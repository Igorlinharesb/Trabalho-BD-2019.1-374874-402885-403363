/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.bean.Cidade;
import model.bean.Ponto_Turistico;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author IgorL
 */
public class Ponto_TuristicoDAOTest {
    
    public Ponto_TuristicoDAOTest() {
    }

    @Test
    public void updatePT() {
        Cidade cd = new Cidade ();
        cd.setId_cidade(3);
        
        Ponto_Turistico pt = new Ponto_Turistico ();
        pt.setId_pt(503);
        pt.setNome_pt("Festival Rock in Rio");
        pt.setDescricao("Espaço Cultural");
        pt.setTelefone("21 9883929");
        pt.setTipo_pt("Casa de Show");
        pt.setCidade(cd);
        
        Ponto_TuristicoDAO ptdao = new Ponto_TuristicoDAO ();
        ptdao.updatePT(pt);
    }
    
}
