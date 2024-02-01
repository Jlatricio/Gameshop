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
    String nivel = "";
     perfilDAO pDAO = new perfilDAO();
            List<perfil> pList2 = pDAO.nivel((String) session.getAttribute("username"));
            for (int i = 0; i < pList2.size(); i++) {
                nivel += pList2.get(i).getTipo();
            }
    
    String username = (String) session.getAttribute("username");
    produtoDAO prDAO = new produtoDAO();
    List<Produto> pList = prDAO.produto();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>GameShop |  Para gamers</title>
    </head>
    <body>
        <header>
            <div><a href="index.jsp"><strong>Game</strong>Shop</a>
                <p>Venda seus jogos aqui</p>
            </div>
            <nav>
                <ul>
                    <li onclick="index()" style="color: #8E4700">Página inicial</li>
                    <li onclick="faleconosco()">Fale conosco</li>
                    <%
                        if(username == null){
                             
                           out.println("<li onclick= login()><button>Faça Login</button></li>");
                    }else{
                            if(nivel.equals("usuario")){
                                   out.println("<li><a style= color:#006262; href='minhaconta.jsp'> Minha Conta </a> </button></li>");
                        out.println("<li><button><a style= color:white; href='closesession.jsp'> Sair </a> </button> </li>");
                            }
                            else if(nivel.equals("administrador")){
                                 out.println("<li><a style= color:#006262; href='admin/index.jsp'> Minha Conta </a> </button></li>");
                        out.println("<li><button><a  href='closesession.jsp'> Sair </a> </button> </li>");
                            }
                                           }
                    %>
                    
                    
                </ul>
            </nav>
        </header>
        
        <section>
            <ul id="produto" class="produto">
             
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

            </ul>
            
        </section>
        <footer>GameShop - Todos Diretos Reservados 2024</footer>
           <script src="js/file.js" type="text/javascript"></script>
    </body>
 
</html>
