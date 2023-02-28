/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean;

import br.com.DAO.ListaDesejoDAO;
import br.com.DAO.ProdutoDAO;
import br.com.entidade.ListaDesejo;
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
public class ServletInserirListaDesejo extends HttpServlet {

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
            ArrayList<ListaDesejo> listadesejos = (ArrayList<ListaDesejo>) request.getSession().getAttribute("listadesejos");
            
            boolean jaexiste = false;
            
            if (listadesejos == null) {
                listadesejos = new ArrayList<ListaDesejo>();
            }

            String produto_id = request.getParameter("produto_id");

            ListaDesejo itemlist = new ListaDesejo();
            itemlist.setProduto_id(Integer.parseInt(produto_id));

            ProdutoDAO dao2 = new ProdutoDAO();
            Produto pr = dao2.BuscarPorId(itemlist.getProduto_id());

            if (pr != null) {
                itemlist.setProduto(pr);
            }

            ListaDesejoDAO dao = new ListaDesejoDAO();

            if (usuario != null) {
                itemlist.setUsuario_id(usuario.getId());

                listadesejos = dao.BuscarPorUsuarioId(usuario.getId());

                for (ListaDesejo listadesejo : listadesejos) {
                    if (listadesejo.getProduto_id() == itemlist.getProduto_id()) {
                        jaexiste = true;
                    }
                }

                if (jaexiste == true) {

                    HttpSession session = request.getSession();
                    session.setAttribute("listadesejos", listadesejos);
                    
                    request.setAttribute("msg", "Produto já adicionado");

                    request.getRequestDispatcher("listadesejos.jsp").forward(request, response);
                } else {
                    dao.Inserir(itemlist);

                    listadesejos = dao.BuscarPorUsuarioId(usuario.getId());

                    HttpSession session = request.getSession();
                    session.setAttribute("listadesejos", listadesejos);
                    
                    request.setAttribute("msg", "Produto adicionado a lista de desejos com sucesso");

                    request.getRequestDispatcher("listadesejos.jsp").forward(request, response);
                }
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
            Logger.getLogger(ServletInserirListaDesejo.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServletInserirListaDesejo.class.getName()).log(Level.SEVERE, null, ex);
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
