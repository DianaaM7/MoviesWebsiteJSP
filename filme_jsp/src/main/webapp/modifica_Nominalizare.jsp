<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica nominalizare</title>
        <link href="css/tabelaNominalizari.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <h1 align="center"> Modifica nominalizare:</h1>
        <br/>
        <form action="m1_Nominalizare.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdNominalizare:</b></td>
                    <td><b>Idfilm:</b></td>
                    <td><b>Titlu:</b></td>
                    <td><b>An aparitie:</b></td>
                    <td><b>Regizor:</b></td>
                    <td><b>Durata minute:</b></td>
                    <td><b>Nota IMDb:</b></td> 
                    <td><b>Idcategorie:</b></td>
                    <td><b>Nume categorie:</b></td>
                    <td><b>Titlu nominalizare:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeNominalizare();
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idnominalizare");
                %>
                <tr>
                    <td><input type="radio" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getLong("idfilm")%></td>
                    <td><%= rs.getString("titlu")%></td>
                    <td><%= rs.getInt("an_aparitie")%></td>
                    <td><%= rs.getString("regizor")%></td>
                    <td><%= rs.getInt("durata_minute")%></td>
                    <td><%= rs.getFloat("nota_imdb")%></td>
                    <td><%= rs.getLong("idcategorie")%></td>
                    <td><%= rs.getString("nume_categorie")%></td>
                    <td><%= rs.getString("titlu_nominalizare")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica">
            </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
        <p align="center"><a href="Tabela_Nominalizari.jsp"><b>Tabela Nominalizari</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </div>
    </body>
</html>
