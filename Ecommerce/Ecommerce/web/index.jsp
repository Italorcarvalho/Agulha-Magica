<%-- 
    Document   : index
    Author     : Italo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <jsp:include page="cabecalho.jsp"/>

    <body>
        <!-- Barra Superior Inicio -->
        <jsp:include page="barra_superior.jsp"/>
        <!-- Barra Superior Final -->       

        <!-- Categorias Inicio -->
        <div class="header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <jsp:include page="categorias.jsp"/>
                    </div>
                    <!-- Categorias Final -->

                    <!-- Produtos Iniciais Inicio -->
                    <div class="col-md-9">  
                        <div class="row align-items-center product-slider product-slider-3">
                            <jsp:include page="produtos_inicio.jsp"/>
                        </div>
                    </div>                
                </div>
            </div>
        </div>
        <!-- Produtos Iniciais Final -->


        <!-- Produtos Em Destaque Inicio -->
        <div class="featured-product product">
            <div class="container-fluid">
                <div class="section-header">
                    <h1>Produtos em destaque</h1>
                </div>
                <div class="row align-items-center product-slider product-slider-4">
                    <jsp:include page="produtos_inicio.jsp"/>
                </div>
            </div>
        </div>
        <!-- Produtos Em Destaque Final -->       



        <!-- Novos Produtos Inicio -->
        <div class="recent-product product">
            <div class="container-fluid">
                <div class="section-header">
                    <h1>Novos Produtos</h1>
                </div>
                <div class="row align-items-center product-slider product-slider-4">
                    <jsp:include page="produtos_inicio.jsp"/>
                </div>
            </div>
        </div>
        <p></p>
        <!-- Produtos Novos Final -->

        <!-- Serviços do Site Incio-->
        <div class="feature">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-6 feature-col">
                        <div class="feature-content">
                            <i class="fab fa-cc-mastercard"></i>
                            <h2>Pagamento Seguro</h2>
                            <p>

                            </p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 feature-col">
                        <div class="feature-content">
                            <i class="fa fa-truck"></i>
                            <h2>Entrega em todo o Brasil</h2>
                            <p>

                            </p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 feature-col">
                        <div class="feature-content">
                            <i class="fa fa-sync-alt"></i>
                            <h2>Garantia de até 90 dias</h2>
                            <p>

                            </p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 feature-col">
                        <div class="feature-content">
                            <i class="fa fa-comments"></i>
                            <h2>Suporte 24/7</h2>
                            <p>

                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Serviços do Site Final-->      

        <!-- Inicio Rodapé -->
        <div class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Atendimento</h2>
                            <div class="contact-info">
                                <p><i class="fa fa-envelope"></i>agulhamagica@gmail.com</p>
                                <p><i class="fa fa-phone"></i>(61)00000-0000</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Redes Sociais</h2>
                            <div class="contact-info">
                                <div class="social">
                                    <a href="https://twitter.com/Splinzado?t=BpPY5gB30ZfwlzR7LqVhbg&s=09" target="_blank"><i class="fab fa-twitter"></i></a>
                                    <a href=""><i class="fab fa-facebook-f"></i></a>
                                    <a href=""><i class="fab fa-instagram"></i></a>
                                    <a href=""><i class="fab fa-youtube"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Sobre</h2>
                            <ul>
                                <li><a href="quemsomos.jsp">Quem somos</a></li>
                                <li><a href="politica_privacidade.jsp">Política de Privacidade</a></li>
                                <li><a href="termos_condicoes.jsp">Termos & Condições</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Informações de compra</h2>
                            <ul>
                                <li><a href="politica_pagamento.jsp">Política de pagamento</a></li>
                                <li><a href="politica_envio.jsp">Política de envio</a></li>
                                <li><a href="politica_devolucao.jsp">Política de devolução</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row payment align-items-center">
                    <div class="col-md-6">
                        <div class="payment-method">
                            <h2>Nós aceitamos:</h2>
                            <img src="img/pagamento.png" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Final Rodapé -->

        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <jsp:include page="bibliotecas_rodape.jsp"/>
    </body>
</html>

