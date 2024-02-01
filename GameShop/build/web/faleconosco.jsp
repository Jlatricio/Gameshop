<%-- 
    Document   : login
    Created on : 16/jan/2024, 9:28:22
    Author     : hp
--%>

<%@page import="Modelo.Bean.perfil"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Bean.Produto"%>
<%@page import="Modelo.dao.perfilDAO"%>
<%@page import="Modelo.dao.produtoDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String username = (String) session.getAttribute("username");
    produtoDAO prDAO = new produtoDAO();
    List<Produto> pList = prDAO.produtoUsuario(username);
    

%>

<%
 perfilDAO pDAO = new perfilDAO();
 String nivel = "";
            List<perfil> pList2 = pDAO.nivel((String) session.getAttribute("username"));
            for (int i = 0; i < pList2.size(); i++) {
                nivel += pList2.get(i).getTipo();
            }
    
          
try {
          if (username != null) {
               if (nivel.equals("administrador")) {
                    response.sendRedirect("closesession.jsp");
                }
            }
          else{
                response.sendRedirect("login.jsp");
          }
    } catch (Exception e) {
        out.println(e);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>GameShop | Fale Connosco</title>
    </head>
    <body>
        <header>
            <div><a href="index.jsp"><strong>Game</strong>Shop</a>
                <p>Venda seus jogos aqui</p>
            </div>
            <nav>
                <ul>
                   <li onclick="index()">Inicio</li>
                    <li style="color: #8E4700" onclick="faleconosco()">Fale conosco</li>
                    <li onclick="login()"><a href="closesession.jsp"><button>Sair</button></a></li>
                </ul>
            </nav>
        </header>

        <section class="container-form">
            
            <form class="login"  action="validarmensagem.jsp" method="post">
                <label>Deixe a sua mensagem</label>
                <textarea name="texto" placeholder="Fale com conosco" required></textarea>
                <button type="submit">Enviar </button>
              
            </form>

          
        </section>
        <footer>GameShop - Todos Diretos Reservados 2024</footer>
        
        <script src="js/file.js" type="text/javascript"></script>
    </body>
</html>