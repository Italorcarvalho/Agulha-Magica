/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.entidade.EnumSexo;
import br.com.entidade.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO extends DAO {

    public void Inserir(Usuario us) throws Exception {
        try {
            abrirBanco();
            String query = "INSERT INTO usuario (nome, email, senha, cpf, nascimeto, sex, telefone, admin) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setString(1, us.getNome());
            pst.setString(2, us.getEmail());
            pst.setString(3, us.getSenha());
            pst.setString(4, us.getCpf());
            pst.setDate(5, new java.sql.Date(us.getNascimento().getTime()));
            pst.setString(6, us.getSex().name());
            pst.setString(7, us.getTelefone());
            pst.setInt(8, us.getAdmin());
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }
    }

    public Usuario Buscar(String email, String senha) throws Exception {
        try {
            abrirBanco();
            String query = "SELECT id, nome, email, senha, cpf, nascimeto, sex, telefone, created, modified, admin FROM usuario WHERE email = ? AND senha = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, senha);

            ResultSet rs = pst.executeQuery();

            Usuario usuario = null;

            while (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                //usuario.setSenha(rs.getString("senha"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setNascimento(rs.getDate("nascimeto"));

                switch (rs.getString("sex")) {
                    case "M":
                        usuario.setSex(EnumSexo.M);
                        break;
                    case "F":
                        usuario.setSex(EnumSexo.F);
                        break;
                    default:
                    case "U":
                        usuario.setSex(EnumSexo.U);
                }
                usuario.setTelefone(rs.getString("telefone"));
                usuario.setCreated(rs.getDate("created"));
                usuario.setModified(rs.getDate("modified"));
                usuario.setAdmin(rs.getInt("admin"));

            }
            fecharBanco();
            return usuario;

        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }

    }

    public Usuario BuscarPorId(int id, boolean devolveSenha) throws Exception {
        try {
            abrirBanco();
            String query = "SELECT id,nome, email, senha, cpf, nascimeto, sex, telefone,created,modified,admin FROM usuario WHERE id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, id);

            ResultSet rs = pst.executeQuery();

            Usuario usuario = null;

            while (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                if (devolveSenha) {
                    usuario.setSenha(rs.getString("senha"));
                }
                usuario.setCpf(rs.getString("cpf"));
                usuario.setNascimento(rs.getDate("nascimeto"));

                switch (rs.getString("sex")) {
                    case "M":
                        usuario.setSex(EnumSexo.M);
                        break;
                    case "F":
                        usuario.setSex(EnumSexo.F);
                        break;
                    default:
                    case "U":
                        usuario.setSex(EnumSexo.U);
                }
                usuario.setTelefone(rs.getString("telefone"));
                usuario.setCreated(rs.getDate("created"));
                usuario.setModified(rs.getDate("modified"));
                usuario.setAdmin(rs.getInt("admin"));
                

            }
            fecharBanco();
            return usuario;

        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            throw e;
        }

    }

    public void Alterar(Usuario us) throws Exception {
        try {
            abrirBanco();
            String query = "UPDATE usuario SET nome = ?, email = ?, cpf = ?, nascimeto = ?, sex = ?, telefone = ?, modified = NOW() WHERE id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setString(1, us.getNome());
            pst.setString(2, us.getEmail());
            pst.setString(3, us.getCpf());
            pst.setDate(4, new java.sql.Date(us.getNascimento().getTime()));
            pst.setString(5, us.getSex().name());
            pst.setString(6, us.getTelefone());
            pst.setInt(7, us.getId());
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro" + e.getMessage());
            throw e;
        }
    }

    public void AlterarSenha(int id, String senhaNova) throws Exception {
        try {
            abrirBanco();
            String query = "UPDATE usuario SET senha = ?, modified = NOW() WHERE id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setString(1, senhaNova);
            pst.setInt(2, id);
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro" + e.getMessage());
            throw e;
        }
    }
}
