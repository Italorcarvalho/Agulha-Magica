<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : listagem_produtos
    Author     : Italo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:forEach var = "prod" items = "${listaprod}">
    <div class="col-md-4">
        <div class="product-item">
            <div class="product-title">
                <a href="#">${prod.nome}</a>
            </div>
            <div class="product-image">
                <a href="buscarprod.id?id=${prod.id}">
                    <img src="${prod.img}">
                </a>
                <div class="product-action">                   
                    <a href="buscarprod.id?id=${prod.id}"><i class="fa fa-search"></i></a>
                    <a href="inserir.listadesejos?produto_id=${prod.id}"><i class="fa fa-heart"></i></a>
                </div>
            </div>
            <div class="product-price">
                <h3><span>R$</span>${prod.preco}</h3>
                <a class="btn" href="inserir.carrinho?produto_id=${prod.id}&qnt=1"><i class="fa fa-shopping-cart"></i>Comprar</a>
            </div>
        </div>
    </div>
</c:forEach>