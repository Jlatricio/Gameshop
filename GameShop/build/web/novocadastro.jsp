<%-- 
    Document   : novocadastro
    Created on : 16/jan/2024, 10:55:41
    Author     : hp
--%>

<%@page import="Modelo.dao.perfilDAO"%>
<%@page import="Modelo.Bean.perfil"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validadno o cadastro</title>
    </head>
    <body>
        <%
            String nome = request.getParameter("nome");
            String username = request.getParameter("username");
            String bilhete = request.getParameter("bilhete");
            String email = request.getParameter("email");
            String contacto = request.getParameter("contacto");
            String senha = request.getParameter("senha");

            perfil p = new perfil();
            perfilDAO pDAO = new perfilDAO();

            p.setNome(nome);
            p.setUsername(username);
            p.setBilhete(bilhete);
            p.setContacto(Integer.parseInt(contacto));
            p.setEmail(email);
            p.setSenha(senha);
            try {
                    pDAO.Create(p);
                   session.setAttribute("info", "Cadastro feito com sucesso");
                   response.sendRedirect("login.jsp");
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    out.println(e);
                }

        %>
    </body>
</html>
