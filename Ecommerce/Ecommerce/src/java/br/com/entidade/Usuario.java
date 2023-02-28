/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.entidade;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Usuario extends EntidadeBase {

    private String nome;
    private String email;
    private String senha;
    private Date nascimento;
    private String telefone;
    private String cpf;
    private EnumSexo sex;
    private Endereco endereco;
    private int admin;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Date getNascimento() {
        return nascimento;
    }

    public String getNascimentoStr() { 
        String data = null;
        
        data = new SimpleDateFormat("dd/MM/yyyy").format(this.nascimento);
        
        return data;
    }

    public void setNascimento(Date nascimento) {
        this.nascimento = nascimento;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public EnumSexo getSex() {
        return sex;
    }

    public void setSex(EnumSexo sex) {
        this.sex = sex;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }
    
}
