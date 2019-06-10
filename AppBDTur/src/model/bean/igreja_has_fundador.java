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
public class igreja_has_fundador {
    private Igreja igreja;
    private Fundador fundador;

    public igreja_has_fundador() {
    }

    public igreja_has_fundador(Igreja igreja, Fundador fundador) {
        this.igreja = igreja;
        this.fundador = fundador;
    }

    public Igreja getIgreja() {
        return igreja;
    }

    public void setIgreja(Igreja igreja) {
        this.igreja = igreja;
    }

    public Fundador getFundador() {
        return fundador;
    }

    public void setFundador(Fundador fundador) {
        this.fundador = fundador;
    }
    
    
    
}
