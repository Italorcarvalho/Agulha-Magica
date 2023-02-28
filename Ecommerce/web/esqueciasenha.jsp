<%-- 
    Document   : esqueciasenha
    Created on : 21/09/2022, 01:14:56
    Author     : Italo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Agulha Mágica | Artesanatos</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <div class="main">
            <!-- Sign up form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="img/chave2.jpg" alt="sing up image"></figure>
                            <a href="login.jsp" class="signup-image-link">Volta ao login</a>
                        </div>
                        <div class="signin-form">
                            <h2 class="form-title">Esqueceu a senha?</h2>
                            <p>Enviaremos um e-mail com mais informações sobre como redefinir sua senha</p><br>
                            <form method="POST" class="register-form" id="login-form">
                                <div class="form-group">
                                    <label for="your_name"><i class="zmdi zmdi-email"></i></label>
                                    <input type="text" name="your_name" id="your_name" placeholder="E-mail de cadastro"/>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signin" id="signin" class="form-submit" value="Enviar e-mail"/><br><br>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
