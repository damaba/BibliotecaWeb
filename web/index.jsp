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
        <h1>Gestión Biblioteca</h1>
        <div id="container">
            <div class="a">
            <%

                    ArrayList<Libro> libros = LibroDAO.consultarLibro();
                    out.print("<table border=1 cellspacing=0>");
                    out.print("<tr><th>Título</th><th>Num. Paginas</th><th>Autor</th></tr>");
                    for (Libro j : libros) {
                        out.print("<tr>");
                        out.print("<td>"+j.getTitulo()+"</td><td>"+j.getPaginas()+"</td><td>"+j.getAutor()+"</td>");
                        out.print("<td><form action='./BorrarLibro' method='POST'><button type='submit' name='eliminar' id='eliminar' value='"+j.getId()+"'>Eliminar</button></form>");
                        out.print("</tr>");
                    }
                    out.print("</table>");
            %>       
            <h2>Insertar Libros</h2>
            <form action="./InsertarLibro" method="POST">
                <p> 
                    <label for="titulo">Titulo:</label>   
                    <input type="text"  name="titulo" id="titulo">
                </p>
                <p> 
                    <label for="paginas">Numero de Páginas</label>   
                    <input type="numer"  name="paginas" id="paginas">
                </p>
                <p> 
                    <label for="autor">Numero de Páginas</label>   
                    <select name="autor" id="autor">
                        <%   
                        ArrayList<Autor> listadoAutores = AutorDAO.consultarAutor();
                        for (Autor j : listadoAutores) {

                            out.print("<option value="+j.getId()+">"+j.getNombre()+"</option>");

                        }
                        %>
                    </select>
                </p>
                <p> 
                    <input type="submit" name="buttonSubmit" value="Agregar Libro"> 
                    <input type="reset" name="buttonReset" value="Reset">
                </p>
            </form>
            </div>
            <div class="a">
            <%   
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
            <h2>Insertar Autor</h2>
            <form action="./InsertarAutor" method="POST">
                <p> 
                    <label for="nombre">Nombre:</label>   
                    <input type="text"  name="nombre" id="nombre">
                </p>        
                <p> 
                    <input type="submit" name="buttonSubmit" value="Agregar Autor"> 
                    <input type="reset" name="buttonReset" value="Reset">
                </p>
            </form>
            </div>
        </div>
    </body>
</html>
