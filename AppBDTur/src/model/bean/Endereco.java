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
public class Endereco {
    private int id;
    private String tipo_endereco;
    private String tipo_logradouro;

    
    private String nome_logradouro;
    private int numero_endereco;
    private String bairro;
    private String cep;
    private String complemento;

    public Endereco() {
    }

    public Endereco(int id, String tipo_logradouro, String nome_logradouro, int numero_endereco, String bairro, String cep) {
        this.id = id;
        this.tipo_logradouro = tipo_logradouro;
        this.nome_logradouro = nome_logradouro;
        this.numero_endereco = numero_endereco;
        this.bairro = bairro;
        this.cep = cep;
    }

    public Endereco(int id, String tipo_endereco, String tipo_logradouro, String nome_logradouro, int numero_endereco, String bairro, String cep, String complemento) {
        this.id = id;
        this.tipo_endereco= tipo_endereco;
        this.tipo_logradouro = tipo_logradouro;
        this.nome_logradouro = nome_logradouro;
        this.numero_endereco = numero_endereco;
        this.bairro = bairro;
        this.cep = cep;
        this.complemento = complemento;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getTipo_endereco() {
        return tipo_endereco;
    }

    public void setTipo_endereco(String tipo_endereco) {
        this.tipo_endereco = tipo_endereco;
    }

    public String getTipo_logradouro() {
        return tipo_logradouro;
    }

    public void setTipo_logradouro(String tipo_logradouro) {
        this.tipo_logradouro = tipo_logradouro;
    }

    public String getNome_logradouro() {
        return nome_logradouro;
    }

    public void setNome_logradouro(String nome_logradouro) {
        this.nome_logradouro = nome_logradouro;
    }

    public int getNumero_endereco() {
        return numero_endereco;
    }

    public void setNumero_endereco(int numero_endereco) {
        this.numero_endereco = numero_endereco;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }   
}
