<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica nominalizare</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="css/adauga.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <h1 align="center">Modifica nominalizare:</h1>
        <br/>
        <%
            jb.connect();
        	String titlu, regizor, nume_categorie, titlu_nominalizare;
        	int an_aparitie, durata_minute;
        	float nota_imdb;

            String aux = request.getParameter("primarykey");
            if(aux != null){
	            ResultSet rs = jb.intoarceNominalizareId(java.lang.Long.parseLong(aux));
	            rs.first();
	            long id1 = rs.getLong("idfilm");
	            long id2 = rs.getLong("idcategorie");
	
	            titlu = rs.getString("titlu");
	        	an_aparitie = rs.getInt("an_aparitie");
	            regizor = rs.getString("regizor");
	            durata_minute = rs.getInt("durata_minute");
	            nota_imdb = rs.getFloat("nota_imdb");
	            nume_categorie = rs.getString("nume_categorie");
	            titlu_nominalizare = rs.getString("titlu_nominalizare");
	
	            ResultSet rs1 = jb.vedeTabela("filme");
	            ResultSet rs2 = jb.vedeTabela("categorii");
	            long idfilm, idcategorie;

        %>
        <form action="m2_Nominalizare.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Idnominalizare:</td>
                    <td> <input type="text" name="idnominalizare" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Idfilm:</td>
                    <td> 
                        <SELECT NAME="idfilm">
                            <%
                                while (rs1.next()) {
                                    idfilm = rs1.getLong("idfilm");
                                    titlu = rs1.getString("titlu");
                                	an_aparitie = rs1.getInt("an_aparitie");
                                    regizor = rs1.getString("regizor");
                                    durata_minute = rs1.getInt("durata_minute");
                                    nota_imdb = rs1.getFloat("nota_imdb");
                                    if (idfilm != id1) {
                            %>
                            <OPTION VALUE="<%= idfilm%>"><%= idfilm%>,<%= titlu%>,<%= an_aparitie%>,<%= regizor%>,<%= durata_minute%>,<%= nota_imdb%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idfilm%>"><%= idfilm%>,<%= titlu%>,<%= an_aparitie%>,<%= regizor%>,<%= durata_minute%>,<%= nota_imdb%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">Idcategorie:</td>
                    <td> 
                        <SELECT NAME="idcategorie">
                            <%
                                while (rs2.next()) {
                                	idcategorie = rs2.getLong("idcategorie");
                                    nume_categorie = rs2.getString("nume_categorie");
                            if (idcategorie != id2) {
                            %>
                            <OPTION VALUE="<%= idcategorie%>"><%= idcategorie%>,<%= nume_categorie%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idcategorie%>"><%= idcategorie%>,<%= nume_categorie%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">Titlu nominalizare:</td>
                    <td> <input type="text" name="titlu_nominalizare" size="30" value="<%= titlu_nominalizare%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica">
            </p>
        </form>
        <br/>
        <p align="center"><a href="Tabela_Nominalizari.jsp"><b>Tabela Nominalizari</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            </p>
        <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
        <%} else{ %>
        <p align="center"><a href="Tabela_Nominalizari.jsp"><b>Tabela Nominalizari</b></a> </p>
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
