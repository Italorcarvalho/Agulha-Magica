/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean;

import br.com.DAO.CarrinhoDAO;
import br.com.DAO.PedidoDAO;
import br.com.entidade.Carrinho;
import br.com.entidade.EnumStatusPedido;
import br.com.entidade.ItemPedido;
import br.com.entidade.Pedido;
import br.com.entidade.Usuario;
import java.io.BufferedReader;
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
import org.json.JSONObject;

/**
 *
 * @author Italo
 */
public class ServletInserirPedido extends HttpServlet {

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

            if (usuario == null) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

            StringBuilder sb = new StringBuilder();
            BufferedReader br = request.getReader();
            String str;

            while ((str = br.readLine()) != null) {
                sb.append(str);
                System.out.println(str);
            }

            JSONObject jObj = new JSONObject(sb.toString());
            String token = jObj.getString("token");
            String issuer_id = jObj.getString("issuer_id");
            String payment_method_id = jObj.getString("payment_method_id");
            double transaction_amount = jObj.getDouble("transaction_amount");
            int installments = jObj.getInt("installments");
            String description = jObj.getString("description");

            JSONObject jObj2 = jObj.getJSONObject("payer");
            String email = jObj2.getString("email");

            JSONObject jObj3 = jObj2.getJSONObject("identification");
            String type = jObj3.getString("type");
            String number = jObj3.getString("number");

            CarrinhoDAO cart = new CarrinhoDAO();

            ArrayList<Carrinho> carrinho = cart.BuscarPorUsuarioId(usuario.getId());

            Pedido ped = new Pedido();
            ped.setStatus(EnumStatusPedido.Created);
            ped.setTotal(transaction_amount);
            ped.setUsuario_id(usuario.getId());

            ArrayList<ItemPedido> items = new ArrayList<>();

            for (Carrinho car : carrinho) {
                ItemPedido item = new ItemPedido();
                item.setProduto(car.getProduto());
                item.setQnt(car.getQnt());

                items.add(item);
            }

            ped.setProdutos(items);

            PedidoDAO peddao = new PedidoDAO();
            peddao.Inserir(ped);
            cart.LimparPorUsuarioId(usuario.getId());
            carrinho = cart.BuscarPorUsuarioId(usuario.getId());
            
            HttpSession session = request.getSession();
            session.setAttribute("carrinho", carrinho);
            
            request.getRequestDispatcher("listar.pedidos").forward(request, response);
        } catch (Exception e) {
            throw e;
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
            Logger.getLogger(ServletInserirPedido.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServletInserirPedido.class.getName()).log(Level.SEVERE, null, ex);
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
