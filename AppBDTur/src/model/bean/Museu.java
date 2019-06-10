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
public class Museu {
    private Ponto_Turistico museu;
    private String data_fundacao;
    private float entrada;
    private int qtd_salas;

    public Museu() {
    }

    public Museu(Ponto_Turistico museu, String data_fundacao, float entrada, int qtd_salas) {
        this.museu = museu;
        this.data_fundacao = data_fundacao;
        this.entrada = entrada;
        this.qtd_salas = qtd_salas;
    }

    public Ponto_Turistico getMuseu() {
        return museu;
    }

    public void setMuseu(Ponto_Turistico museu) {
        this.museu = museu;
    }

    public String getData_fundacao() {
        return data_fundacao;
    }

    public void setData_fundacao(String data_fundacao) {
        this.data_fundacao = data_fundacao;
    }

    public float getEntrada() {
        return entrada;
    }

    public void setEntrada(float entrada) {
        this.entrada = entrada;
    }

    public int getQtd_salas() {
        return qtd_salas;
    }

    public void setQtd_salas(int qtd_salas) {
        this.qtd_salas = qtd_salas;
    }
    
    
    
}
