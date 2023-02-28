/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean;

import br.com.DAO.CategoriaDAO;
import br.com.DAO.ProdutoDAO;
import br.com.entidade.Categoria;
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

/**
 *
 * @author Italo
 */
public class ServletBuscarProdutoPorIdGerenciamento extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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

            if (usuario == null || (usuario != null && usuario.getAdmin() != 1)) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

            String named = request.getParameter("named");
            String busca = request.getParameter("busca");

            boolean buscan = (busca != null ? Boolean.parseBoolean(busca) : false);

            ProdutoDAO prdao = new ProdutoDAO(); //objeto do tipo DAO       
            ArrayList<Produto> produtos = new ArrayList<Produto>();

            if (buscan == false) {
                produtos = prdao.selecionarTudo();  //Objeto do tipo Controle
            } else {
                produtos = prdao.BuscarPorDescricaoOuNome(named);
            }

            CategoriaDAO catdao = new CategoriaDAO();
            ArrayList<Categoria> categorias = catdao.selecionarTudo();

            request.setAttribute("produtos", produtos);
            request.setAttribute("categorias", categorias);

            request.getRequestDispatcher("gerenciarprodutos.jsp").forward(request, response);
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
            Logger.getLogger(ServletBuscarProdutoPorIdGerenciamento.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServletBuscarProdutoPorIdGerenciamento.class.getName()).log(Level.SEVERE, null, ex);
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
