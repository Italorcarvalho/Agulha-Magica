/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.entidade.Endereco;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Italo
 */
public class EnderecoDAO extends DAO {

    public void Inserir(Endereco en) throws Exception {
        try {
            abrirBanco();
            String query = "INSERT INTO endereco (cep, endereco, numero, complemento, bairro, cidade, estado, usuario_id) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setString(1, en.getCep());
            pst.setString(2, en.getEndereco());
            pst.setInt(3, en.getNumero());
            pst.setString(4, en.getComplemento());
            pst.setString(5, en.getBairro());
            pst.setString(6, en.getCidade());
            pst.setString(7, en.getEstado());
            pst.setInt(8, en.getUsuario_id());

            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }

    public Endereco BuscarPorUsuarioId(int usuario_id) throws Exception {
        try {
            abrirBanco();
            String query = "SELECT id, cep, endereco, numero, complemento, bairro, cidade, estado, created, modified FROM endereco WHERE usuario_id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, usuario_id);

            ResultSet rs = pst.executeQuery();

            Endereco endereco = null;

            while (rs.next()) {
                endereco = new Endereco();
                endereco.setId(rs.getInt("id"));
                endereco.setCep(rs.getString("cep"));
                endereco.setEndereco(rs.getString("endereco"));
                endereco.setNumero(rs.getInt("numero"));
                endereco.setComplemento(rs.getString("complemento"));
                endereco.setBairro(rs.getString("bairro"));
                endereco.setCidade(rs.getString("cidade"));
                endereco.setEstado(rs.getString("estado"));

                endereco.setCreated(rs.getDate("created"));
                endereco.setModified(rs.getDate("modified"));
                endereco.setUsuario_id(usuario_id);

            }
            fecharBanco();
            return endereco;

        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }

    }
    
    public void Alterar(Endereco ed) throws Exception {
        try {
            abrirBanco();
            String query = "UPDATE endereco SET  cep = ?, endereco = ?, numero = ?, complemento = ?, bairro = ?, cidade = ?, estado = ?,  modified = NOW() WHERE id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setString(1, ed.getCep());
            pst.setString(2, ed.getEndereco());
            pst.setInt(3, ed.getNumero());
            pst.setString(4, ed.getComplemento());
            pst.setString(5, ed.getBairro());
            pst.setString(6, ed.getCidade());
            pst.setString(7, ed.getEstado());
            pst.setInt(8, ed.getId());
            
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro" + e.getMessage());
            throw e;
        }
    }

}
