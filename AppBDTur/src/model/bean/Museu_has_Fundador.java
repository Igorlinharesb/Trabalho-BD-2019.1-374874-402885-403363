/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;

/**
 *
 * @author IgorL
 */
public class Museu_has_Fundador {
    private Museu museu;
    private Fundador fundador;

    public Museu_has_Fundador() {
    }

    public Museu_has_Fundador(Museu museu, Fundador fundador) {
        this.museu = museu;
        this.fundador = fundador;
    }

    public Museu getMuseu() {
        return museu;
    }

    public void setMuseu(Museu museu) {
        this.museu = museu;
    }

    public Fundador getFundador() {
        return fundador;
    }

    public void setFundador(Fundador fundador) {
        this.fundador = fundador;
    }
    
    
    
}
