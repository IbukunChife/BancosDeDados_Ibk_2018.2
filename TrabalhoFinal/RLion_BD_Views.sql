USE RLION;

CREATE VIEW bebidas AS
SELECT Ind_Nome AS Bebidas,Ind_Cat as Categoria, Ind_Preco_Uni AS Preco FROM bebida_industri
WHERE  Ind_Qtd_Disp != 0
UNION ALL
SELECT NaS_Nome AS Bebidas, NaS_Cat as Categoria, NaS_Preco_Uni Preco FROM bebida_nat_sol
WHERE  NaS_Qtd_Disp != 0;


CREATE VIEW funcionario AS
SELECT Ger_nome,GerD_Data, GerD_Hora_Entr,GerD_Hora_Said FROM gerente
JOIN gerente_datas_trabalhos ON Ger_ID = GerD_Ger_ID
UNION ALL
SELECT Gar_nome,GarD_Data, GarD_Hora_Entr,GarD_Hora_Said FROM garcom
JOIN garcom_datas_trabalhos ON Gar_ID = GarD_Gar_ID
UNION ALL
SELECT Coz_nome,CozD_Data, CozD_Hora_Entr,CozD_Hora_Said FROM cozinheiro
JOIN cozinheiro_datas_trabalhos ON Coz_ID = CozD_Coz_ID
UNION ALL
SELECT AgL_nome,AgLD_Data, AgLD_Hora_Entr,AgLD_Hora_Said FROM agente_limpeza
JOIN agente_limpeza_datas_trabalhos ON AgL_ID = AgLD_AgL_ID;

SELECT * FROM bebidas;
SELECT * FROM funcionario;

DROP VIEW bebidas;
DROP VIEW funcionario;