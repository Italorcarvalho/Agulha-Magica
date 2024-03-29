<%@page import="br.com.DAO.CarrinhoDAO"%>
<%@page import="br.com.entidade.Usuario"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Agulha M�gica | Artesanatos</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="agulha magica, agulha magica loja, loja online, loja de artesanatos, agulha magica alguem ja comprou, agulha magica � boa, agulha magica � seguro, agulha magica � confiavel, agulhamagica.com.br, www.agulhamagica.com.br, artesanatos, loja on-line" name="keywords">
        <meta content="Encontre aqui os melhores produtos artesanais" name="description">
        <meta name="language" content="pt-br" />
        <meta name="author" content="Agulha M�gica | Artesanatos" />

        <!-- Google Fontes -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

        <!-- CSS Livrarias -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/slick/slick.css" rel="stylesheet">
        <link href="lib/slick/slick-theme.css" rel="stylesheet">

        <!-- Templates -->
        <link href="css/style.css" rel="stylesheet">

        <!-- FavIcon -->
        <link rel="icon" type="image/x-icon" href="img/favicon.ico">

        <style>         
            .container-custom {
                -webkit-text-size-adjust: 100%;
                -webkit-tap-highlight-color: transparent;
                -blue: #007bff;
                -indigo: #6610f2;
                -purple: #6f42c1;
                -pink: #e83e8c;
                -red: #dc3545;
                -orange: #fd7e14;
                -yellow: #ffc107;
                -green: #28a745;
                -teal: #20c997;
                -cyan: #17a2b8;
                -white: #fff;
                -gray: #6c757d;
                -gray-dark: #343a40;
                -primary: #007bff;
                -secondary: #6c757d;
                -success: #28a745;
                -info: #17a2b8;
                -warning: #ffc107;
                -danger: #dc3545;
                -light: #f8f9fa;
                -dark: #343a40;
                -breakpoint-xs: 0;
                -breakpoint-sm: 576px;
                -breakpoint-md: 768px;
                -breakpoint-lg: 992px;
                -breakpoint-xl: 1200px;
                -font-family-sans-serif: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
                -font-family-monospace: SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace;
                word-wrap: break-word;
                box-sizing: border-box;
                font-family: inherit;
                overflow: visible;
                display: block;
                font-size: 1rem;
                font-weight: 400;
                line-height: 1.5;
                background-color: #fff;
                background-clip: padding-box;
                border-radius: .25rem;
                transition: none;
                height: 35px;
                padding: 0 15px;
                color: #999999;
                border: 1px solid #dddddd;
                width: 100%;
            }
            .max-width-custom {
                width: 100%;
            }
        </style>
    </head>

    <body>
        <!-- Barra Superior Inicio -->
        <jsp:include page="barra_superior.jsp"/>
        <!-- Barra Superior Final -->     

        <main class="mt-5 pt-4">
            <div class="container wow fadeIn">
                <div class="row">										
                    <div class="col-md-8 mb-4">						
                        <div class="card">						
                            <form class="card-body" id="form-checkout">
                                <h5><b>Endere�o de envio</b></h5>                               																
                                <div class="col-md-4">
                                    <h5>${usuario.nome}</h5>  
                                    <p>${usuario.endereco.cep} - ${usuario.endereco.endereco} ${usuario.endereco.numero} ${usuario.endereco.complemento} ${usuario.endereco.bairro} ${usuario.endereco.cidade} ${usuario.endereco.estado}</p>
                                </div>	
                                <hr>
                                <h5><b>Metodos de Pagamento</b></h5>                
                                <div class="d-block my-3">
                                    <div class="custom-control custom-radio">
                                        <input id="credito" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                                        <label class="custom-control-label" for="credito">Mercado Pago</label>
                                    </div>		
                                </div>
                                <hr>
                                <h5><b>Dados do cart�o</b></h5>							
                                <div class="row">
                                    <div class="col-md-6">
                                        <div id="form-checkout__cardNumber" class="container-custom"></div>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="form-checkout__cardholderName" class="form-control max-width-custom" />           
                                    </div>								
                                </div>
                                <div class="row">
                                    <div class="col-md-3">  
                                        <div id="form-checkout__expirationDate" class="container-custom"></div>
                                    </div>                                  
                                    <div class="col-md-3">  
                                        <div id="form-checkout__securityCode" class="container-custom"></div>
                                    </div>
                                    <div class="col-md-6">
                                        <select id="form-checkout__identificationType" class="form-control max-width-custom"></select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <select id="form-checkout__issuer" class="form-control max-width-custom"></select>
                                    </div>
                                    <div class="col-md-3">
                                        <select id="form-checkout__installments" class="form-control max-width-custom"></select>
                                    </div>
                                    <div class="col-md-6">  
                                        <input type="text" id="form-checkout__identificationNumber" class="form-control max-width-custom" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="email" id="form-checkout__cardholderEmail" class="form-control max-width-custom" />
                                    </div>
                                </div>
                                <progress value="0" class="max-width-custom" id="custom-progress">Carregando...</progress>
                                <hr class="mb-4">
                                <button id="form-checkout__submit" class="btn btn-primary btn-lg btn-block" type="submit">Finalizar compra</button>
                            </form>										
                        </div>										
                    </div>										
                    <div class="col-md-4 mb-4">
                        <%
                            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

                            CarrinhoDAO crdao = new CarrinhoDAO(); //objeto do tipo DAO             
                            double total = crdao.BuscarTotal(usuario.getId());
                            int totalp = crdao.BuscarTotalQuantidade(usuario.getId());
                        %>  
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="fa fa-shopping-cart"> Resumo da compra</span>
                            <span class="badge badge-dark badge-pill"><%=totalp%></span>
                        </h4>
                        <ul class="list-group mb-3 z-depth-1">
                            <c:forEach var = "item" items = "${carrinho}">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0"><span class="badge badge-dark badge-pill">${item.qnt} x</span> ${item.produto.nome}</h6>            
                                    </div>
                                    <span class="text-muted">R$ ${item.produto.preco}</span>
                                </li> 
                            </c:forEach>
                            <input id="paymentTotal" type="hidden" value="<%=total%>">
                            <li class="list-group-item d-flex justify-content-between">
                                <span><b>Total</b></span>
                                <strong>R$ <%=total%></strong>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </main>
        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <jsp:include page="bibliotecas_rodape.jsp"/>

        <script src="https://sdk.mercadopago.com/js/v2"></script>

        <script>
            const el = document.querySelector("#paymentTotal");
            const mp = new MercadoPago("TEST-7871115c-55d6-4bfa-b041-c29430d0620f");
            const cardForm = mp.cardForm({
                amount: el.value.toString(),
                iframe: true,
                form: {
                    id: "form-checkout",
                    cardNumber: {
                        id: "form-checkout__cardNumber",
                        placeholder: "N�mero do cart�o",
                        style: {
                            color: "#999999",
                            fontSize: "1rem",
                            fontWeight: "400",
                            fontFamily: "sans-serif",
                            height: "35px",
                            width: "100%"
                        }
                    },
                    expirationDate: {
                        id: "form-checkout__expirationDate",
                        placeholder: "DD/AA",
                        style: {
                            color: "#999999",
                            fontSize: "1rem",
                            fontWeight: "400",
                            fontFamily: "sans-serif",
                            height: "35px",
                            width: "100%"
                        }
                    },
                    securityCode: {
                        id: "form-checkout__securityCode",
                        placeholder: "CCV",
                        style: {
                            color: "#999999",
                            fontSize: "1rem",
                            fontWeight: "400",
                            fontFamily: "sans-serif",
                            height: "35px",
                            width: "100%"
                        }
                    },
                    cardholderName: {
                        id: "form-checkout__cardholderName",
                        placeholder: "Titular do cart�o"
                    },
                    issuer: {
                        id: "form-checkout__issuer",
                        placeholder: "Bandeira"
                    },
                    installments: {
                        id: "form-checkout__installments",
                        placeholder: "Parcelas"
                    },
                    identificationType: {
                        id: "form-checkout__identificationType",
                        placeholder: "CPF/CNPJ"
                    },
                    identificationNumber: {
                        id: "form-checkout__identificationNumber",
                        placeholder: "N�mero do CPF/CNPJ"
                    },
                    cardholderEmail: {
                        id: "form-checkout__cardholderEmail",
                        placeholder: "E-mail do titular"
                    }
                },
                callbacks: {
                    onFormMounted: error => {
                        if (error)
                            return console.warn("Form Mounted handling error: ", error);
                        console.log("Form mounted");
                    },
                    onSubmit: event => {
                        event.preventDefault();
                        const {
                            paymentMethodId: payment_method_id,
                            issuerId: issuer_id,
                            cardholderEmail: email,
                            amount,
                            token,
                            installments,
                            identificationNumber,
                            identificationType
                        } = cardForm.getCardFormData();

                        fetch("/Ecommerce/inserir.pedido", {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/json"
                            },
                            body: JSON.stringify({
                                token,
                                issuer_id,
                                payment_method_id,
                                transaction_amount: Number(amount),
                                installments: Number(installments),
                                description: "Compra Site Agulha Magica.",
                                payer: {
                                    email,
                                    identification: {
                                        type: identificationType,
                                        number: identificationNumber
                                    }
                                }
                            })
                        }).then(function (response) {
                            location.assign('http://localhost:8080/Ecommerce/listar.pedidos')
                        });
                    },
                    onFetching: (resource) => {
                        console.log("Fetching resource: ", resource);
                        // Animate progress bar
                        const progressBar = document.querySelector("#custom-progress");
                        progressBar.removeAttribute("value");
                        return () => {
                            progressBar.setAttribute("value", "0");
                        };
                    }
                }
            });
        </script>
    </body>
</html>
