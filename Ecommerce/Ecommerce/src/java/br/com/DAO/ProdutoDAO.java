/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.entidade.Categoria;
import br.com.entidade.Produto;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Italo
 */
public class ProdutoDAO extends DAO {

    public Produto BuscarPorId(int id) throws Exception {
        try {
            abrirBanco();
            String query = "SELECT id, categoria_id, nome, descricao, estoque, preco, img, created, modified FROM produto WHERE id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, id);

            ResultSet rs = pst.executeQuery();

            Produto pro = null;

            while (rs.next()) {
                pro = new Produto();
                pro.setId(rs.getInt("id"));
                pro.setCategoria_id(rs.getInt("categoria_id"));
                pro.setNome(rs.getString("nome"));
                pro.setDescricao(rs.getString("descricao"));
                pro.setEstoque(rs.getInt("estoque"));
                pro.setPreco(rs.getDouble("preco"));
                pro.setImg(rs.getString("img"));

            }
            fecharBanco();
            return pro;

        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }

    }

    public ArrayList<Produto> BuscarPorDescricaoOuNome(String descricao) throws Exception {
        try {
            abrirBanco();
            String query = "SELECT p.*, c.* FROM produto AS p INNER JOIN categoria AS c ON p.categoria_id = c.id WHERE p.descricao LIKE ? or p.nome LIKE ? ORDER BY p.created DESC";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setString(1, "%" + descricao + "%");
            pst.setString(2, "%" + descricao + "%");

            ResultSet rs = pst.executeQuery();

            ArrayList<Produto> lista = new ArrayList<>();

            while (rs.next()) {
                Produto pro = new Produto();
                pro.setId(rs.getInt("p.id"));
                pro.setCategoria_id(rs.getInt("p.categoria_id"));
                pro.setNome(rs.getString("p.nome"));
                pro.setDescricao(rs.getString("p.descricao"));
                pro.setEstoque(rs.getInt("p.estoque"));
                pro.setPreco(rs.getDouble("p.preco"));
                pro.setImg(rs.getString("p.img"));

                Categoria cat = new Categoria();
                cat.setId(rs.getInt("c.id"));
                cat.setNome(rs.getString("c.nome"));
                cat.setDescricao(rs.getString("c.descricao"));
                cat.setIcone(rs.getString("c.icone"));

                pro.setCategoria(cat);

                lista.add(pro);
            }
            fecharBanco();
            return lista;

        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }

    }

    public ArrayList<Produto> BuscarPorCategoriaId(int categoria_id) throws Exception {
        try {
            abrirBanco();
            String query = "SELECT id, categoria_id, nome, descricao, estoque, preco, img, created, modified FROM produto WHERE categoria_id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, categoria_id);

            ResultSet rs = pst.executeQuery();

            ArrayList<Produto> lista = new ArrayList<>();

            while (rs.next()) {
                Produto pro = new Produto();
                pro.setId(rs.getInt("id"));
                pro.setCategoria_id(rs.getInt("categoria_id"));
                pro.setNome(rs.getString("nome"));
                pro.setDescricao(rs.getString("descricao"));
                pro.setEstoque(rs.getInt("estoque"));
                pro.setPreco(rs.getDouble("preco"));
                pro.setImg(rs.getString("img"));

                lista.add(pro);
            }
            fecharBanco();
            return lista;

        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }

    }

    public ArrayList<Produto> selecionarTudo() throws Exception {
        try {
            abrirBanco();
            String query = "SELECT p.*, c.* FROM produto AS p INNER JOIN categoria AS c ON p.categoria_id = c.id ORDER BY p.created DESC";
            pst = (PreparedStatement) con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            ArrayList<Produto> lista = new ArrayList<>();
            while (rs.next()) {
                Produto pro = new Produto();
                pro.setId(rs.getInt("p.id"));
                pro.setCategoria_id(rs.getInt("p.categoria_id"));
                pro.setNome(rs.getString("p.nome"));
                pro.setDescricao(rs.getString("p.descricao"));
                pro.setEstoque(rs.getInt("p.estoque"));
                pro.setPreco(rs.getDouble("p.preco"));
                pro.setImg(rs.getString("p.img"));

                Categoria cat = new Categoria();
                cat.setId(rs.getInt("c.id"));
                cat.setNome(rs.getString("c.nome"));
                cat.setDescricao(rs.getString("c.descricao"));
                cat.setIcone(rs.getString("c.icone"));

                pro.setCategoria(cat);

                lista.add(pro);
            }
            fecharBanco();
            return lista;
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }
    }

    public void Inserir(Produto pr) throws Exception {
        try {
            abrirBanco();
            String query = "INSERT INTO produto (nome, categoria_id, estoque, preco, img, descricao) VALUES(?, ?, ?, ?, ?, ?)";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setString(1, pr.getNome());
            pst.setInt(2, pr.getCategoria_id());
            pst.setInt(3, pr.getEstoque());
            pst.setDouble(4, pr.getPreco());
            pst.setString(5, pr.getImg());
            pst.setString(6, pr.getDescricao());

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
            String query = "DELETE FROM produto WHERE id=?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, id);

            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }
    
    public void Alterar(Produto pd) throws Exception {
        try {
            abrirBanco();
            String query = "UPDATE produto SET  nome = ?, categoria_id = ?, estoque = ?, preco = ?, img = ?, descricao = ?, modified = NOW() WHERE id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setString(1, pd.getNome());
            pst.setInt(2, pd.getCategoria_id());
            pst.setInt(3, pd.getEstoque());
            pst.setDouble(4, pd.getPreco());
            pst.setString(5, pd.getImg());
            pst.setString(6, pd.getDescricao());
            pst.setInt(7, pd.getId());
            
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro" + e.getMessage());
            throw e;
        }
    }
}
