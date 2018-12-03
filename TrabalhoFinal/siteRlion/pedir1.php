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
	$servidor = "localhost";
	$usuario = "root";
	$senha = "";
	$dbname = "rlion";
	
	//Criar a conexao
	$conn = mysqli_connect($servidor, $usuario, $senha, $dbname);
	
	//$id = 1;
	$sql = "SELECT * FROM pratos";
	$query = mysqli_query($conn, $sql);
	
	$sql1 = "SELECT * FROM bebida_industri";
	$query1 = mysqli_query($conn, $sql1);
	
	$sql2 = "SELECT * FROM bebida_nat_sol";
	$query2 = mysqli_query($conn, $sql2);

	header("Content-Type: text/html; charset=ISO-8859-1",true);
?>


<div class="panel">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	 <img src="imagem/menu.png" width="25%">
<form action="processar_form.php" method="POST">

<center>

	<h2>Pratos</h2>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">


		<tr>

					 	<th scope="col">ID</th>
					 	<th scope="col">Nome</th>
					 	<th scope="col">Quantidade Disponivel</th>
					 	<th scope="col">Preco</th>


					 </tr>

	<?php
	
	while ($rows = mysqli_fetch_array($query)){
		//$Pra_ID = $rows['Pra_ID'];
		//$Pra_Nome = $rows['Pra_Nome'];	
		//$Pra_Qtd_Disp = $rows['Pra_Qtd_Disp'];	
		//$Pra_Preço_Uni = $rows['Pra_Preço_Uni'];	

		?>


		<td><?php echo $rows['Pra_ID'];echo "<input type='checkbox' name='caixa[]' value= ['Pra_Nome']>";?></td>
		<td><?php echo $rows['Pra_Nome'];?></td>
		<td><?php echo $rows['Pra_Qtd_Disp'];?></td>
		<td><?php echo $rows['Pra_Preco_Uni'];?></td>
		<tr><td><td><td><td></td><?php echo  "";?></td></td></td></td></tr>
		
		<?php
		//echo "<input type='radio' name='Gar_Nome[]'>";
		//echo "<br/><name= 'Gar_End[]'><br/><br/>";
	}?>
	
</table>

<h2>Bebidas Industriais</h2>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">

		<tr>

					 	<th scope="col">ID</th>
					 	<th scope="col">Nome</th>
					 	<th scope="col">Quantidade Disponivel</th>
					 	<th scope="col">Preco</th>


					 </tr>

	<?php
	//header("Content-Type: text/html; charset=ISO-8859-1",true);
	while ($rows = mysqli_fetch_array($query1)){
		//$Pra_ID = $rows['Pra_ID'];
		//$Pra_Nome = $rows['Pra_Nome'];	
		//$Pra_Qtd_Disp = $rows['Pra_Qtd_Disp'];	
		//$Pra_Preço_Uni = $rows['Pra_Preço_Uni'];	

		?>

		<td><?php echo $rows['Ind_ID'];echo "<input type='checkbox' name='caixa[]' value= ['Pra_Nome']>";?></td>
		<td><?php echo $rows['Ind_Nome'];?></td>
		<td><?php echo $rows['Ind_Qtd_Disp'];?></td>
		<td><?php echo $rows['Ind_Preco_Uni'];?></td>
		<tr><td><td><td><td></td><?php echo  "";?></td></td></td></td></tr>
		
		<?php
		//echo "<input type='radio' name='Gar_Nome[]'>";
		//echo "<br/><name= 'Gar_End[]'><br/><br/>";
	}?>
	
</table>

<h2>Bebidas Naturais</h2>

		<table border="3" cellspacing="1" cellpadding="2" id="tabela">

		<tr>

					 	<th scope="col">ID</th>
					 	<th scope="col">Nome</th>
					 	<th scope="col">Quantidade Disponivel</th>
					 	<th scope="col">Preco</th>


					 </tr>

	<?php
	//header("Content-Type: text/html; charset=ISO-8859-1",true);
	while ($rows = mysqli_fetch_array($query2)){
		//$Pra_ID = $rows['Pra_ID'];
		//$Pra_Nome = $rows['Pra_Nome'];	
		//$Pra_Qtd_Disp = $rows['Pra_Qtd_Disp'];	
		//$Pra_Preço_Uni = $rows['Pra_Preço_Uni'];	

		?>

		<td><?php echo $rows['NaS_ID'];echo "<input type='checkbox' name='caixa[]' value= ['NaS_Nome']>";?></td>
		<td><?php echo $rows['NaS_Nome'];?></td>
		<td><?php echo $rows['NaS_Qtd_Disp'];?></td>
		<td><?php echo $rows['NaS_Preco_Uni'];?></td>
		<tr><td><td><td><td></td><?php echo  "";?></td></td></td></td></tr>
		
		<?php
		//echo "<input type='radio' name='Gar_Nome[]'>";
		//echo "<br/><name= 'Gar_End[]'><br/><br/>";
	}?>
	
</table>
</td>
<br/>

	<input type="submit" value="Validar">
</center>
</div>
</form>
