<%@page import="Modelo.dao.perfilDAO"%>
<%@page import="Modelo.Bean.perfil"%>
<% 
perfil p = new perfil();
perfilDAO pDAO = new perfilDAO();
int id = Integer.parseInt(request.getParameter("id"));

try {
    p.setIdperfil(id);
        pDAO.Delete(p);
       response.sendRedirect("admin/index.jsp");
    } catch (NumberFormatException e) {
    e.printStackTrace();
    }

%>