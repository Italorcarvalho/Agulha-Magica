<%-- 
    Document   : cabecalho
    Author     : Italo
--%>

<!DOCTYPE html>
<html lang="en">
    <jsp:include page="cabecalho.jsp"/>

    <body>
        <!-- Barra Superior Inicio -->
        <jsp:include page="barra_superior.jsp"/>
        <!-- Barra Superior Final -->         

        <!-- Minha Conta Inicio -->
        <div class="my-account">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                            <a class="nav-link active" id="account-nav" data-toggle="pill" href="#account-tab" role="tab"><i class="fa fa-user"></i>Dados Pessoais</a>						
                            <a class="nav-link" id="address-nav" data-toggle="pill" href="#address-tab" role="tab"><i class="fa fa-map-marker-alt"></i>Endere�os</a> 
                            <a class="nav-link" id="password-nav" data-toggle="pill" href="#password-tab" role="tab"><i class="fa fa-key"></i>Alterar Senha</a> 	
                            <a class="nav-link" href="http://localhost:8080/Ecommerce/logout"><i class="fa fa-sign-out-alt"></i>Sair</a>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane fade active show" id="account-tab" role="tabpanel" aria-labelledby="account-nav">
                                <h4>Dados Pessoais</h4>
                                <p class="form-tip">Todos os campos marcados com * s�o obrigat�rios.</p>  
                                <br>
                                <form action="alterar.usuario" method="POST" >
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>* Nome Completo:</label>
                                            <input class="form-control" type="text" id="nome" name="nome" value="${usuario.getNome()}" >
                                        </div>
                                        <div class="col-md-6">
                                            <label>* CPF:</label>
                                            <input type="text" class="form-control" id="cpf" name="cpf" placeholder="Ex.: 000.000.000-00"  maxlength="14" value="${usuario.getCpf()}" >
                                        </div>
                                        <div class="col-md-6">
                                            <label>* Nascimento:</label>
                                            <input class="form-control" type="text" id="nascimento" name="nascimento" placeholder="Ex.: 00/00/0000" maxlength="8" value="${usuario.getNascimentoStr()}" >
                                        </div>
                                        <div class="col-md-6">
                                            <label>Sexo:</label><br>
                                            <input type="radio" id="masculino" name="sexo" value="M" ${usuario.getSex().getValue() == 0 ? "checked" : ""}>
                                            <label for="male">Masculino</label>
                                            <input type="radio" id="feminino" name="sexo" value="F" ${usuario.getSex().getValue() == 1 ? "checked" : ""}>
                                            <label for="female">Feminino</label>
                                        </div>
                                        <div class="col-md-6">
                                            <label>* Email:</label>
                                            <input class="form-control" type="email" id="email" name="email" placeholder="exemplo@exemplo.com" value="${usuario.getEmail()}" >
                                        </div>
                                        <div class="col-md-6">
                                            <label>* Telefone:</label>
                                            <input type="text" class="form-control" id="telefone" name="telefone" placeholder="Ex.: (00)0000-0000"  maxlength="14" value="${usuario.getTelefone()}" >
                                        </div>
                                        <div class="col-md-12">
                                            <p></p>
                                            <button class="btn" type="submit">Atualizar Dados</button>                                      
                                        </div>
                                    </div> 
                                </form>    
                            </div>
                            <div class="tab-pane fade" id="address-tab" role="tabpanel" aria-labelledby="address-nav">
                                <h4>Endere�os</h4>
                                <p class="form-tip" >Todos os campos marcados com * s�o obrigat�rios.</p>     
                                <br>
                                <form action="novo.endereco" method="POST" accept-charset="UTF-8">
                                    <div class="form-row">
                                        <div class="form-group col-md-2">
                                            <label for="inputCep">* CEP</label>
                                            <input type="text" class="form-control" id="cep" name="cep" value="${usuario.getEndereco().getCep()}">
                                        </div>

                                        <div class="form-group col-md-10">
                                            <label for="inputAndereco">* Rua/Avenida</label>
                                            <input type="text" class="form-control" id="endereco" name="endereco" value="${usuario.getEndereco().getEndereco()}" >
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-2">
                                            <label for="inputNumero">* Numero</label>
                                            <input type="number" min="1" class="form-control" id="numero" name="numero" value="${usuario.getEndereco().getNumero()}">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputComplemento">Complemento</label>
                                            <input type="text" class="form-control" id="complemento" name="complemento" value="${usuario.getEndereco().getComplemento()}">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="inputBairro">* Bairro</label>
                                            <input type="text" class="form-control" id="bairro" name="bairro" value="${usuario.getEndereco().getBairro()}" >
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inputCidade">* Cidade</label>
                                            <input type="text" class="form-control" id="cidade" name="cidade" value="${usuario.getEndereco().getCidade()}">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputEstado">* Estado</label>
                                            <select class="form-control" id="estado" name="estado">
                                                <option ${usuario.getEndereco().getEstado() == null ? "selected disabled" : ""}>Selecione</option>
                                                <option value="AC" ${usuario.getEndereco().getEstado() == "AC" ? "selected" : ""}>Acre</option>
                                                <option value="AL" ${usuario.getEndereco().getEstado() == "AL" ? "selected" : ""}>Alagoas</option>
                                                <option value="AP" ${usuario.getEndereco().getEstado() == "AP" ? "selected" : ""}>Amap�</option>
                                                <option value="AM" ${usuario.getEndereco().getEstado() == "AM" ? "selected" : ""}>Amazonas</option>
                                                <option value="BA" ${usuario.getEndereco().getEstado() == "BA" ? "selected" : ""}>Bahia</option>
                                                <option value="CE" ${usuario.getEndereco().getEstado() == "CE" ? "selected" : ""}>Cear�</option>
                                                <option value="DF" ${usuario.getEndereco().getEstado() == "DF" ? "selected" : ""}>Distrito Federal</option>
                                                <option value="ES" ${usuario.getEndereco().getEstado() == "ES" ? "selected" : ""}>Esp�rito Santo</option>
                                                <option value="GO" ${usuario.getEndereco().getEstado() == "GO" ? "selected" : ""}>Goi�s</option>
                                                <option value="MA" ${usuario.getEndereco().getEstado() == "MA" ? "selected" : ""}>Maranh�o</option>
                                                <option value="MT" ${usuario.getEndereco().getEstado() == "MT" ? "selected" : ""}>Mato Grosso</option>
                                                <option value="MS" ${usuario.getEndereco().getEstado() == "MS" ? "selected" : ""}>Mato Grosso do Sul</option>
                                                <option value="MG" ${usuario.getEndereco().getEstado() == "MG" ? "selected" : ""}>Minas Gerais</option>
                                                <option value="PA" ${usuario.getEndereco().getEstado() == "PA" ? "selected" : ""}>Par�</option>
                                                <option value="PB" ${usuario.getEndereco().getEstado() == "PB" ? "selected" : ""}>Para�ba</option>
                                                <option value="PR" ${usuario.getEndereco().getEstado() == "PR" ? "selected" : ""}>Paran�</option>
                                                <option value="PE" ${usuario.getEndereco().getEstado() == "PE" ? "selected" : ""}>Pernambuco</option>
                                                <option value="PI" ${usuario.getEndereco().getEstado() == "PI" ? "selected" : ""}>Piau�</option>
                                                <option value="RJ" ${usuario.getEndereco().getEstado() == "RJ" ? "selected" : ""}>Rio de Janeiro</option>
                                                <option value="RN" ${usuario.getEndereco().getEstado() == "RN" ? "selected" : ""}>Rio Grande do Norte</option>
                                                <option value="RS" ${usuario.getEndereco().getEstado() == "RS" ? "selected" : ""}>Rio Grande do Sul</option>
                                                <option value="RO" ${usuario.getEndereco().getEstado() == "RO" ? "selected" : ""}>Rond�nia</option>
                                                <option value="RR" ${usuario.getEndereco().getEstado() == "RR" ? "selected" : ""}>Roraima</option>
                                                <option value="SC" ${usuario.getEndereco().getEstado() == "SC" ? "selected" : ""}>Santa Catarina</option>
                                                <option value="SP" ${usuario.getEndereco().getEstado() == "SP" ? "selected" : ""}>S�o Paulo</option>
                                                <option value="SE" ${usuario.getEndereco().getEstado() == "SE" ? "selected" : ""}>Sergipe</option>
                                                <option value="TO" ${usuario.getEndereco().getEstado() == "TO" ? "selected" : ""}>Tocantins</option>
                                            </select>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Salvar Endere�o</button>
                                    <b></b>
                                </form>
                                <br>                               
                            </div>
                            <div class="tab-pane fade" id="password-tab" role="tabpanel" aria-labelledby="password-nav">
                                <h4>Alterar Senha</h4>
                                <p class="form-tip">Todos os campos marcados com * s�o obrigat�rios.</p>  
                                <br>
                                <form action="nova.senha" method="POST">
                                    <div class="row">                                  
                                        <div class="col-md-6">
                                            <label for="inputPassword">* Senha Atual</label>
                                            <input class="form-control" type="password" id="senhaantiga" name="senhaantiga" >
                                        </div>
                                        <div class="col-md-6">
                                            <label for="inputPassword">* Nova Senha</label>
                                            <input class="form-control" type="password" id="senhanova" name="senhanova" >
                                        </div>
                                        <div class="col-md-12">
                                            <p></p>
                                            <button class="btn" type="submit">Atualizar Senha</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Minha Conta Final -->

        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <jsp:include page="bibliotecas_rodape.jsp"/>

        <script>

            $(document).ready(function () {
                $('#cpf').mask('000.000.000-00', {reverse: true});
                $('#telefone').mask('(00) 0000-0000');
                $('#nascimento').mask('00/00/0000');
                $('#cep').mask('00000-000');

                $("#cep").blur(function () {

                    //Nova vari�vel "cep" somente com d�gitos.
                    var cep = $("#cep").val().replace(/\D/g, '');

                    //Verifica se campo cep possui valor informado.
                    if (cep != "") {

                        //Express�o regular para validar o CEP.
                        var validacep = /^[0-9]{8}$/;

                        //Valida o formato do CEP.
                        if (validacep.test(cep)) {

                            //Consulta o webservice viacep.com.br/
                            $.getJSON("//viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

                                if (!("erro" in dados)) {
                                    //Atualiza os campos com os valores da consulta.
                                    $("#endereco").val(dados.logradouro);
                                    $("#bairro").val(dados.bairro);
                                    $("#cidade").val(dados.localidade);
                                    $("#estado").val(dados.uf);
                                } //end if.
                                else {
                                    //CEP pesquisado n�o foi encontrado.
                                    console.log("CEP n�o encontrado.");
                                }
                            });
                        } //end if.
                        else {
                            console.log("Formato de CEP inv�lido.");
                        }
                    } //end if.

                });

            });
        </script>
    </body>
</html>
