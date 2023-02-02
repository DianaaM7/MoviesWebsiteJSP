<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorii</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="css/adauga.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <h1 align="center">Categorii</h1>
        <br/>
        <p align="center"><a href="Tabela_Categorii.jsp"><b>Tabela Categorii</b></a></p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
        <br/>
        <br/>
        <br/>
        <%
            jb.connect();
            long aux = java.lang.Long.parseLong(request.getParameter("idcategorie"));
            String nume_categorie = request.getParameter("nume_categorie");
            String[] valori = {nume_categorie};
            String[] campuri = {"nume_categorie"};
            jb.modificaTabela("categorii", "idcategorie", aux, campuri, valori);
            jb.disconnect();
        %>
        <h2 align="center">Modificarile au fost efectuate !</h2>
    </div>
    </body>
</html>
