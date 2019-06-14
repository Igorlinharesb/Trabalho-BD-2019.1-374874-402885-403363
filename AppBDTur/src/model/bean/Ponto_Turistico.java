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
public class Ponto_Turistico {

    private int id_pt;
    private String nome_pt;
    private String descricao;
    private String telefone;
    private String tipo_pt;
    private Cidade cidade;

    public Ponto_Turistico() {
    }

    public Ponto_Turistico(String nome_pt, String descricao, String telefone, String tipo_pt, Cidade cidade) {
        this.nome_pt = nome_pt;
        this.descricao = descricao;
        this.telefone = telefone;
        this.tipo_pt = tipo_pt;
        this.cidade = cidade;
    }

    public int getId_pt() {
        return id_pt;
    }

    public void setId_pt(int id_pt) {
        this.id_pt = id_pt;
    }

    public String getNome_pt() {
        return nome_pt;
    }

    public void setNome_pt(String nome_pt) {
        this.nome_pt = nome_pt;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getTipo_pt() {
        return tipo_pt;
    }

    public void setTipo_pt(String tipo_pt) {
        this.tipo_pt = tipo_pt;
    }

    public Cidade getCidade() {
        return cidade;
    }

    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }

}
