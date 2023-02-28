/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean;

import br.com.DAO.CarrinhoDAO;
import br.com.DAO.ProdutoDAO;
import br.com.entidade.Carrinho;
import br.com.entidade.Produto;
import br.com.entidade.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Italo
 */
public class ServletInserirCarrinho extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
            ArrayList<Carrinho> carrinho = (ArrayList<Carrinho>) request.getSession().getAttribute("carrinho");

            if (carrinho == null) {
                carrinho = new ArrayList<Carrinho>();
            }

            String qnt = request.getParameter("qnt");
            String produto_id = request.getParameter("produto_id");

            Carrinho itemcar = new Carrinho();
            itemcar.setQnt(Integer.parseInt(qnt));
            itemcar.setProduto_id(Integer.parseInt(produto_id));

            ProdutoDAO dao2 = new ProdutoDAO();
            Produto pr = dao2.BuscarPorId(itemcar.getProduto_id());

            if (pr != null) {
                itemcar.setProduto(pr);
            }

            CarrinhoDAO dao = new CarrinhoDAO();

            if (usuario != null) {
                itemcar.setUsuario_id(usuario.getId());

                dao.Inserir(itemcar);

                carrinho = dao.BuscarPorUsuarioId(usuario.getId());

                HttpSession session = request.getSession();
                session.setAttribute("carrinho", carrinho);
                
                request.setAttribute("msg", "Produto adicionado ao carrinho com sucesso");
                
                request.getRequestDispatcher("carrinho.jsp").forward(request, response);

                
            } else {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ServletInserirCarrinho.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ServletInserirCarrinho.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
