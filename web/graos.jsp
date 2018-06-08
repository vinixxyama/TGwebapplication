<%-- 
    Document   : graos
    Created on : May 25, 2018, 6:22:19 PM
    Author     : vinicius
--%>
<%@ page contentType="text/html; charset=iso-8859-1" pageEncoding="UTF-8" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grãos</title>
        <script type="text/javascript">
            function goToNewPage()            {
                var url = document.getElementById('graos_menu').value;
                if (url != 'none') {
                    window.location = url;
                }
            }
        </script>
    </head>
    <body>
            <a href="teste.jsp">milho.csv</a>
        <h1></h1><table border="0">
            <tbody>
                <tr>
                    <td>
                        <strong>Escolha um Grão:</strong>
                        <select name="graos_menu" id="graos_menu">
                            <option value="milho.jsp">milho</option>
                            <option>soja</option>
                            <option>arroz</option>
                            <option>café</option>
                        </select>
                        <input type=button value="Go" name="submit" onclick="goToNewPage()">
                    </td>
                </tr>
            </tbody>
    </body>
</html>
