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
public class Casa_de_Show {
    private Ponto_Turistico casa_de_show;
    private String hora_inicio;
    private String dia_fechamento;
    private float preco_medio_rest;
    private String especialidade_rest;
    private Restaurante restaurante;

    public Casa_de_Show() {
    }
    
    
    public Casa_de_Show(Ponto_Turistico casa_de_show, String hora_inicio, String dia_fechamento) {
        this.casa_de_show = casa_de_show;
        this.hora_inicio = hora_inicio;
        this.dia_fechamento = dia_fechamento;
    }

    public Casa_de_Show(Ponto_Turistico casa_de_show, String hora_inicio, String dia_fechamento, float preco_medio_rest, String especialidade_rest, Restaurante restaurante) {
        this.casa_de_show = casa_de_show;
        this.hora_inicio = hora_inicio;
        this.dia_fechamento = dia_fechamento;
        this.preco_medio_rest = preco_medio_rest;
        this.especialidade_rest = especialidade_rest;
        this.restaurante = restaurante;
    }

    public Ponto_Turistico getCasa_de_show() {
        return casa_de_show;
    }

    public void setCasa_de_show(Ponto_Turistico casa_de_show) {
        this.casa_de_show = casa_de_show;
    }

    public String getHora_inicio() {
        return hora_inicio;
    }

    public void setHora_inicio(String hora_inicio) {
        this.hora_inicio = hora_inicio;
    }

    public String getDia_fechamento() {
        return dia_fechamento;
    }

    public void setDia_fechamento(String dia_fechamento) {
        this.dia_fechamento = dia_fechamento;
    }

    public float getPreco_medio_rest() {
        return preco_medio_rest;
    }

    public void setPreco_medio_rest(float preco_medio_rest) {
        this.preco_medio_rest = preco_medio_rest;
    }

    public String getEspecialidade_rest() {
        return especialidade_rest;
    }

    public void setEspecialidade_rest(String especialidade_rest) {
        this.especialidade_rest = especialidade_rest;
    }

    public Restaurante getRestaurante() {
        return restaurante;
    }

    public void setRestaurante(Restaurante restaurante) {
        this.restaurante = restaurante;
    }
    
}
