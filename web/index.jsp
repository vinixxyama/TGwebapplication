<%-- 
    Document   : index
    Created on : May 25, 2018, 4:42:07 PM
    Author     : vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
<!--
function SetAllCheckBoxes(FormName, FieldName, CheckValue)
{
	if(!document.forms[FormName])
		return;
	var objCheckBoxes = document.forms[FormName].elements[FieldName];
	if(!objCheckBoxes)
		return;
	var countCheckBoxes = objCheckBoxes.length;
	if(!countCheckBoxes)
		objCheckBoxes.checked = CheckValue;
	else
		// set the check value for all check boxes
		for(var i = 0; i < countCheckBoxes; i++)
			objCheckBoxes[i].checked = CheckValue;
}
// -->
</script>
    </head>
    <body>
        <h1>Sistema de informação para a coleta de dados agropecuários</h1>
        <form method="get" action="teste.jsp" name="myForm">
            <strong>Marque quais cotações deseja:</strong>
            <br>
            <strong>Grãos:</strong>
            <label><input type="checkbox" name="cotacaobox" value="'Milho%'">Milho</label>
            <label><input type="checkbox" name="cotacaobox" value="'Soja%'">Soja</label>
            <label><input type="checkbox" name="cotacaobox" value="'Arroz%'">Arroz</label>
            <label><input type="checkbox" name="cotacaobox" value="1">Café</label>
            <label><input type="checkbox" name="cotacaobox" value="2">Feijão</label>
            <label><input type="checkbox" name="cotacaobox" value="'Trigo%'">Trigo</label>
            <br>
            <strong>Carnes:</strong>
            <label><input type="checkbox" name="cotacaobox" value="'Frango%'">Aves</label>
            <label><input type="checkbox" name="cotacaobox" value="'Boi%' OR nomeproduto LIKE 'Bezerro%' OR nomeproduto LIKE 'Bezerra%'">Bovinos</label>
            <label><input type="checkbox" name="cotacaobox" value="'Búfalo%'">Bubalinos</label>
            <label><input type="checkbox" name="cotacaobox" value="'Ovino%'">Ovinos</label>
            <label><input type="checkbox" name="cotacaobox" value="'Caprino%' OR nomeproduto LIKE 'Cordeiro%'">Caprinos</label>
            <label><input type="checkbox" name="cotacaobox" value="'Suíno%' OR nomeproduto LIKE 'Leitão%'">Suinos</label><br>
            <strong>Hortaliças:</strong>
            <label><input type="checkbox" name="cotacaobox" value="'Beterraba%'">Beterraba</label>
            <label><input type="checkbox" name="cotacaobox" value="'Cenoura%'">Cenoura</label>
            <label><input type="checkbox" name="cotacaobox" value="'Tomate%'">Tomate</label><br>
            <strong>Frutas:</strong>
            <label><input type="checkbox" name="cotacaobox" value="'Maça%'">Maça</label>
            <label><input type="checkbox" name="cotacaobox" value="'Laranja%'">Laranja</label>
            <label><input type="checkbox" name="cotacaobox" value="'Banana%'">Banana</label>
            <label><input type="checkbox" name="cotacaobox" value="'Uva%'">Uva</label><br>
            <strong>Diversos:</strong>
            <label><input type="checkbox" name="cotacaobox" value="3">Açúcar</label>
            <label><input type="checkbox" name="cotacaobox" value="'Algodão%'">Algodão</label>
            <label><input type="checkbox" name="cotacaobox" value="'Alho%'">Alho</label>
            <label><input type="checkbox" name="cotacaobox" value="'Cana-de-Açúcar%'">Cana de Açúcar</label>
            <label><input type="checkbox" name="cotacaobox" value="'Batata%'">Batata</label>
            <label><input type="checkbox" name="cotacaobox" value="'Leite%'">Leite</label>
            <label><input type="checkbox" name="cotacaobox" value="'Mandioca%'">Mandioca</label>
            <br><input type="button" onclick="SetAllCheckBoxes('myForm', 'cotacaobox', true);" value="Selecionar todos">
            <input type="button" onclick="SetAllCheckBoxes('myForm', 'cotacaobox', false);" value="Desmarcar todos">
            <br>
            <br><strong>Escolha um periodo:</strong>
            <br>
            <label>inicio:</label>
            <input type="date" name="data_inicial"> 
            <label>final:</label>
            <input type="date" name="data_final"><br>
            <label><input type="checkbox" name="allperiodobox" value="">Todo Periodo</label><br>
            <br>
            <input type=submit value="Baixar">
        </form>
        <div class="footer">
            <p>Universidade Federal de São Carlos, Brasil.</p>
            <p>O conteúdo disponível neste site não tem fins lucrativos. Todos os dados foram extraídos de fontes abertas (ou públicas).</p>
        </div>
    </body>
</html>
