<%-- 
    Document   : index
    Created on : 15/jan/2024, 13:14:27
    Author     : hp
--%>
<%@page import="Modelo.Bean.perfil"%>
<%@page import="Modelo.dao.perfilDAO"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Bean.Produto"%>
<%@page import="Modelo.dao.produtoDAO"%>
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
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>GameShop | Minha Conta</title>
    </head>
    <body>
        <header>
            <div><a href="index.jsp"><strong>Game</strong>Shop</a>
                <p>Venda seus jogos aqui</p>
            </div>
            <nav>
                <ul>
                     <li onclick="index()">Página inicial</li>
                    <li onclick="faleconosco()">Fale conosco</li>
                     <li onclick="login()"><a href="closesession.jsp"><button>Sair</button></a></li>

                </ul>
            </nav>
        </header>

        <section>
            <article><span>Meus jogos á venda</span><span onclick="abrirmodal()">Vender mais um jogo</span></article>
            <ul>
                  <%
                            try {
                                for (int i = 0; i < pList.size(); i++) { %>
                <li id="produto" class="produto"><a href="artigo.jsp?artigo=<%= pList.get(i).getIdproduto()%>&nome=<%= pList.get(i).getNomeProduto()%> ">
                        <div class="img-jogo"><img src="img/<%= pList.get(i).getFile_name() %>" alt=""></div>
                        <h1><%= pList.get(i).getNomeProduto() %></h1>
                        <h4><%= pList.get(i).getPreco() + " Kzs" %></h4></a></li> 
                         <% }
                            } catch (Exception e) {
                               
                                out.println(e);
                            }

                        %>
                        <%/*
                            try {
                                for (int i = 0; i < pList.size(); i++) {
                                    out.println("<li id= produto class= produto> <a href= >");
                                    out.println(" <div class= img-jogo ><img src= img/" + pList.get(i).getFile_name() + "></div>");
                                    out.println(" <h1>" + pList.get(i).getNome() + "</h1>");
                                    out.println("<h4>" + pList.get(i).getPreco() + "</h4></a>");
                                        out.println("</li>");
                                       
                                }
                            } catch (Exception e) {
                               
                                out.println(e);
                            }

                        */%>
            </ul>

        </section>
        <footer>GameShop - Todos Diretos Reservados 2024</footer>
        <!-- Janela modal upload -->
        <div class="janela-modal" id="janela-modal">
            <div class="modal2">
                <button class="fechar" id="fechar">X</button>

                <form class="telaupload" action="novoproduto.jsp" method="POST">
                    <label>Anuncie o seu jogo</label>
                    <div class="separate"><input type="text" name="nome" placeholder="Nome do Jogo">
                        <input type="text" name="preco" placeholder="preço ?">
                    </div>
                    <div class="separate">    
                        <select name="estado">
                            <option value="Novo">Novo</option>
                            <option value="Usado como novo">Usado como novo</option>
                            <option value="Usado como novo">Em bom estado</option>
                            <option value="Antigo">Antigo</option>

                        </select>
                        <select name="plataforma">
                            <option value="PlayStation 5">PlayStation 5</option>
                            <option value="PlayStation 4">PlayStation 4</option>
                            <option value="X Box One">X Box One</option>
                            <option value="PC">PC</option>
                            <option value="X Box Series X">X Box Series X</option>

                        </select></div>
                    <div class="separate">    
                        <input type="number" name="quantidade" placeholder="Quantidade">
                        <select name="categoria">
                            <option value="Aventura">Aventura</option>
                            <option value="Ação">Ação</option>
                            <option value="Desporto">Desporto</option>

                        </select></div>
                    <textarea name="descricao" placeholder="O que estás vendendo ?"></textarea>

                    <button type="submit">Upload</button>

                </form>
            </div>
        </div>

        <!-- Fim da Janela modal upload -->

        <script src="js/file.js" type="text/javascript"></script>
    </body>
</html>
