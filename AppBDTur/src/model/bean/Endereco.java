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

    public Endereco(int id, String tipo_logradouro, String nome_logradouro, int numero_endereco, String bairro, String cep, String complemento) {
        this.id = id;
        this.tipo_logradouro = tipo_logradouro;
        this.nome_logradouro = nome_logradouro;
        this.numero_endereco = numero_endereco;
        this.bairro = bairro;
        this.cep = cep;
        this.complemento = complemento;
    }
    
    
}
