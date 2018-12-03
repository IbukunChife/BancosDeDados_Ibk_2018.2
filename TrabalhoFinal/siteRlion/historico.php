<html>
<head>
<title>Untitled Document</title>
<style type="text/css">
body{
	background-image: url("imagem/menuT.jpg");
	background-repeat: no-repeat;
            -moz-background-size: 100% 100%;
            -webkit-background-size: 100% 100%;
            background-size: 100% 100%;}

            *{
	color: red;
}

table#tabela
tr:hover {
background-color: #CCCCCC;
}
#atualizar {
background: url(fundo_div_pesquisa.jpg);
background-repeat:repeat-x;
}
table {
            text-align: center;
            font-size: 12px;
            font-family: verdana;
            background: #c0c0c0;
        }
        table thead  {
            cursor: pointer;
        }
                tr:hover {
                background-color: #CCCCCC;
                }
        table thead tr,
        table tfoot tr {
            background: #c0c0c0;
        }
        table tbody tr {
            background: #f0f0f0;
        }
        td, th {
            border: 1px solid white;
        }
</style>
</head>
<body>

<?php	
	include("conex.php");


/*-- Query1: O ingrediente mais utilizado para os pratos ?
-- Para extrair talvez o 5 primeiros Ingrediente basta mudar o Limit*/
$sql1 ="SELECT Uti_Est_Est_nome from  (SELECT Uti_Est_Est_nome, SUM(Uti_Est_Est_Qtd) as Qtd from
utilizar_estoque group by Uti_Est_Est_nome ORDER BY Qtd DESC LIMIT 1) as Ingrediente";
$query1 = mysqli_query($mysqli, $sql1);	


/*-- Query2: Qual é o gerente que reservou mais Clientes ?*/
$sql2 ="SELECT Ger_Nome from (
SELECT Cli_Ger_ID , COUNT(*) as Qtd from clientes GROUP BY Cli_Ger_ID ORDER BY Qtd DESC LIMIT 1) as TopGerente 
JOIN gerente ON Ger_ID = Cli_Ger_ID";
$query2 = mysqli_query($mysqli, $sql2);	

/*-- Query3: O rank Top 5 dos Clientes que reservam mais Mesas*/
$sql3 = "SELECT Cli_Nome , Qtd as Pontos from (
SELECT Res_Cli_ID , COUNT(*) as Qtd from reservas GROUP BY Res_Cli_ID ORDER BY Qtd DESC LIMIT 1
) as TopClientes JOIN
clientes ON Res_Cli_ID = Cli_ID";

$query3 = mysqli_query($mysqli, $sql3);	

/*-- Query4: o Numero clientes atendidos pelos garçons*/
$sql4="SELECT Gar_Nome as GARCON, COUNT(*) as SCORE FROM (
SELECT Cli_Gar_ID , date(Ped_Data_hora) as DIA From clientes join pedidos ON Ped_Cli_ID=Cli_ID
) as atendido JOIN garcom on Gar_ID = Cli_Gar_ID GROUP BY Gar_Nome";
$query4 = mysqli_query($mysqli, $sql4);	

/*-- Query5: O Numero clientes atendidos no Dia*/
$sql5 = "SELECT Dia , COUNT(*) as TOTAL_SCORE FROM (
SELECT Cli_Gar_ID , date(Ped_Data_hora) as DIA From clientes join pedidos ON Ped_Cli_ID=Cli_ID
) as atendido GROUP BY DIA";
$query5 = mysqli_query($mysqli, $sql5);	

/*-- Query6: O Pagamento mais efectuado No Dia*/
$sql6 ="SELECT Pag_modalidade , COUNT(*) as TOTAL_SCORE FROM (
SELECT Pag_modalidade , date(Ped_Data_hora) as DIA From pagamento join pedidos ON Pag_Ped_ID = Ped_ID
) as atendido GROUP BY Pag_modalidade";
$query6 = mysqli_query($mysqli, $sql6);	

/*-- Query7: Hora de Trabalho dos Garcons em um determinado Dia*/
$sql7 = "SELECT Gar_Nome,GarD_Data,TIMEDIFF(GarD_Hora_Entr,GarD_Hora_Said) FROM garcom_datas_trabalhos 
JOIN garcom ON Gar_ID = GarD_Gar_ID";
$query7 = mysqli_query($mysqli, $sql7);	

