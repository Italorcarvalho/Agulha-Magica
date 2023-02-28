<%-- 
    Document   : cabecalho
    Author     : Italo
--%>

<%@page import="br.com.DAO.ListaDesejoDAO"%>
<%@page import="br.com.DAO.CarrinhoDAO"%>
<%@page import="br.com.entidade.Usuario"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    boolean logado = session.getAttribute("usuario") == null ? false : true;
    int admin = 0;
    int qtdtotal = 0;
    int qtdtotall = 0;
    if (logado) {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        CarrinhoDAO crdao = new CarrinhoDAO(); //objeto do tipo DAO
        ListaDesejoDAO ddao = new ListaDesejoDAO();
        admin = usuario.getAdmin();
        qtdtotal = crdao.BuscarTotalQuantidade(usuario.getId());
        qtdtotall = ddao.BuscarTotalQuantidade(usuario.getId());
    }
    String msg = request.getAttribute("msg") == null ? "" : (String) request.getAttribute("msg");
    boolean showmsg = false;
    if (msg != null && msg != "") {
        showmsg = true;
    }

%>

<script>
    const myTimeout = setTimeout(hide, 3000);

    function hide() {
        $("#msg").alert('close');

    }
</script>

<!-- Barra Superior Inicio -->
<div class="bottom-bar">
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col-md-3">
                <div class="logo">
                    <a href="index.jsp">
                        <img src="img/logo.png" alt="Logo">
                    </a>
                </div>
            </div>
            <div class="col-md-5">        
                <div class="search">
                    <form action="buscarprod.descricao" method="POST">
                        <input type="text" name="descricao" placeholder="Buscar produtos">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>
            </div>
            <div class="col-md-2">
                <% if (!logado) {%>
                <div class="user"> 
                    <a href="login.jsp" class="btn wishlist">
                        <i class="fa fa-heart"></i>                       
                    </a>
                    <a href="login.jsp" class="btn cart" >
                        <i class="fa fa-shopping-cart"></i>                       
                    </a>	
                </div>
                <% } else {%>
                <div class="user">
                    <a href="listadesejos.jsp" class="btn wishlist">
                        <i class="fa fa-heart"></i>
                        <span>(<%=qtdtotall%>)</span>
                    </a>
                    <a href="carrinho.jsp" class="btn cart" >
                        <i class="fa fa-shopping-cart"></i>
                        <span>(<%=qtdtotal%>)</span>
                    </a>	
                </div>
                <% }%>
            </div>                  
            <div class="col-md-1" >
                <% if (!logado) {%>
                <a href="login.jsp" type="button" class="btn btn-light">Entrar</a>
                <% }%>
            </div> 
            <div class="col-md-1">
                <% if (!logado) {%>
                <a href="cadastro.jsp" type="button" class="btn btn-light">Cadastro</a>  
                <% } else {%>
                <div class="dropdown">
                    <button class="btn btn-light dropdown-toggle" style="float: right;"  type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${usuario.getNome()}
                    </button>
                    <div class="dropdown-menu" style="min-width: 7rem !important;" aria-labelledby="dropdownMenuButton">
                        <% if (admin == 1) {%>
                        <a class="dropdown-item" href="http://localhost:8080/Ecommerce/buscarprodgen.id">Gerenciar Produtos</a>
                        <% }%>
                        <a class="dropdown-item" href="http://localhost:8080/Ecommerce/listar.pedidos">Meus Pedidos</a> 
                        <a class="dropdown-item" href="minhaconta.jsp">Minha conta</a>                        
                        <a class="dropdown-item" href="http://localhost:8080/Ecommerce/logout">Sair</a>                               
                    </div>
                </div>
                <% }%>
            </div>                      
        </div>         

    </div>  
</div>
<% if (showmsg == true) {%>
<div class="alert alert-success alert-dismissible fade show" role="alert" id="msg" style="margin-top: -30px; text-align: right;"> 
    ${msg}
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<% }%>     
<!-- Barra Superior Final -->    
