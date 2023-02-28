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
                        <h4 class="display-8" style ="font-family:Times New Roman;"><i class="fa fa-receipt"></i>  LISTA DE PEDIDOS</h4>
                    </center>                   
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Número Pedido</th>
                                            <th>Status</th>
                                            <th>Total</th>
                                            <th>Abrir Detalhes</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle">
                                        <jsp:include page="lista_pedidos.jsp"/>                                                                        
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
