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
public class Igreja {
    private Ponto_Turistico igreja;
    private String data_fundacao;
    private String estilo;

    public Igreja() {
    }

    public Igreja(Ponto_Turistico igreja,String data_fundacao, String estilo) {
        this.igreja = igreja;
        this.data_fundacao = data_fundacao;
        this.estilo = estilo;
    }

    public Ponto_Turistico getIgreja() {
        return igreja;
    }

    public void setIgreja(Ponto_Turistico igreja) {
        this.igreja = igreja;
    }

    public String getData_fundacao() {
        return data_fundacao;
    }

    public void setData_fundacao(String data_fundacao) {
        this.data_fundacao = data_fundacao;
    }

    public String getEstilo() {
        return estilo;
    }

    public void setEstilo(String estilo) {
        this.estilo = estilo;
    }
    
    
    
    
}
