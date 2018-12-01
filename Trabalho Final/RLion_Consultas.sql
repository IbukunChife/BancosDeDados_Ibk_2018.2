USE RLion;

/*
cozinheiro ( Coz_ID, Coz_Nome, Coz_CPF, Coz_End, Coz_Tel, Coz_Salario, Coz_Data_Entr,Coz_Data_Said, Coz_Pro_ID)
utilizar_estoque( Uti_Est_Est_ID, Uti_Est_Coz_ID, Uti_Est_Est_Nome, Uti_Est_Est_Qtd,Uti_Est_Est_Date)
estoque( Est_ID, Est_Nome, Est_Cat, Est_Qtd_Disp, Est_Pro_ID)
clientes ( Cli_ID, Cli_Nome, Cli_CPF, Cli_Tel, Cli_Cat, Cli_Data_Enc, Cli_Pro_ID, Cli_Gar_ID, Cli_Ger_ID )
gerente ( Ger_ID, Ger_Nome, Ger_CPF, Ger_End, Ger_Tel, Ger_Salario, Ger_Data_Entr, Ger_Data_Said, 
		  Ger_Pro_ID, Ger_Cai_ID)
reservas( Res_ID, Res_Mes_ID, Res_Data, Res_Cli_ID )
garcom ( Gar_ID, Gar_Nome, Gar_CPF, Gar_End, Gar_Tel, Gar_Salario, Gar_Data_Entr, Gar_Data_Said,
    Gar_Pro_ID)
pedidos ( Ped_ID, Ped_Cli_ID, Ped_Mes_ID, Ped_Status, Ped_Data_hora, Ped_ValT )
pedidos_itens( PeI_ID, PeI_Ped_ID, PeI_Ped_Cli_ID, PeI_Ped_Mes_ID, PeI_Pra_ID, PeI_Bed_ID)

*/

-- Query1: O ingrediente mais utilizado para os pratos ?
-- Para extrair talvez o 5 primeiros Ingrediente basta mudar o Limit
SELECT Uti_Est_Est_nome from  (SELECT Uti_Est_Est_nome, SUM(Uti_Est_Est_Qtd) as Qtd from
utilizar_estoque group by Uti_Est_Est_nome ORDER BY Qtd DESC LIMIT 1) as Ingrediente;

-- Query2: Qual é o gerente que reservou mais Clientes ?
SELECT Ger_Nome from (
SELECT Cli_Ger_ID , COUNT(*) as Qtd from clientes GROUP BY Cli_Ger_ID ORDER BY Qtd DESC LIMIT 1) as TopGerente 
JOIN gerente ON Ger_ID = Cli_Ger_ID;

-- Query3: O rank Top 5 dos Clientes que reservam mais Mesas
SELECT Cli_Nome , Qtd as Pontos from (
SELECT Res_Cli_ID , COUNT(*) as Qtd from reservas GROUP BY Res_Cli_ID ORDER BY Qtd DESC LIMIT 1
) as TopClientes JOIN
clientes ON Res_Cli_ID = Cli_ID;

-- Query4: o Numero clientes atendidos pelos garçons
SELECT Gar_Nome as GARCON, COUNT(*) as SCORE FROM (
SELECT Cli_Gar_ID , date(Ped_Data_hora) as DIA From clientes join pedidos ON Ped_Cli_ID=Cli_ID
) as atendido JOIN garcom on Gar_ID = Cli_Gar_ID GROUP BY Gar_Nome;

-- Query5: O Numero clientes atendidos no Dia
SELECT Dia , COUNT(*) as TOTAL_SCORE FROM (
SELECT Cli_Gar_ID , date(Ped_Data_hora) as DIA From clientes join pedidos ON Ped_Cli_ID=Cli_ID
) as atendido GROUP BY DIA;

-- Query6: O Pagamento mais efectuado No Dia
SELECT Pag_modalidade , COUNT(*) as TOTAL_SCORE FROM (
SELECT Pag_modalidade , date(Ped_Data_hora) as DIA From pagamento join pedidos ON Pag_Ped_ID = Ped_ID
) as atendido GROUP BY Pag_modalidade;

-- Query7: Hora de Trabalho dos Garcons em um determinado Dia
SELECT Gar_Nome,GarD_Data,TIMEDIFF(GarD_Hora_Entr,GarD_Hora_Said) FROM garcom_datas_trabalhos 
JOIN garcom ON Gar_ID = GarD_Gar_ID;

-- Query8: Pratos mais vendidos
SELECT Pra_Nome , COUNT(*) as Qtd FROM
(SELECT Ped_Status,PeI_Pra_ID FROM pedidos 
JOIN pedidos_itens ON Ped_ID = PeI_Ped_ID AND Ped_Status='FECHADO') as vendido
JOIN pratos ON Pra_ID = PeI_Pra_ID GROUP BY Pra_Nome ORDER BY Qtd DESC LIMIT 1;

-- Query9: Bebidas Industrial mais Vendidas
SELECT Ind_Nome , COUNT(*) as Qtd FROM
(SELECT Ped_Status,PeI_Bed_ID FROM pedidos 
JOIN pedidos_itens ON Ped_ID = PeI_Ped_ID AND Ped_Status='FECHADO') as vendido
JOIN bebida_industri ON Ind_ID = PeI_Bed_ID GROUP BY Ind_Nome ORDER BY Qtd DESC LIMIT 1;

-- Query10: Bebidas Natural mais Vendidas
SELECT NaS_Nome , COUNT(*) as Qtd FROM
(SELECT Ped_Status,PeI_Bed_ID FROM pedidos 
JOIN pedidos_itens ON Ped_ID = PeI_Ped_ID AND Ped_Status='FECHADO') as vendido
JOIN bebida_nat_sol ON NaS_ID = PeI_Bed_ID GROUP BY NaS_Nome ORDER BY Qtd DESC LIMIT 1;