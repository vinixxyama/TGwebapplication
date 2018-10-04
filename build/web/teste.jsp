<%-- 
    Document   : teste
    Created on : May 28, 2018, 5:46:05 PM
    Author     : vinicius
--%>

<%@page import="java.net.URI"%>
<%@ page contentType="text/html; charset=iso-8859-1" pageEncoding="UTF-8" language="java" import="java.sql.* " %>
<%@ page import="java.io.*"
         import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>teste Page</title>
    </head>
    <body>
        <%
            String filename = "produto.csv";
            String driver = "org.postgresql.Driver";
            //String url = "jdbc:postgresql://localhost:5432/tg";
//            String username = "postgres";
//            String password = "vini930716";
            URI dbUri = new URI(System.getenv("DATABASE_URL"));
            String username = dbUri.getUserInfo().split(":")[0];
            String password = dbUri.getUserInfo().split(":")[1];
            String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
            
            String myDataField = null;
            String datainicial = request.getParameter("data_inicial");
            String datafinal = request.getParameter("data_final");
            //String todoperiodo = request.getParameter("allperiodobox");
            String myQuery = "";
            String[] aux1 = request.getParameterValues("cotacaobox");
            ArrayList<String> cotacao = new ArrayList<String>();
            if (aux1 != null) {
                for (int cont = 0; cont < aux1.length; cont++) {
                    cotacao.add(aux1[cont]);
                }
            }
            String[] aux2 = request.getParameterValues("cotacaobox1");
            if (aux2 != null) {
                for (int cont = 0; cont < aux2.length; cont++) {
                    cotacao.add(aux2[cont]);
                }
            }
            String[] aux3 = request.getParameterValues("cotacaobox2");
            if (aux3 != null) {
                for (int cont = 0; cont < aux3.length; cont++) {
                    cotacao.add(aux3[cont]);
                }
            }
            String[] aux4 = request.getParameterValues("cotacaobox3");
            if (aux4 != null) {
                for (int cont = 0; cont < aux4.length; cont++) {
                    cotacao.add(aux4[cont]);
                }
            }
            String[] aux5 = request.getParameterValues("cotacaobox4");
            if (aux5 != null) {
                for (int cont = 0; cont < aux5.length; cont++) {
                    cotacao.add(aux5[cont]);
                }
            }
            if (!cotacao.isEmpty()) {
                int i = 0;
                for (i = 0; i < cotacao.size(); i++) {
                    if (i == 0) {
                        if (cotacao.get(i).toString().equals("1")) {
                            myQuery = "SELECT * FROM produto WHERE (nomeproduto LIKE 'Café%'";
                        } else if (cotacao.get(i).toString().equals("2")) {
                            myQuery = "SELECT * FROM produto WHERE (nomeproduto LIKE 'Feijão%'";
                        } else if (cotacao.get(i).toString().equals("3")) {
                            myQuery = "SELECT * FROM produto WHERE (nomeproduto LIKE 'Açúcar%'";
                        } else if (cotacao.get(i).toString().equals("4")) {
                            myQuery = "SELECT * FROM produto WHERE (nomeproduto LIKE 'Algodão%'";
                        } else if (cotacao.get(i).toString().equals("5")) {
                            myQuery = "SELECT * FROM produto WHERE (nomeproduto LIKE 'Cana-de-Açúcar%'";
                        } else {
                            myQuery = "SELECT * FROM produto WHERE (nomeproduto LIKE " + cotacao.get(i).toString();
                        }
                    } else {
                        if (cotacao.get(i).toString().equals("1")) {
                            myQuery = myQuery + "OR nomeproduto LIKE 'Café%'";
                        } else if (cotacao.get(i).toString().equals("2")) {
                            myQuery = myQuery + "OR nomeproduto LIKE 'Feijão%'";
                        } else if (cotacao.get(i).toString().equals("3")) {
                            myQuery = myQuery + "OR nomeproduto LIKE 'Açúcar%'";
                        } else if (cotacao.get(i).toString().equals("4")) {
                            myQuery = myQuery + "OR nomeproduto LIKE 'Algodão%'";
                        } else if (cotacao.get(i).toString().equals("5")) {
                            myQuery = myQuery + "OR nomeproduto LIKE 'Cana-de-Açúcar%'";
                        } else {
                            myQuery = myQuery + "OR nomeproduto LIKE " + cotacao.get(i).toString();
                        }
                    }
                }
                myQuery = myQuery + ")";
                if (!datainicial.isEmpty() && !datafinal.isEmpty()) {
                    myQuery = myQuery + "AND datacorrente BETWEEN '" + datainicial + "' AND '" + datafinal + "'";
                }
                Connection myConnection = null;
                PreparedStatement myPreparedStatement = null;
                ResultSet myResultSet = null;
                Class.forName(driver).newInstance();
                myConnection = DriverManager.getConnection(dbUrl, username, password);
                myPreparedStatement = myConnection.prepareStatement(myQuery);
                myResultSet = myPreparedStatement.executeQuery();
                response.setContentType("text/csv");
                response.setHeader("Content-disposition", "attachment; filename=" + filename);
                try {
                    StringBuffer fw = new StringBuffer();

                    fw.append('\n');
                    fw.append("nomeproduto");
                    fw.append(',');
                    fw.append("nomecidade");
                    fw.append(',');
                    fw.append("datacorrente");
                    fw.append(',');
                    fw.append("UF");
                    fw.append(',');
                    fw.append("preco");
                    fw.append('\n');
                    while (myResultSet.next()) {
                        fw.append(myResultSet.getString(1));
                        fw.append(',');
                        fw.append(myResultSet.getString(2));
                        fw.append(',');
                        fw.append(myResultSet.getString(3));
                        fw.append(',');
                        fw.append(myResultSet.getString(4));
                        fw.append(',');
                        fw.append('"');
                        fw.append(myResultSet.getString(5));
                        fw.append('"');
                        fw.append('\n');
                    }
                    OutputStream outputStream = response.getOutputStream();
                    String outputResult = fw.toString();
                    outputStream.write(outputResult.getBytes());
                    outputStream.flush();
                    outputStream.close();
                    myConnection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>
        <p>Escolha alguma opção</p>
    </body>
</html>
