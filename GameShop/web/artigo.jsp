<%-- 
    Document   : artigo
    Created on : 16/jan/2024, 23:41:38
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
        <title><%= request.getParameter("nome") %></title>
    </head>
    <body>
        <header>
            <div><a href="#"><strong>Game</strong>Shop</a>
                <p>Venda seus jogos aqui</p>
            </div>
            <nav>
                <ul>
                    <li onclick="index()">Página inicial</li>
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
            
            <div class="artigo">
                <%
                    int id = Integer.parseInt(request.getParameter("artigo"));
                produtoDAO ppDAO = new produtoDAO();
                List<Produto> ppList = ppDAO.produtover(id);  

        try {
            for (int i = 0; i < ppList.size(); i++) {
            
    
                %>
                <div class="img-artigo"><img src="img/<%= ppList.get(i).getFile_name() %>"></div>
                <div class="info-artigo"> <h1><%= ppList.get(i).getNomeProduto() %> | <%= ppList.get(i).getPreco() %> Kzs</h1>
                <h2>Email: <%= ppList.get(i).getEmail() %> | Telefone: <%= ppList.get(i).getContacto() %> | Quantidade: <%= ppList.get(i).getQuantidade() %></h2>
                
                <h2>Categoria: <%= ppList.get(i).getCategoria() %> | Plataforma: <%= ppList.get(i).getPlataforma() %></h2>
                <p> <%= ppList.get(i).getDescricao() %>  </p>
                </div>
                <% }}catch (Exception e) {
            }%>
            </div>
        </section>
        <footer>GameShop - Todos Diretos Reservados 2024</footer>
           <script src="js/file.js" type="text/javascript"></script>
    </body>
 
</html>
