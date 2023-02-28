<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : lista_carrinho
    Author     : Italo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:forEach var = "desejo" items = "${listadesejos}">
    <tr>
        <td>
            <div class="img">
                <a href="#"><img src="${desejo.produto.img}" alt="Image"></a>
                <p>${desejo.produto.nome}</p>
            </div>
        </td>
        <td>R$ ${desejo.produto.preco}</td>
        <td><a href="mover.listadesejos?produto_id=${desejo.produto.id}"><button class="btn-cart">ADICIONAR</button></a></td>
        <td><a class="btn" href="remover.listadesejos?id=${desejo.id}"><i class="fa fa-trash"></i></a></td>
    </tr>    
</c:forEach>