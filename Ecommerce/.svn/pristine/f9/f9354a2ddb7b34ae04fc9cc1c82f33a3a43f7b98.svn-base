/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.entidade.Carrinho;
import br.com.entidade.ListaDesejo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Italo
 */
public class ListaDesejoDAO extends DAO {

    public void Inserir(ListaDesejo cr) throws Exception {
        try {
            abrirBanco();
            String query = "INSERT INTO lista_desejo ( produto_id, usuario_id, created) VALUES(?, ?, now())";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, cr.getProduto_id());
            pst.setInt(2, cr.getUsuario_id());

            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }
    }

    public void Excluir(int id) throws Exception {
        try {
            abrirBanco();
            String query = "DELETE FROM lista_desejo WHERE id=?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, id);

            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }

    public ListaDesejo BuscarPorId(int id) throws Exception {
        try {
            abrirBanco();
            String query = "SELECT id, produto_id, created FROM lista_desejo WHERE id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, id);

            ResultSet rs = pst.executeQuery();

            ListaDesejo list = null;

            while (rs.next()) {
                list = new ListaDesejo();
                list.setId(rs.getInt("id"));
                list.setProduto_id(rs.getInt("produto_id"));

            }
            fecharBanco();
            return list;

        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }
    }

    public ArrayList<ListaDesejo> BuscarPorUsuarioId(int usuario_id) throws Exception {
        try {
            abrirBanco();
            String query = "SELECT id, produto_id, created FROM lista_desejo WHERE usuario_id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, usuario_id);

            ResultSet rs = pst.executeQuery();

            ProdutoDAO prd = new ProdutoDAO();

            ArrayList<ListaDesejo> lista = new ArrayList<>();

            while (rs.next()) {
                ListaDesejo list = new ListaDesejo();
                list.setId(rs.getInt("id"));
                list.setProduto_id(rs.getInt("produto_id"));
                list.setUsuario_id(usuario_id);

                list.setProduto(prd.BuscarPorId(list.getProduto_id()));

                lista.add(list);
            }
            fecharBanco();
            return lista;

        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }

    }

    public int BuscarTotalQuantidade(int usuario_id) throws Exception {
        try {
            abrirBanco();
            String query = "SELECT id FROM lista_desejo WHERE usuario_id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, usuario_id);

            ResultSet rs = pst.executeQuery();

            int total = 0;

            while (rs.next()) {
                total++;
            }
            return total;

        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }
    }

    public void MoverProdutoListaDesejoCarrinho(int produto_id) {
        try {
            abrirBanco();
            String query = "SELECT id, produto_id, usuario_id FROM lista_desejo WHERE produto_id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, produto_id);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Carrinho mycar = new Carrinho();
                mycar.setProduto_id(rs.getInt("produto_id"));
                mycar.setUsuario_id(rs.getInt("usuario_id"));
                mycar.setQnt(1);
                
                CarrinhoDAO carr = new CarrinhoDAO();
                carr.Inserir(mycar);
                
                ListaDesejoDAO ld = new ListaDesejoDAO();
                ld.Excluir(rs.getInt("id"));
            }

            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }

}
