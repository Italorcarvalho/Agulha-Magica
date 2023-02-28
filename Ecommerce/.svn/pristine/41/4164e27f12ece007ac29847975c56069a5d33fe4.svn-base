<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : lista_carrinho
    Author     : Italo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:forEach var = "pedido" items = "${listapedidos}">
    <tr>
        <td>${pedido.id}</td>
        <td>${pedido.getStatus().getStrValue()}</td>
        <td>R$ ${pedido.total}</td>
        <td><a class="btn" href="buscarped.id?id=${pedido.id}"><i class="fa fa-eye"></i></a></td>
    </tr>    
</c:forEach>