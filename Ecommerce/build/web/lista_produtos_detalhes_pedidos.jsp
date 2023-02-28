<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : lista_carrinho
    Author     : Italo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:forEach var = "item" items = "${listaprodutos}">
    <tr>
        <td class="align-middle text-center">
            <div class="bg-light d-inline-flex justify-content-center align-items-center align-top" style="width: 35px; height: 35px; border-radius: 3px;"><img src="${item.produto.img}" width="35" height="35"></div>
        </td>
        <td>${item.produto.nome}</td>
        <td>${item.qnt}</td>
        <td>R$ ${item.produto.preco}</td>       
    </tr>    
</c:forEach>
<tr>
    <td colspan="3" style="border: none">

    </td>
    <td>
        R$ ${pedido.total}
    </td>
</tr>
