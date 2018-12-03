<?php include("conex.php");

?>

<!DOCTYPE html>
<html>
<head>
	<title>Home- Retaurante</title>
	<link rel ="stylesheet" type="text/css" href="style.css">

</head>
<body>
	
		<div class="panel">
			<form action="pedir1.php" method="POST">
				<br/><br/><br/>
				<table width="25%">	


					 <img src="imagem/inicio.png" width="30%">

					 <br/><br/><br/>
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<label>Garcon:&nbsp;&nbsp;</label>
					<select id = "Garçon[]">
						<option value =""> Escolha uma Opcao </option>
						<?php
						header("Content-Type: text/html; charset=ISO-8859-1",true);
						$resultado = " select *from garcom order by Gar_Nome";
						$resultado_b = mysqli_query($mysqli, $resultado);

						while ($row = mysqli_fetch_assoc($resultado_b)) {
							echo '<option value ="'.$row['Gar_ID'].'">'.$row['Gar_Nome'].'</option>';
						}

						?>

					</select><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<label>Cliente:&nbsp;&nbsp;</label>
					<select id = "Cliente[]">
						<option value =""> Escolha uma Opcao</option>
						<?php
						header("Content-Type: text/html; charset=ISO-8859-1",true);
						$resultado = " select *from clientes order by Cli_Nome";
						$resultado_a = mysqli_query($mysqli, $resultado);

						while ($row = mysqli_fetch_assoc($resultado_a)) {
							echo '<option value ="'.$row['Cli_ID'].'">'.$row['Cli_Nome'].'</option>';
						}

						?>
					</select>				
					

				</table>
				<br/><br/>
			<br/>
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" name="Pedir" value="Pedir">
			
			</form><br/>

			<form action="historico.php">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" name="Historico" value="Historico"></form>			
		</div>
	
</body>
</html>