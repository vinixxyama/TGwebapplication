<%-- 
    Document   : index
    Created on : May 25, 2018, 4:42:07 PM
    Author     : vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="saco.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main</title>
        <script type="text/javascript">
<!--
            function SetAllCheckBoxes(FormName, FieldName, CheckValue)
            {
                if (!document.forms[FormName])
                    return;
                var objCheckBoxes = document.forms[FormName].elements[FieldName];
                if (!objCheckBoxes)
                    return;
                var countCheckBoxes = objCheckBoxes.length;
                if (!countCheckBoxes)
                    objCheckBoxes.checked = CheckValue;
                else
                    // set the check value for all check boxes
                    for (var i = 0; i < countCheckBoxes; i++)
                        objCheckBoxes[i].checked = CheckValue;
            }
// -->
        </script>
    </head>
    <body>
        <h1>Sistema de informação para a coleta de dados agropecuários</h1>
        <div class="w3-container">
            <div id="forms">
                <form method="get" action="teste.jsp" name="myForm">
                    <strong>Marque quais cotações deseja:</strong>
                    <br>
                    <strong>Grãos:</strong>
                    <label><input type="checkbox" name="cotacaobox" value="'Milho%'">Milho</label>
                    <label><input type="checkbox" name="cotacaobox" value="'Soja%'">Soja</label>
                    <label><input type="checkbox" name="cotacaobox" value="'Arroz%'">Arroz</label>
                    <label><input type="checkbox" name="cotacaobox" value="1">Café</label>
                    <label><input type="checkbox" name="cotacaobox" value="2">Feijão</label>
                    <label><input type="checkbox" name="cotacaobox" value="'Trigo%'">Trigo</label><br>
                    <input type="button" onclick="SetAllCheckBoxes('myForm', 'cotacaobox', true);" value="Todos o Grãos">
                    <br>
                    <strong>Carnes:</strong>
                    <label><input type="checkbox" name="cotacaobox1" value="'Frango%'">Aves</label>
                    <label><input type="checkbox" name="cotacaobox1" value="'Boi%' OR nomeproduto LIKE 'Bezerro%' OR nomeproduto LIKE 'Bezerra%'">Bovinos</label>
                    <label><input type="checkbox" name="cotacaobox1" value="'Búfalo%'">Bubalinos</label>
                    <label><input type="checkbox" name="cotacaobox1" value="'Ovino%'">Ovinos</label>
                    <label><input type="checkbox" name="cotacaobox1" value="'Caprino%' OR nomeproduto LIKE 'Cordeiro%'">Caprinos</label>
                    <label><input type="checkbox" name="cotacaobox1" value="'Suíno%' OR nomeproduto LIKE 'Leitão%'">Suinos</label><br>
                    <input type="button" onclick="SetAllCheckBoxes('myForm', 'cotacaobox1', true);" value="Todas as Carnes"><br>
                    <strong>Hortaliças:</strong>
                    <label><input type="checkbox" name="cotacaobox2" value="'Beterraba%'">Beterraba</label>
                    <label><input type="checkbox" name="cotacaobox2" value="'Cenoura%'">Cenoura</label>
                    <label><input type="checkbox" name="cotacaobox2" value="'Tomate%'">Tomate</label><br>
                    <input type="button" onclick="SetAllCheckBoxes('myForm', 'cotacaobox2', true);" value="Todas as Hortaliças"><br>
                    <strong>Frutas:</strong>
                    <label><input type="checkbox" name="cotacaobox3" value="'Maça%'">Maça</label>
                    <label><input type="checkbox" name="cotacaobox3" value="'Laranja%'">Laranja</label>
                    <label><input type="checkbox" name="cotacaobox3" value="'Banana%'">Banana</label>
                    <label><input type="checkbox" name="cotacaobox3" value="'Uva%'">Uva</label><br>
                    <input type="button" onclick="SetAllCheckBoxes('myForm', 'cotacaobox3', true);" value="Todas as Frutas"><br>
                    <strong>Diversos:</strong>
                    <label><input type="checkbox" name="cotacaobox4" value="3">Açúcar</label>
                    <label><input type="checkbox" name="cotacaobox4" value="4">Algodão</label>
                    <label><input type="checkbox" name="cotacaobox4" value="'Alho%'">Alho</label>
                    <label><input type="checkbox" name="cotacaobox4" value="5">Cana de Açúcar</label>
                    <label><input type="checkbox" name="cotacaobox4" value="'Batata%'">Batata</label>
                    <label><input type="checkbox" name="cotacaobox4" value="'Leite%'">Leite</label>
                    <label><input type="checkbox" name="cotacaobox4" value="'Mandioca%'">Mandioca</label>
                    <input type="button" onclick="SetAllCheckBoxes('myForm', 'cotacaobox4', true);" value="Todos os Diversos"><br>
                    <input type="button" onclick="SetAllCheckBoxes('myForm', 'cotacaobox', true);SetAllCheckBoxes('myForm', 'cotacaobox1', true);SetAllCheckBoxes('myForm', 'cotacaobox2', true);SetAllCheckBoxes('myForm', 'cotacaobox3', true);SetAllCheckBoxes('myForm', 'cotacaobox4', true);" value="Selecionar todos">
                    <input type="button" onclick="SetAllCheckBoxes('myForm', 'cotacaobox', false);SetAllCheckBoxes('myForm', 'cotacaobox1', false);SetAllCheckBoxes('myForm', 'cotacaobox2', false);SetAllCheckBoxes('myForm', 'cotacaobox3', false);SetAllCheckBoxes('myForm', 'cotacaobox4', false);" value="Desmarcar todos">
                    <br>
                    <br><strong>Escolha um período:</strong>
                    <br>
                    <label>Início:</label>
                    <input type="date" name="data_inicial"> 
                    <label>Fim:</label>
                    <input type="date" name="data_final"><br>
<!--                    <label><input type="checkbox" name="allperiodobox" value="tudo">Todo Periodo</label><br>-->
                    <label>*Para selecionar todo periodo não digite nenhuma data</label>
                    <br>
                    <input type=submit value="Baixar">
                </form>
            </div>
            <div id="sobre">
                <h3>Sobre</h3>
                <p>
                    Esta é uma aplicação para coleta de dados do site http://agrolink.com.br/cotacoes/, desenvolvida para o trabalho de graduação do curso de Ciência da Computação da UFScar - Sorocaba.

                </p>
            </div>
        </div>

        <div id="footer-site">
            <p><img src="ufscar.png" widht="70px" height="50px">Universidade Federal de São Carlos, Brasil.</p>            
            <p>O conteúdo disponível neste site não tem fins lucrativos. Todos os dados foram extraídos de fontes abertas (ou públicas).</p>
        </div>
    </body>
</html>
