<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : gerenciarprodutos
    Created on : 10/10/2022, 18:51:11
    Author     : Italo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <jsp:include page="cabecalho.jsp"/>

    <body>
        <!-- Barra Superior Inicio -->
        <jsp:include page="barra_superior.jsp"/>
        <!-- Barra Superior Final -->

        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>

        <div class="container">
            <div class="row flex-lg-nowrap">              
                <div class="col">
                    <div class="row flex-lg-nowrap">
                        <div class="col mb-3">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title" style="text-align: center;">
                                        <h2 class="mr-2"><span>Gerenciamento de Produtos</span></h2>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered" style="font-size: 15px;">
                                                <thead>
                                                    <tr>                                                    
                                                        <th>Imagem</th>
                                                        <th class="sortable">Nome</th>
                                                        <th class="sortable">Categoria</th>
                                                        <th class="sortable">Estoque</th>
                                                        <th class="sortable">Preço</th>
                                                        <th class="sortable" style="max-width: 150px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap">Descrição</th>
                                                        <th>Ações</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <jsp:include page="listadegerenciamento.jsp"/>                                                                                
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="text-center px-xl-3">
                                        <button class="btn btn-block" type="button" data-toggle="modal" data-target="#user-form-modal-adicionar">Novo Produto</button>
                                    </div>
                                    <hr class="my-3">
                                    <div>
                                        <div class="form-group">
                                            <form action="buscarprodgen.id" method="POST">
                                                <input type="hidden" name="busca" value="true">
                                                <label>Buscar Produto:</label>
                                                <input class="form-control w-100" name="named" type="text" placeholder="Nome ou Descrição" value="">
                                                <button type="submit" class="btn" style="width: 100%;"><i class="fa fa-search"></i></button>   
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- User Form Modal -->
                    <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal-adicionar">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Novo Produto</h5>
                                    <button type="button" class="close" data-dismiss="modal">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="py-1">
                                        <form class="form" action="inserir.prodgen" method="POST">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Nome</label>
                                                                <input class="form-control" type="text" name="nome_prod" value="" id="nome_prod">
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Categoria</label>
                                                                <select class="form-control" id="categoria_id" name="categoria_id">
                                                                    <option value="" selected hidden>Selecione</option>
                                                                    <c:forEach var = "cat" items = "${categorias}">
                                                                        <option value="${cat.id}">${cat.nome}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Estoque</label>
                                                                <input class="form-control" type="number" min="0" id="estoque_prod" name="estoque_prod" value="">
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Preço</label>
                                                                <input class="form-control" type="number" min="0" id="preco_prod" name="preco_prod" value="" >
                                                            </div>
                                                        </div>
                                                    </div> 
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="custom-file">
                                                                <input class="custom-file-input" type="file" accept="image/png, image/jpeg" id="img_prod" name="img_prod" value="" >
                                                                <label class="custom-file-label">Imagem</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col mb-3">
                                                            <div class="form-group">
                                                                <label>Descrição</label>
                                                                <textarea class="form-control" rows="5" id="descricao_prod" name="descricao_prod"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col d-flex justify-content-end">
                                                    <button class="btn btn-primary" type="submit">Salvar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
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
