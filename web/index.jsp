<%-- 
    Document   : index
    Created on : 08-mar-2019, 9:55:27
    Author     : David
--%>
<%@page import="modelo.AutorDAO"%>
<%@page import="modelo.LibroDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Libro"%>
<%@page import="modelo.Autor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Biblioteca</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="./css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <h1>Gestion Biblioteca</h1>
        <%
               
                ArrayList<Libro> libros = LibroDAO.consultarLibro();
                out.print("<table border=1 cellspacing=0>");
                out.print("<tr><th>Título</th><th>Num. Paginas</th><th>Autor</th></tr>");
                for (Libro j : libros) {
                    out.print("<tr>");
                    out.print("<td>"+j.getTitulo()+"</td><td>"+j.getPaginas()+"</td><td>"+j.getAutor()+"</td>");
                    out.print("</tr>");
                }
                out.print("</table>");
                
                ArrayList<Autor> autores = AutorDAO.consultarAutor();
                out.print("<table border=1 cellspacing=0>");
                out.print("<tr><th>Autor</th></tr>");
                for (Autor j : autores) {
                    out.print("<tr>");
                    out.print("<td>"+j.getNombre()+"</td>");
                    out.print("</tr>");
                }
                out.print("</table>");
        %>
    </body>
</html>
