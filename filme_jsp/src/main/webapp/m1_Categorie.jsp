<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Categorii</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="css/adauga.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <h1 align="center">Modificati categorie:</h1>
        <br/>
        <%
            jb.connect();
            String aux = request.getParameter("primarykey");
            if(aux != null){
	            ResultSet rs = jb.intoarceLinieDupaId("categorii", "idcategorie", java.lang.Long.parseLong(aux));
	            rs.first();
	            String nume_categorie = rs.getString("nume_categorie");
	            rs.close();
	            jb.disconnect();
        %>
        <form action="m2_Categorie.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Idcategorie:</td>
                    <td> <input type="text" name="idcategorie" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume Categorie:</td>
                    <td> <input type="text" name="nume_categorie" size="30" value="<%= nume_categorie%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica">
            </p>
        </form>
        <br/>
        <p align="center"><a href="Tabela_Categorii.jsp"><b>Tabela Categorii</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            </p>
       <%} else {%>
       <br/>
        <p align="center"><a href="Tabela_Categorii.jsp"><b>Tabela Categorii</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            </p>
        <br/>
        <br/>
        <h2 align="center">Selectati o linie pe care doriti sa o modificati inainte sa apasati butonul "Modifica"</h2>
        <%} %>
    </div>
    </body>
</html>
