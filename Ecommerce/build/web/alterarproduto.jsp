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
                                    <form class="form" action="alterar.prodgen" method="POST">
                                        <input type="hidden" name="id" value="${produto.id}">

                                        <div class="card-title" style="text-align: center;">
                                            <h2 class="mr-2"><span>Edição de Produto</span></h2>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label>Nome</label>
                                                            <input class="form-control" type="text" name="nome_prod" value="${produto.nome}" id="nome_prod">
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label>Categoria</label>                  
                                                            <select class="form-control" id="categoria_id" name="categoria_id">
                                                                <c:forEach var = "cat" items = "${categorias}">
                                                                    <option <c:if test = "${cat.id == produto.categoria_id}">selected</c:if> value="${cat.id}">${cat.nome}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label>Estoque</label>
                                                            <input class="form-control" type="number" min="0" id="estoque_prod" name="estoque_prod" value="${produto.estoque}">
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label>Preço</label>
                                                            <input class="form-control" type="number" min="0" id="preco_prod" name="preco_prod" value="${produto.preco}" >
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
                                                            <textarea class="form-control" rows="5" id="descricao_prod" name="descricao_prod">${produto.descricao}</textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col d-flex justify-content-end">          
                                                <button style="margin-right: 15px" class="btn btn-primary" type="button"><a href="buscarprodgen.id">Voltar</a></button>               
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
        <!-- Final Rodapé -->

        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <jsp:include page="bibliotecas_rodape.jsp"/>
    </body>
</html>
