<%-- 
    Document   : novoproduto
    Created on : 16/jan/2024, 12:13:41
    Author     : hp
--%>

<%@page import="Modelo.dao.produtoDAO"%>
<%@page import="Modelo.Bean.Produto"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validando novo produto</title>
    </head>
    <body>
        <%
           String usuario = (String) session.getAttribute("username");
            String nome = request.getParameter("nome");
            String preco = request.getParameter("preco");
            String estado = request.getParameter("estado");
            String plataforma = request.getParameter("plataforma");
            String quantidade = request.getParameter("quantidade");
            String categoria = request.getParameter("categoria");            
            String descricao = request.getParameter("descricao");

            Produto pr = new Produto();
            produtoDAO prDAO = new produtoDAO();
            
            pr.setNome(nome);
            pr.setPreco(preco);
            pr.setEstado(estado);
            pr.setPlataforma(plataforma);
            pr.setQuantidade(Integer.parseInt(quantidade));
            pr.setDescricao(descricao);
            pr.setCategoria(categoria);
            pr.setUsername(usuario);
            
try {
        prDAO.novojogo(pr); 
     
    } catch (NumberFormatException e) {
        e.printStackTrace();
    }
            

        %>
        
        <FORM ENCTYPE="multipart/form-data" ACTION="uploadFile_1.jsp" METHOD=POST>
<center>
<table border="0" bgcolor=#ccFDDEE>
<tr>
<center><td colspan="2" align="center"><B>Carregar uma foto do jogo</B><center></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td><b>Selecione a foto:</b></td>
<td><INPUT NAME="file" TYPE="file"></td>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Carregar Imagem"> </td></tr>
</table>
</center>
</FORM>
    </body>
</html>
