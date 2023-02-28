/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.entidade.EnumStatusPedido;
import br.com.entidade.ItemPedido;
import br.com.entidade.Pedido;
import br.com.entidade.Produto;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Italo
 */
public class PedidoDAO extends DAO {

    public int BuscarProximoIdPedido() throws Exception {
        try {
            abrirBanco();
            String query = "SELECT max(id) AS nextid FROM pedido";
            pst = (PreparedStatement) con.prepareStatement(query);

            ResultSet rs = pst.executeQuery();

            int retorno = 0;

            while (rs.next()) {
                retorno = rs.getInt("nextid");
            }

            fecharBanco();
            return retorno + 1;
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }

    }

    public ArrayList<Pedido> BuscarPorUsuarioId(int usuario_id) throws Exception {
        try {
            abrirBanco();
            String query = "SELECT id, usuario_id, status, total, created FROM pedido WHERE usuario_id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, usuario_id);

            ResultSet rs = pst.executeQuery();

            ArrayList<Pedido> lista = new ArrayList<>();

            while (rs.next()) {
                Pedido ped = new Pedido();
                ped.setId(rs.getInt("id"));

                switch (rs.getString("status")) {
                    case "Expired":
                        ped.setStatus(EnumStatusPedido.Expired);
                        break;
                    case "Analysis":
                        ped.setStatus(EnumStatusPedido.Analysis);
                        break;
                    case "Paid":
                        ped.setStatus(EnumStatusPedido.Paid);
                        break;
                    case "Completed":
                        ped.setStatus(EnumStatusPedido.Completed);
                        break;
                    case "Refunded":
                        ped.setStatus(EnumStatusPedido.Refunded);
                        break;
                    case "Chargeback":
                        ped.setStatus(EnumStatusPedido.Chargeback);
                        break;
                    default:
                    case "Created":
                        ped.setStatus(EnumStatusPedido.Created);
                }

                ped.setTotal(rs.getDouble("total"));
                ped.setUsuario_id(usuario_id);

                lista.add(ped);
            }
            fecharBanco();
            return lista;

        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }

    }

    public Pedido BuscarDetalhesPorUsuarioId(int id) throws Exception {
        try {
            abrirBanco();
            String query = "SELECT p.id, p.status, p.total, p.created, pr.img, pr.nome, ip.qnt, pr.preco FROM produto AS pr INNER JOIN item_pedido AS ip ON ip.produto_id = pr.id INNER JOIN pedido AS p ON p.id = ip.pedido_id WHERE p.id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, id);

            ResultSet rs = pst.executeQuery();

            Pedido pedido = new Pedido();
            ArrayList<ItemPedido> lista = new ArrayList<>();

            while (rs.next()) {
                pedido.setId(rs.getInt("p.id"));

                switch (rs.getString("status")) {
                    case "Expired":
                        pedido.setStatus(EnumStatusPedido.Expired);
                        break;
                    case "Analysis":
                        pedido.setStatus(EnumStatusPedido.Analysis);
                        break;
                    case "Paid":
                        pedido.setStatus(EnumStatusPedido.Paid);
                        break;
                    case "Completed":
                        pedido.setStatus(EnumStatusPedido.Completed);
                        break;
                    case "Refunded":
                        pedido.setStatus(EnumStatusPedido.Refunded);
                        break;
                    case "Chargeback":
                        pedido.setStatus(EnumStatusPedido.Chargeback);
                        break;
                    default:
                    case "Created":
                        pedido.setStatus(EnumStatusPedido.Created);
                }

                pedido.setTotal(rs.getDouble("p.total"));
                pedido.setCreated(rs.getDate("p.created"));

                Produto p = new Produto();
                p.setImg(rs.getString("pr.img"));
                p.setNome(rs.getString("pr.nome"));
                p.setPreco(rs.getDouble("pr.preco"));

                ItemPedido item = new ItemPedido();
                item.setQnt(rs.getInt("ip.qnt"));
                item.setProduto(p);

                lista.add(item);
            }
            pedido.setProdutos(lista);
            fecharBanco();
            return pedido;
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }

    }

    public void Inserir(Pedido pd) throws Exception {
        try {
            abrirBanco();

            int nextid = this.BuscarProximoIdPedido();

            String query = "INSERT INTO pedido (id, usuario_id, status, total, created) VALUES(?, ?, ?, ?, now())";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, nextid);
            pst.setInt(2, pd.getUsuario_id());
            pst.setString(3, pd.getStatus().name());
            pst.setDouble(4, pd.getTotal());
            pst.execute();

            for (ItemPedido item : pd.getProdutos()) {
                String query2 = "INSERT INTO item_pedido (pedido_id, produto_id, qnt) VALUES(?, ?, ?)";
                pst = (PreparedStatement) con.prepareStatement(query2);
                pst.setInt(1, nextid);
                pst.setInt(2, item.getProduto().getId());
                pst.setInt(3, item.getQnt());
                pst.execute();
            }

            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }
    }

}
