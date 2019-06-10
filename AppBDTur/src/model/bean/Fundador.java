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
public class Fundador {
    private int id_fundador;
    private String nome_fundador;
    private String dn;
    private String morte;
    private String nacionalidade;
    private String profissao;

    public Fundador() {
    }

    public Fundador(int id_fundador, String nome_fundador, String dn, String nacionalidade, String profissao) {
        this.id_fundador = id_fundador;
        this.nome_fundador = nome_fundador;
        this.dn = dn;
        this.nacionalidade = nacionalidade;
        this.profissao = profissao;
    }

    public Fundador(int id_fundador, String nome_fundador, String dn, String morte, String nacionalidade, String profissao) {
        this.id_fundador = id_fundador;
        this.nome_fundador = nome_fundador;
        this.dn = dn;
        this.morte = morte;
        this.nacionalidade = nacionalidade;
        this.profissao = profissao;
    }

    public int getId_fundador() {
        return id_fundador;
    }

    public void setId_fundador(int id_fundador) {
        this.id_fundador = id_fundador;
    }

    public String getNome_fundador() {
        return nome_fundador;
    }

    public void setNome_fundador(String nome_fundador) {
        this.nome_fundador = nome_fundador;
    }

    public String getDn() {
        return dn;
    }

    public void setDn(String dn) {
        this.dn = dn;
    }

    public String getMorte() {
        return morte;
    }

    public void setMorte(String morte) {
        this.morte = morte;
    }

    public String getNacionalidade() {
        return nacionalidade;
    }

    public void setNacionalidade(String nacionalidade) {
        this.nacionalidade = nacionalidade;
    }

    public String getProfissao() {
        return profissao;
    }

    public void setProfissao(String profissao) {
        this.profissao = profissao;
    }
    
    
    
    
}
