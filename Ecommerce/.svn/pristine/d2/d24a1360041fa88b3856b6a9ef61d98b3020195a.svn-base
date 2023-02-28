<%@page import="br.com.entidade.Usuario"%>
<%@page import="br.com.DAO.CarrinhoDAO"%>

<!DOCTYPE html>
<html lang="en">
    <jsp:include page="cabecalho.jsp"/>

    <body>        
        <!-- Barra Superior Inicio -->
        <jsp:include page="barra_superior.jsp"/>
        <!-- Barra Superior Final -->    

        <!-- Carrinho Inicio -->
        <div class="cart-page">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="cart-page-inner">
                            <center>
                                <h4 class="display-8" style ="font-family:Times New Roman;"><i class="fa fa-shopping-cart"></i>  CARRINHO DE COMPRAS</h4>
                            </center>
                            <br>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Produto</th>
                                            <th>Preço Unitario</th>
                                            <th>Quantidade</th>                                            
                                            <th>Remover</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle">
                                        <jsp:include page="lista_carrinho.jsp"/>                                  
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="cart-page-inner">
                            <div class="row">                               
                                <div class="col-md-12">
                                    <div class="cart-summary">
                                        <div class="cart-content" style="margin-bottom: 15px;" >
                                            <%
                                                Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

                                                CarrinhoDAO crdao = new CarrinhoDAO(); //objeto do tipo DAO             
                                                double total = crdao.BuscarTotal(usuario.getId());
                                            %>   
                                            <h1>Resumo do carrinho</h1>											                                                                            
                                            <h2>Valor Total<span>R$ <%=total%></span></h2>
                                        </div>
                                        <div class="cart-btn">
                                            <a href="index.jsp" type="button" class="btn btn-light" style="float: left;">Adicionar mais</a>
                                            <a href="checkout.jsp" type="button" class="btn btn-light" style="float: right;">Continuar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Carrinho Final -->

        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <jsp:include page="bibliotecas_rodape.jsp"/>
    </body>
</html>
