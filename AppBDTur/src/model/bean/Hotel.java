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
public class Hotel {
    private int id_hotel;
    private String nome_hotel;
    private int categoria;
    private Cidade cidade;
    private Restaurante restaurante;
    private Endereco endereco;

    public Hotel() {
    }

    public Hotel(String nome_hotel, int categoria, Cidade cidade, Endereco endereco) {
        this.nome_hotel = nome_hotel;
        this.categoria = categoria;
        this.cidade = cidade;
        this.endereco = endereco;
    }

    public Hotel(String nome_hotel, int categoria, Cidade cidade, Restaurante restaurante, Endereco endereco) {
        this.nome_hotel = nome_hotel;
        this.categoria = categoria;
        this.cidade = cidade;
        this.restaurante = restaurante;
        this.endereco = endereco;
    }

    public int getId_hotel() {
        return id_hotel;
    }

    public void setId_hotel(int id_hotel) {
        this.id_hotel = id_hotel;
    }

    public String getNome_hotel() {
        return nome_hotel;
    }

    public void setNome_hotel(String nome_hotel) {
        this.nome_hotel = nome_hotel;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public Cidade getCidade() {
        return cidade;
    }

    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }

    public Restaurante getRestaurante() {
        return restaurante;
    }

    public void setRestaurante(Restaurante restaurante) {
        this.restaurante = restaurante;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    
}
