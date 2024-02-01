<%-- 
    Document   : verificardados
    Created on : 16/jan/2024, 11:11:45
    Author     : hp
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.Bean.perfil"%>
<%@page import="Modelo.dao.perfilDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verificando dados de login</title>
    </head>
    <body>
        <%

            perfilDAO pDAO = new perfilDAO();
            String username = request.getParameter("username");
            String senha = request.getParameter("senha");
         
            
       
          
try {   
           if (pDAO.checkinLogin(username, senha)){
          
                 session.setAttribute("username", username);
                    String nivel = "";
            List<perfil> pList = pDAO.nivel((String) session.getAttribute("username"));
            for (int i = 0; i < pList.size(); i++) {
                nivel += pList.get(i).getTipo();
            }
                if (nivel.equals("usuario")) {
            
                    response.sendRedirect("minhaconta.jsp");
                } else if (nivel.equals("administrador")) {
               
                    response.sendRedirect("admin/index.jsp");
                }    } 
else {
                session.setAttribute("info", "Username ou Senha invalida");
                response.sendRedirect("login.jsp");
         
 }    } catch (Exception e) {
        out.println(e); 
    }


        %>
    </body>
</html>
