<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Categorie</title>
        <link href="css/adauga.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <%
            String nume_categorie = request.getParameter("nume_categorie");
            if (nume_categorie != null) {
                jb.connect();
                jb.adaugaCategorie(nume_categorie);
                jb.disconnect();
        %>
        <h1 align="center">Categorii</h1>
        <br/>
        <p align="center"><a href="Tabela_Categorii.jsp"><b>Tabela Categorii</b></a></p>
        <p align="center"><a href="index.html"><b>Home</b></a> </p>
        <br/>
        <br/>
        <h2 align="center">Categoria a fost adaugata !</h2><%
        } else {
        %>
        <h1 align="center">Adauga categorie:</h1>
        <br/>
        <form action="adauga_Categorie.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Nume categorie:</td>
                    <td> <input type="text" name="nume_categorie" size="40" required="required"/></td>
                </tr>
            </table>
            <p align="center"><input type="submit" value="Adauga" /></p>
        </form>
        <br/>
        <p align="center"><a href="Tabela_Categorii.jsp"><b>Tabela Categorii</b></a> </p>
        <p align="center"><a href="index.html"><b>Home</b></a> </p>
        <br/>
        <%
            }
        %>
    </div>
    </body>
</html>
