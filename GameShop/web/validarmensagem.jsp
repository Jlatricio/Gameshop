<%@page import="Modelo.dao.faleconoscoDAO"%>
<%@page import="Modelo.Bean.faleconosco"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    faleconosco fc = new faleconosco();
    faleconoscoDAO fcDAO = new faleconoscoDAO();
    
  String texto = request.getParameter("texto");
  String user = (String) session.getAttribute("username");
  
    fc.setUsuario(user);
    fc.setTexto(texto);
    
try {
        fcDAO.Create(fc);
        response.sendRedirect("minhaconta.jsp");
    } catch (Exception e) {
    }
%>