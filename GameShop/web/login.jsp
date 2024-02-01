<%-- 
    Document   : login
    Created on : 16/jan/2024, 9:28:22
    Author     : hp
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.Bean.perfil"%>
<%@page import="Modelo.dao.perfilDAO"%>
<%
 perfilDAO pDAO = new perfilDAO();
 String user = (String) session.getAttribute("username");
 String nivel = "";
            List<perfil> pList = pDAO.nivel((String) session.getAttribute("username"));
            for (int i = 0; i < pList.size(); i++) {
                nivel += pList.get(i).getTipo();
            }
            out.println(nivel);
          
try {
          if (user != "") {
                if (nivel.equals("usuario")) {
                    response.sendRedirect("minhaconta.jsp");
                } else if (nivel.equals("administrador")) {

                    response.sendRedirect("admin/index.jsp");
                }
            } 
    } catch (Exception e) {
        out.println(e);
    }

%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>GameShop | Login</title>
    </head>
    <body>
        <header>
            <div><a href="index.jsp"><strong>Game</strong>Shop</a>
                <p>Venda seus jogos aqui</p>
            </div>
            <nav>
                <ul>
                   <li onclick="index()">Inicio</li>
                    <li onclick="faleconosco()">Fale conosco</li>
                    <li onclick="login()"><button>Faça Login</button></li>
                </ul>
            </nav>
        </header>

        <section class="container-form">
            
            <form class="login"  action="verificardados.jsp" method="get">
                <label>Username</label>
                <input type="text" name="username" placeholder="Digite o seu username" required>
                <label>Password</label>
                <input type="password" name="senha" placeholder="Digite a sua password" required>
                <button type="submit">Login</button>
                <p onclick="cadastrar()">Criar uma conta</p>
                <p>${info}</p>
            </form>

            <form class="Cadastro" action="novocadastro.jsp" method="post">
                <label>Nome Completo</label>
                <input type="text" name="nome" placeholder="Digite o seu nome completo" required>
                <label>Username</label>
                <input type="text" name="username" placeholder="Qual será o seu username" required>
                <label>Bilhete de Identidade</label>
                <input type="text" name="bilhete" placeholder="Digite o seu bilhete de identidade" required>

                <label>Email</label>
                <input type="email" name="email" placeholder="Digite é o seu E-mail" required>
                <label>Contacto</label>
                <input type="text" name="contacto" placeholder="Digite o seu contacto" required>

                <label>Password</label>
                <input type="password" name="senha" placeholder="Digite uma password" required>
                <button type="submit">Cadastrar</button>

            </form>

        </section>
        <footer>GameShop - Todos Diretos Reservados 2024</footer>
        
        <script src="js/file.js" type="text/javascript"></script>
    </body>
</html>