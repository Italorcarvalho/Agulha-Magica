<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="cabecalho.jsp"/>

    <body>        
        <!-- Barra Superior Inicio -->
        <jsp:include page="barra_superior.jsp"/>
        <!-- Barra Superior Final -->    

        <!-- Lista de desejos Inicio -->
        <div class="wishlist-page">
            <div class="container-fluid">

                <div class="wishlist-page-inner">
                    <center>
                        <h4 class="display-8" style ="font-family:Times New Roman;">DETALHES DO PEDIDO</h4>
                    </center>                   
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>N�mero Pedido</th>
                                            <th>Status</th>
                                            <th>Total</th>
                                            <th>Data de Cria��o</th>
                                            <th>Metodo de Pagamento</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle">
                                        <tr>
                                            <td>${pedido.id}</td>
                                            <td>${pedido.getStatus().getStrValue()}</td>
                                            <td>R$ ${pedido.total}</td>
                                            <td><fmt:formatDate value="${pedido.created}" pattern="dd/MM/yyyy"/></td>
                                            <td>Mercado Pago</td>
                                        </tr>                                                                      
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th></th>
                                            <th>Produto</th>
                                            <th>Quantidade</th>
                                            <th>Pre�o</th>                                           
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle">
                                        <jsp:include page="lista_produtos_detalhes_pedidos.jsp"/>                                                                 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>                                                   
                </div>
            </div>
        </div>
        <!-- Lista de desejos Final -->

        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <jsp:include page="bibliotecas_rodape.jsp"/>
    </body>
</html>
