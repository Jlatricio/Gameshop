<%-- 
    Document   : index
    Created on : 16/jan/2024, 0:15:26
    Author     : hp
--%>

<%@page import="Modelo.Bean.faleconosco"%>
<%@page import="Modelo.dao.faleconoscoDAO"%>
<%@page import="Modelo.dao.perfilDAO"%>
<%@page import="Modelo.Bean.perfil"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Bean.Produto"%>
<%@page import="Modelo.dao.produtoDAO"%>
<%
    String username = (String) session.getAttribute("username");
    perfilDAO pDAO = new perfilDAO();
    List<perfil> pList = pDAO.usuario();
%>

<%
 String nivel = "";
            List<perfil> pList2 = pDAO.nivel((String) session.getAttribute("username"));
            for (int i = 0; i < pList2.size(); i++) {
                nivel += pList2.get(i).getTipo();
            }
          
try {
           if (username != null) {
                if (nivel.equals("usuario")) {
                     response.sendRedirect("../closesession.jsp");
                }
            }
          else {
                response.sendRedirect("../login.jsp");
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
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <title>GameShop |  Admin</title>
    </head>
    <body>
        <header>
            <div><a href="index.jsp"><strong>Game</strong>Shop</a>
                <p>Venda seus jogos aqui</p>
            </div>
            <nav>
                <ul>
                   
                    <li><a href="../closesession.jsp"><button >Sair</button></a></li>
                    
                </ul>
            </nav>
        </header>
        
        <section class="table-c">
            <ul id="produto" class="produto">
             
                
                        
                           
                            <table>
            <tr>
                <th>Id</th>
                <th>Nome</th>
                <th>Bilhete</th>
                <th>E-mail</th>
                <th>Contacto</th>
                <th>Eliminar usuario</th>
            </tr>
            
                <%
                        

                   try {
                            for (int i = 0; i < pList.size(); i++) {   
        out.println("<tr>"+ "<td>" + pList.get(i).getIdperfil() + "</td>" + 
                "<td>"+pList.get(i).getNome()+ "</td>" + 
                "<td>"+pList.get(i).getBilhete()+ "</td>" +
                        "<td>"+pList.get(i).getEmail()+ "</td>" +
                                "<td>"+pList.get(i).getContacto()+ "</td>" +
                   
                "<td>" + "<a href='../emilinarusuario.jsp?id=" +pList.get(i).getIdperfil()+ "&nome=" + pList.get(i).getNome()+"'> Excluir </a>" + "</td>" 
                        
                        + "</tr>");
                       }
                   }     catch (Exception e) {
                       }
                  %>
                 
                
            
            
            
              </table>
           

          
                
            
        </section>
                  <div class="msg">
                      <% faleconoscoDAO fcDAO = new faleconoscoDAO();
                            List<faleconosco> fcList= fcDAO.mensagem();
                            for (int i = 0; i < fcList.size(); i++) {
                                    
                                
                      %>
                      <div class="item-msg">
                          <h1> <%= fcList.get(i).getNome() %> </h1>
                          <span><%= fcList.get(i).getContacto() %> | <%= fcList.get(i).getEmail() %></span>
                          <p><%= fcList.get(i).getTexto() %></p>
                      </div>
                      <% } %>
                  </div>
        <footer>GameShop - Todos Diretos Reservados 2024</footer>
           <script src="js/file.js" type="text/javascript"></script>
    </body>
 
</html>
