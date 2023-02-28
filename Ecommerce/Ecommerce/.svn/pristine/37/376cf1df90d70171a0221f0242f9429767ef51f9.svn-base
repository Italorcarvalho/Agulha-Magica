<%-- 
    Document   : produtos_inicio
    Author     : Italo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.entidade.Produto"%>
<%@page import="br.com.DAO.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ProdutoDAO prdao = new ProdutoDAO(); //objeto do tipo DAO             
    ArrayList<Produto> produtos = prdao.selecionarTudo();  //Objeto do tipo Controle

    for (Produto prdt : produtos) {
%>  

<div class="col-lg-3">
    <div class="product-item">
        <div class="product-title">
            <a href="#"><%=prdt.getNome()%></a>
        </div>
        <div class="product-image">
            <a href="buscarprod.id?id=<%=prdt.getId()%>">
                <img src="<%=prdt.getImg()%>">
            </a>
            <div class="product-action">               
                <a href="buscarprod.id?id=<%=prdt.getId()%>"><i class="fa fa-search"></i></a>
                <a href="inserir.listadesejos?produto_id=<%=prdt.getId()%>"><i class="fa fa-heart"></i></a>
            </div>
        </div>
        <div class="product-price">
            <h3><span>R$</span><%=prdt.getPreco()%></h3>
            <a class="btn" href="inserir.carrinho?produto_id=<%=prdt.getId()%>&qnt=1"><i class="fa fa-shopping-cart"></i>Comprar</a>
        </div>
    </div>
</div>
<% }%> 