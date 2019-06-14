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
public class Restaurante {

    private int id_restaurante;
    private String nome_restaurante;
    private String categoria;
    private Cidade cidade;

    public Restaurante() {
    }

    public Restaurante(String nome_restaurante, String categoria, Cidade cidade) {
        this.nome_restaurante = nome_restaurante;
        this.categoria = categoria;
        this.cidade = cidade;
    }

    public int getId_restaurante() {
        return id_restaurante;
    }

    public void setId_restaurante(int id_restaurante) {
        this.id_restaurante = id_restaurante;
    }

    public String getNome_restaurante() {
        return nome_restaurante;
    }

    public void setNome_restaurante(String nome_restaurante) {
        this.nome_restaurante = nome_restaurante;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Cidade getCidade() {
        return cidade;
    }

    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }

}