/*-- Query8: Pratos mais vendidos*/
$sql8 ="SELECT Pra_Nome , COUNT(*) as Qtd FROM
(SELECT Ped_Status,PeI_Pra_ID FROM pedidos 
JOIN pedidos_itens ON Ped_ID = PeI_Ped_ID AND Ped_Status='FECHADO') as vendido
JOIN pratos ON Pra_ID = PeI_Pra_ID GROUP BY Pra_Nome ORDER BY Qtd DESC LIMIT 1";
$query8 = mysqli_query($mysqli, $sql8);	

/*-- Query9: Bebidas Industrial mais Vendidas*/
$sql9 ="SELECT Ind_Nome , COUNT(*) as Qtd FROM
(SELECT Ped_Status,PeI_Bed_ID FROM pedidos 
JOIN pedidos_itens ON Ped_ID = PeI_Ped_ID AND Ped_Status='FECHADO') as vendido
JOIN bebida_industri ON Ind_ID = PeI_Bed_ID GROUP BY Ind_Nome ORDER BY Qtd DESC LIMIT 1";
$query9 = mysqli_query($mysqli, $sql9);	

/*-- Query10: Bebidas Natural mais Vendidas*/
$sql10 ="SELECT NaS_Nome , COUNT(*) as Qtd FROM
(SELECT Ped_Status,PeI_Bed_ID FROM pedidos 
JOIN pedidos_itens ON Ped_ID = PeI_Ped_ID AND Ped_Status='FECHADO') as vendido
JOIN bebida_nat_sol ON NaS_ID = PeI_Bed_ID GROUP BY NaS_Nome ORDER BY Qtd DESC LIMIT 1";
$query10 = mysqli_query($mysqli, $sql10);	


/*-- Query11: QUAL È O CARDAPIO DO DIA ?*/
$sql11 ="SELECT Pra_Nome , Pra_Preco_Uni FROM pratos
WHERE  Pra_Qtd_Disp != 0";
$query11 = mysqli_query($mysqli, $sql11);	

$sql12 ="SELECT Ind_Nome, Ind_Preco_Uni FROM bebida_industri
WHERE  Ind_Qtd_Disp != 0";
$query12 = mysqli_query($mysqli, $sql12);	

$sql13 = "SELECT NaS_Nome, NaS_Preco_Uni FROM bebida_nat_sol
WHERE  NaS_Qtd_Disp != 0";
$query13 = mysqli_query($mysqli, $sql13);	

	
	header("Content-Type: text/html; charset=ISO-8859-1",true);
?>
<div class="panel">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	 <img src="imagem/inicio.png" width="25%">
<form action="processar_form.php" method="POST">

<center>

	<h4>O ingrediente mais utilizado para os pratos ?</h4>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">

		<tr><th scope="col">Ingrediente</th></tr>

	<?php while ($rows = mysqli_fetch_array($query1)){?>

		<td><?php echo $rows['Uti_Est_Est_nome'];?></td>

		<?php }?>
	
</table>

<h4>Qual e o gerente que reservou mais Clientes? </h4>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">

		<tr><th scope="col">Gerente</th></tr>

	<?php while ($rows = mysqli_fetch_array($query2)){?>

		<td><?php echo $rows['Ger_Nome'];?></td>

		<?php }?>
	
</table>

<h4>O rank Top 5 dos Clientes que reservam mais Mesas</h4>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">

		<tr><th scope="col">Nome</th>
		<th scope="col">Pontos</th></tr>

	<?php while ($rows = mysqli_fetch_array($query3)){?>

		<td><?php echo $rows['Cli_Nome'];?></td>
		<td><?php echo $rows['Pontos'];?></td>

		<?php }?>
	
</table>

<h4>Numeros clientes atendidos pelos garcons</h4>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">

			<tr><th scope="col">Garcon</th>
		<th scope="col">Score</th></tr>

	<?php while ($rows = mysqli_fetch_array($query4)){?>

		<td><?php echo $rows['GARCON'];?></td>
		<td><?php echo $rows['SCORE'];?>
		<tr><td><td><?php echo '';?></td></td></tr>

		


		<?php }?>
	
