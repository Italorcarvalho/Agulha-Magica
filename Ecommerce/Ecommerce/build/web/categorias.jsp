<%@page import="java.util.ArrayList"%>
<%@page import="br.com.entidade.Categoria"%>
<%@page import="br.com.DAO.CategoriaDAO"%>

<%-- 
    Document   : categorias
    Author     : Italo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Categorias Inicio -->
<nav class="navbar bg-light">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="index.jsp"><i class="fa fa-home"></i>Inicio</a>
        </li>
        <%
            CategoriaDAO ctdao = new CategoriaDAO(); //objeto do tipo DAO             
            ArrayList<Categoria> categorias = ctdao.selecionarTudo();  //Objeto do tipo Controle

            for (Categoria cat : categorias) {
        %>    
        <li class="nav-item">
            <a class="nav-link" title="<%=cat.getDescricao()%>" href="buscarprod.categoriaid?categoria_id=<%=cat.getId()%>"><i class="<%=cat.getIcone()%>" ></i><%=cat.getNome()%></a>
        </li>
        <% }%> 
    </ul>
</nav>

