<%-- 
    Document   : teste
    Created on : May 28, 2018, 5:46:05 PM
    Author     : vinicius
--%>

<%@ page contentType="text/html; charset=iso-8859-1" pageEncoding="UTF-8" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>
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
            String url = "jdbc:postgresql://localhost:5432/tg";
            String username = "postgres";
            String password = "vini930716";
            String myDataField = null;
            String[] cotacao = request.getParameterValues("cotacaobox");
            String datainicial = request.getParameter("data_inicial");
            String datafinal = request.getParameter("data_final");
            String todoperiodo = request.getParameter("allperiodobox");
            String myQuery = "";
            int i = 0;
            for(i=0;i < cotacao.length;i++){
                if(i == 0){
                    if(cotacao[i].equals("1")){
                        myQuery = "SELECT * FROM produto WHERE nomeproduto LIKE 'Café%'";
                    }else if(cotacao[i].equals("2")){
                        myQuery = "SELECT * FROM produto WHERE nomeproduto LIKE 'Feijão%'";
                    }else if(cotacao[i].equals("3")){
                        myQuery = "SELECT * FROM produto WHERE nomeproduto LIKE 'Açúcar%'";
                    }else{
                        myQuery = "SELECT * FROM produto WHERE nomeproduto LIKE "+ cotacao[i];
                    }
                    
                }else{
                    if(cotacao[i].equals("1")){
                        myQuery = myQuery + "OR nomeproduto LIKE 'Café%'";
                    }else if(cotacao[i].equals("2")){
                        myQuery = myQuery + "OR nomeproduto LIKE 'Feijão%'";
                    }else if(cotacao[i].equals("3")){
                        myQuery = myQuery + "OR nomeproduto LIKE 'Açúcar%'";
                    }else{
                        myQuery = myQuery + "OR nomeproduto LIKE " + cotacao[i];
                    }
                }
            }
            if(datainicial != null && datafinal != null && todoperiodo == null){
                myQuery = myQuery + "AND datacorrente BETWEEN '" + datainicial + "' AND '" + datafinal+"'";
            }
            Connection myConnection = null;
            PreparedStatement myPreparedStatement = null;
            ResultSet myResultSet = null;
            Class.forName(driver).newInstance();
            myConnection = DriverManager.getConnection(url,username,password);
            myPreparedStatement = myConnection.prepareStatement(myQuery);
            myResultSet = myPreparedStatement.executeQuery();
            response.setContentType("text/csv");
            response.setHeader("Content-disposition","attachment; filename=" +filename);
            try{
                StringBuffer fw = new StringBuffer();
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
                fw.append(datafinal);
                fw.append(datainicial+'\n');
                while(myResultSet.next()){
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
//                InputStream in = new ByteArrayInputStream(fw.toString().getBytes("UTF-8"));
//                byte[] outputByte = new byte[1024];
//                int len;
//                while ((len = in.read(outputByte)) > 0){
//                    response.getOutputStream().write(outputByte, 0, len);
//                }
                OutputStream outputStream = response.getOutputStream();
                String outputResult = fw.toString();
                outputStream.write(outputResult.getBytes());
                outputStream.flush();
                outputStream.close();
//                in.close();
//                out.flush();
//                out.close();
                myConnection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
    </body>
</html>
