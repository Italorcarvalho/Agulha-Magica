/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.entidade;

public enum EnumStatusPedido {
    Created(0),
    Expired(1),
    Analysis(2),
    Paid(3),
    Completed(4),
    Refunded(5),
    Chargeback(6);

    private final int value;

    private EnumStatusPedido(int _value) {
        this.value = _value;
    }

    public int getValue() {
        return this.value;
    }

    public String getStrValue() {
        switch (this.value) {
            case 0:
                return "Criado";
            case 1:
                return "Expirado";
            case 2:
                return "Em Análise";
            case 3:
                return "Pago";
            case 4:
                return "Completo";
            case 5:
                return "Reembolsado";
            case 6:
                return "Estornado";
            default:
                return "";
        }
    }
}
