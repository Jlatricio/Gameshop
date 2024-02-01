<%-- 
    Document   : uploadFile
    Created on : 2/jan/2024, 11:01:42
    Author     : hp
--%>

<%@page import="Modelo.dao.produtoDAO"%>
<%@page import="connectionfactory.conexao"%>
<%@ page import="java.io.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../estilo/StyleArea.css"/>
        <link rel="icon" href="../img/logo2.png"/>
        <title>Carregado</title>
       
    </head>
    <body>

<%
try { 
    produtoDAO prDAO = new produtoDAO();
    int i = prDAO.PegarLastId();
       
          String saveFile="";


String contentType = request.getContentType();
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
File ff = new File("C:\\Users\\hp\\Documents\\NetBeansProjects\\GameShop\\web\\img\\"+saveFile);
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
%><br><table border="2"><tr><td><b>O paciente foi cadastrado com sucesso</b></td></tr></table>
<%
    
Connection con = conexao.getConexao();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("Update produto set file_name = ? WHERE idProduto = ? ");

            stmt.setString(1, ff.getName());
                  stmt.setInt(2, i);

           
            stmt.executeUpdate();
          out.println("Salvo com sucesso");
        response.sendRedirect("minhaconta.jsp");
        

        } catch (SQLException ex) {
            out.println(ex);

        } finally {
            conexao.closeConexao(con, stmt);
        }
}
    } catch (IOException e) {
  out.println(e);
    }


%>


    </body>
</html>