</table>

<h4>O Numero clientes atendidos no Dia</h4>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">

		<tr><th scope="col">Dia</th>
		<th scope="col">Total</th></tr>

	<?php while ($rows = mysqli_fetch_array($query5)){?>

		<td><?php echo $rows['DIA'];?></td>
		<td><?php echo $rows['TOTAL_SCORE'];?></td>
		<tr><td><td><?php echo '';?></td></td></tr>

		<?php }?>
	
</table>

<h4>O Pagamento mais efectuado No Dia</h4>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">

		<tr><th scope="col">Modalidade</th>
		<th scope="col">Total</th></tr>


	<?php while ($rows = mysqli_fetch_array($query6)){?>

		<td><?php echo $rows['Pag_modalidade'];?></td>
		<td><?php echo $rows['TOTAL_SCORE'];?></td>
		<tr><td><td><?php echo '';?></td></td></tr>

		<?php }?>
	
</table>

<h4>Hora de Trabalho dos Garcons em um determinado Dia</h4>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">

		<tr><th scope="col">Garcon</th>
		<th scope="col">Data</th>		

	<?php while ($rows = mysqli_fetch_array($query7)){?>

		<tr><td><td><?php echo '';?></td></td></tr>
		<td><?php echo $rows['Gar_Nome'];?></td>
		<td><?php echo $rows['GarD_Data'];?></td>
		

		<?php }?>
	
</table>

<h4>Pratos mais vendidos</h4>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">

		<tr><th scope="col">Nome</th>
		<th scope="col">Quantidade</th></tr>

	<?php while ($rows = mysqli_fetch_array($query8)){?>

		<td><?php echo $rows['Pra_Nome'];?></td>
		<td><?php echo $rows['Qtd'];?></td>

		<?php }?>
	
</table>

<h4>Bebidas Industrial mais Vendidas</h4>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">

		<tr><th scope="col">Nome</th>
		<th scope="col">Quantidade</th></tr>

	<?php while ($rows = mysqli_fetch_array($query9)){?>

		<td><?php echo $rows['Ind_Nome'];?></td>
		<td><?php echo $rows['Qtd'];?></td>

		<?php }?>
	
</table>

<h4>Bebidas Natural mais Vendidas</h4>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">

		<tr><th scope="col">Nome</th>
		<th scope="col">Quantidade</th></tr>

	<?php while ($rows = mysqli_fetch_array($query10)){?>

		<td><?php echo $rows['NaS_Nome'];?></td>
		<td><?php echo $rows['Qtd'];?></td>

		<?php }?>
	
</table>

<h3>QUAL E O CARDAPIO DO DIA ?</h3>
<h4>Pratos:</h4>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">

		<tr><th scope="col">Pratos</th>
		<th scope="col">Preco</th></tr>

	<?php while ($rows = mysqli_fetch_array($query11)){?>

		<tr><td><td><?php echo '';?></td></td></tr>
		<td><?php echo $rows['Pra_Nome'];?></td>
		<td><?php echo $rows['Pra_Preco_Uni'];?></td>

		<?php }?>
	
</table>

<h4>Bebidas Industriais:</h4>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">

		<tr><th scope="col">Bebidas</th>
		<th scope="col">Preco</th></tr>

	<?php while ($rows = mysqli_fetch_array($query12)){?>

		<tr><td><td><?php echo '';?></td></td></tr>
		<td><?php echo $rows['Ind_Nome'];?></td>
		<td><?php echo $rows['Ind_Preco_Uni'];?></td>


		<?php }?>
	
</table>
<h4>Bebidas Naturais</h4>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">

		<tr><th scope="col">Bebida</th>
		<th scope="col">Preco</th></tr>

	<?php while ($rows = mysqli_fetch_array($query13)){?>

		<tr><td><td><?php echo '';?></td></td></tr>
		<td><?php echo $rows['NaS_Nome'];?></td>
		<td><?php echo $rows['NaS_Preco_Uni'];?></td>

		<?php }?>
	
</table>



</td>
<br/>
</center>
</div>
</form>
