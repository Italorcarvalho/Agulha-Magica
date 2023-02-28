<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : lista_carrinho
    Author     : Italo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:forEach var = "car" items = "${carrinho}">
    <tr>
        <td>
            <div class="img">
                <a href="#"><img src="${car.produto.img}" alt="Image"></a>
                <p>${car.produto.nome}</p>
            </div>
        </td>
        <td>R$ ${car.produto.preco}</td>
        <td>
            <div class="qty">
                <button class="btn-minus"><i class="fa fa-minus"></i></button>
                <input type="text" value="${car.qnt}">
                <button class="btn-plus"><i class="fa fa-plus"></i></button>
            </div>
        </td>    
        <td><a class="btn" href="remover.carrinho?id=${car.id}"><i class="fa fa-trash"></i></a></td>
    </tr> 
</c:forEach>