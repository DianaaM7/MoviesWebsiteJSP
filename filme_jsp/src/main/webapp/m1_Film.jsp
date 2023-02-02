<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica film</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="css/adauga.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <h1 align="center">Modifica film:</h1>
        <br/>
        <%
            jb.connect();
            String aux = request.getParameter("primarykey");
            if(aux != null){
            	ResultSet rs = jb.intoarceLinieDupaId("filme", "idfilm", java.lang.Long.parseLong(aux));
                rs.first();
                String titlu = rs.getString("titlu");
            	int an_aparitie = rs.getInt("an_aparitie");
                String regizor = rs.getString("regizor");
                int durata_minute = rs.getInt("durata_minute");
                float nota_imdb = rs.getFloat("nota_imdb");
                rs.close();
                jb.disconnect();
            
        %>
        <form action="m2_Film.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Idfilm:</td>
                    <td> <input type="text" name="idfilm" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Titlu:</td>
                    <td> <input type="text" name="titlu" size="30" value="<%= titlu%>"/></td>
                </tr>
                <tr>
                    <td align="right">An aparitie:</td>
                    <td> <select id="an_aparitie" name="an_aparitie">
					    <option selected="yes"> <%= an_aparitie%> </option>
					    <option value="1950">1950</option>
					    <option value="1951">1951</option>
					    <option value="1952">1952</option>
					    <option value="1953">1953</option>
					    <option value="1954">1954</option>
					    <option value="1955">1955</option>
					    <option value="1956">1956</option>
					    <option value="1957">1957</option>
					    <option value="1958">1958</option>
					    <option value="1959">1959</option>
					    <option value="1960">1960</option>
					    <option value="1961">1961</option>
					    <option value="1962">1962</option>
					    <option value="1963">1963</option>
					    <option value="1964">1964</option>
					    <option value="1965">1965</option>
					    <option value="1966">1966</option>
					    <option value="1967">1967</option>
					    <option value="1968">1968</option>
					    <option value="1969">1969</option>
					    <option value="1970">1970</option>
					    <option value="1971">1971</option>
					    <option value="1972">1972</option>
					    <option value="1973">1973</option>
					    <option value="1974">1974</option>
					    <option value="1975">1975</option>
					    <option value="1976">1976</option>
					    <option value="1977">1977</option>
					    <option value="1978">1978</option>
					    <option value="1979">1979</option>
					    <option value="1980">1980</option>
					    <option value="1981">1981</option>
					    <option value="1982">1982</option>
					    <option value="1983">1983</option>
					    <option value="1984">1984</option>
					    <option value="1985">1985</option>
					    <option value="1986">1986</option>
					    <option value="1987">1987</option>
					    <option value="1988">1988</option>
					    <option value="1989">1989</option>
					    <option value="1990">1990</option>
					    <option value="1991">1991</option>
					    <option value="1992">1992</option>
					    <option value="1993">1993</option>
					    <option value="1994">1994</option>
					    <option value="1995">1995</option>
					    <option value="1996">1996</option>
					    <option value="1997">1997</option>
					    <option value="1998">1998</option>
					    <option value="1999">1999</option>
					    <option value="2000">2000</option>
					    <option value="2001">2001</option>
					    <option value="2002">2002</option>
					    <option value="2003">2003</option>
					    <option value="2004">2004</option>
					    <option value="2005">2005</option>
					    <option value="2006">2006</option>
					    <option value="2007">2007</option>
					    <option value="2008">2008</option>
					    <option value="2009">2009</option>
					    <option value="2010">2010</option>
					    <option value="2011">2011</option>
					    <option value="2012">2012</option>
					    <option value="2013">2013</option>
					    <option value="2014">2014</option>
					    <option value="2015">2015</option>
					    <option value="2016">2016</option>
					    <option value="2017">2017</option>
					    <option value="2018">2018</option>
					    <option value="2019">2019</option>
					    <option value="2020">2020</option>
					    <option value="2021">2021</option>
					    <option value="2022">2022</option>
					</select> </td>
                </tr>
                <tr>
                    <td align="right">Regizor:</td>
                    <td> <input type="text" name="regizor" size="30" value="<%= regizor%>"/></td>
                </tr>
                <tr>
                    <td align="right">Durata minute:</td>
                    <td> <input type="number" min="10" max="420" name="durata_minute" size="30" value="<%= durata_minute%>"/></td>
                </tr>
                <tr>
                    <td align="right">Nota IMDb:</td>
                    <td> <input type="number" step="0.01" name="nota_imdb" min="1.0" max="10.0"  value="<%= nota_imdb%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica">
            </p>
        </form>
        <br/>
        <p align="center"><a href="Tabela_Filme.jsp"><b>Tabela Filme</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            </p>
        <% } else { %>
        <p align="center"><a href="Tabela_Filme.jsp"><b>Tabela Filme</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
        <br/>
        <br/>
        <br/>
        <h2 align="center">Selectati o linie pe care doriti sa o modificati inainte sa apasati butonul "Modifica" !</h2>
        <%} %>
    </div>
    </body>
</html>
