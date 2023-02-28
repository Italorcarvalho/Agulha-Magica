/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.entidade;

import java.util.ArrayList;

/**
 *
 * @author Italo
 */
public class Pedido extends EntidadeBase {

    private int usuario_id;
    private EnumStatusPedido status;
    private double total;
    private ArrayList<ItemPedido> produtos;

    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

    public EnumStatusPedido getStatus() {
        return status;
    }

    public void setStatus(EnumStatusPedido status) {
        this.status = status;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public ArrayList<ItemPedido> getProdutos() {
        return produtos;
    }

    public void setProdutos(ArrayList<ItemPedido> produtos) {
        this.produtos = produtos;
    }
}
