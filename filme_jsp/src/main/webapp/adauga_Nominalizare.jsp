<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Nominalizare</title>
        <link href="css/adauga.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <%
            long idfilm, idcategorie;
            String id1, id2, titlu, regizor, nume_categorie, titlu_nominalizare;
            int an_aparitie, durata_minute;
            float nota_imdb;
            id1 = request.getParameter("idfilm");
            id2 = request.getParameter("idcategorie");
            titlu_nominalizare = request.getParameter("titlu_nominalizare");
            if (id1 != null) {
                jb.connect();
                jb.adaugaNominalizare(java.lang.Long.parseLong(id1), java.lang.Long.parseLong(id2), titlu_nominalizare);
                jb.disconnect();
        %>
        <h1 align="center">Nominalizari</h1>
        <br/>
        <p align="center"><a href="Tabela_Nominalizari.jsp"><b>Tabela Nominalizari</b></a></p>
        <p align="center"><a href="index.html"><b>Home</b></a> </p>
        <br/>
        <br/>
        <h2 align="center">Nominalizarea a fost adaugata !</h2><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("filme");
        ResultSet rs2 = jb.vedeTabela("categorii");
        %>
        <h1 align="center"> Adauga nominalizare:</h1>
        <br/>
        <form action="adauga_Nominalizare.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right"> Idfilm:</td>
                    <td>
			<SELECT NAME="idfilm">
                                <%
                                    while(rs1.next()){
                                        idfilm = rs1.getLong("idfilm");
                                        titlu = rs1.getString("titlu");
                                    	an_aparitie = rs1.getInt("an_aparitie");
                                        regizor = rs1.getString("regizor");
                                        durata_minute = rs1.getInt("durata_minute");
                                        nota_imdb = rs1.getFloat("nota_imdb");
                                %>
                                    <OPTION VALUE="<%= idfilm%>"><%= idfilm%>,<%= titlu%>,<%= an_aparitie%>,<%= regizor%>,<%= durata_minute%>,<%= nota_imdb%></OPTION>
                                <%
                                    }
                                %>
			</SELECT> </td>
                </tr>
                <tr>
                    <td align="right">Idcategorie:</td>
                    <td>
			<SELECT NAME="idcategorie">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idcategorie = rs2.getLong("idcategorie");
                                        nume_categorie = rs2.getString("nume_categorie");
                                %>
                                    <OPTION VALUE="<%= idcategorie%>"><%= idcategorie%>,<%= nume_categorie%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr>
                    <td align="right">Titlu nominalizare:</td>
                    <td> <input type="text" name="titlu_nominalizare" size="30" required="required"/></td>
                </tr>
            </table>
            <p align="center"> <input type="submit" value="Adauga"/></p>
            <br/>
            <p align="center"><a href="Tabela_Nominalizari.jsp"><b>Tabela Nominalizari</b></a> </p>
        	<p align="center"><a href="index.html"><b>Home</b></a> </p>
        	<br/>
        </form>
        <%
            }
        %>
    </div>
    </body>
</html>
