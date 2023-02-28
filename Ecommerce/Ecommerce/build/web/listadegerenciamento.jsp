<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : listadegerenciamento
    Created on : 17/10/2022, 22:17:57
    Author     : Italo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:forEach var = "prod" items = "${produtos}">
<tr>                                                        
    <td class="align-middle text-center">
        <div class="bg-light d-inline-flex justify-content-center align-items-center align-top" style="width: 35px; height: 35px; border-radius: 3px;"><img src="${prod.img}" width="35" height="35"></div>
    </td>
    <td class="text-nowrap align-middle">${prod.nome}</td>
    <td class="text-nowrap align-middle">${prod.categoria.nome}</td>
    <td class="text-nowrap align-middle">${prod.estoque}</td>
    <td class="text-nowrap align-middle"><span>R$</span>${prod.preco}</td>
    <td class="text-nowrap align-middle" style="word-break: break-all; max-width: 150px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap">${prod.descricao}</td>
    <td class="text-center align-middle">
        <div class="btn-group align-top">
            <button type="button" class="btn"><a href="alterar.prodgen?id=${prod.id}">Editar</a></button>                                                        
            <button type="button" class="btn"><a href="remover.prodgen?id=${prod.id}"><i class="fa fa-trash"></i></a></button>                                                              
        </div>
    </td>
</tr>
</c:forEach>