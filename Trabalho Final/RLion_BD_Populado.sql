USE RLion;

-- Popularmos primeiramente a caixa
INSERT INTO caixa (Cai_data) values(current_date());

/*
Assim a caixa criada podermos popular o unico Proprietario, referindo
o primeiro ID da caixa.
*/
INSERT INTO proprietario (Pro_Nome,Pro_CNPJ,Pro_End,Pro_Tel,Pro_Cai_ID)
values('Veronica Stella','16.718.173/0001-80','Bairro Mecejana, Rua Rozario SP Nº 596','99589-4225',1);

/*
O restaurante funciona com Dois gerentes um pela das 8h-15h e outro das 16h-22h
*/
INSERT INTO gerente ( Ger_Nome, Ger_CPF , Ger_End, Ger_Tel, Ger_Salario, Ger_Data_Entr,
    Ger_Horas_Trab, Ger_Pro_ID, Ger_Cai_ID) 
values
('Rogerio Sousa','263.188.586-44','Bairro Uniaa Rua centenario Nº885','99863 5401',1250.69,'2018-03-14',7,1,1),
('Marcia Santos','263.469.775-61','Bairro Aeroporto Rua Asa Branca Nº55','98845 3695',1250.69,'2016-08-06',7,1,1);

/*
Pois o restaurante funciona em dois turnos é prevista aqui um efectivo de 10 garçons 
seja 5 por Turno.
*/
INSERT INTO garcom ( Gar_Nome, Gar_CPF , Gar_End, Gar_Tel, Gar_Salario, Gar_Data_Entr,
    Gar_Horas_Trab, Gar_Pro_ID) values
('Rogerio Sousa','133.340.691-68','Bairro Cacari Rua centenario Nº85','998825 5493',950.69,'2015-12-01',7,1),
('Victor José','585.156.932-83','Bairro Pricuma Rua borboleta Nº05','98687 3543',950.69,'2004-02-04',7,1),
('Soccorro Maria','878.296.487-43','Bairro Mecejana Rua getulio Nº95','99782 1039',950.69,'2011-09-03',7,1),
('Rony Lima','429.507.189-73','Bairro Mecejana Rua Brigadeiro Nº12','99365 3684',950.69,'2017-03-09',7,1),
('Yara Ayalla','944.350.738-20','Bairro Calunga Rua jaime brasil Nº74','98845 2683',950.69,'2015-07-06',7,1),
('Ingred Loureno','135.877.911-20','Bairro Aparecida Rua tortozao Branca Nº45','98894 9620',950.69,'2014-02-31',7,1),
('George Moura','653.292.245-51','Bairro Paraviana Rua yeye coelho Nº887','98065 9806',950.69,'2018-03-12',7,1),
('Norina Oliveira','924.937.587-57','Bairro Raiar do Sol Rua almeiro Nº654','98878 3350',950.69,'2014-08-23',7,1),
('Marta Amorin','516.923.148-23','Bairro São Bento Rua nova york Nº531','98016 7595',950.69,'2017-04-26',7,1),
('Thais Lucia','281.169.031-01','Bairro Cambara Rua estados Nº36','99324 4996',950.69,'2018-11-19',7,1);

/*
Na cozinha esta prévista um efetivo de 4 cozinheiro, seja 2 por Turno.
*/
INSERT INTO cozinheiro ( Coz_Nome, Coz_CPF , Coz_End, Coz_Tel, Coz_Salario, Coz_Data_Entr,
    Coz_Horas_Trab, Coz_Pro_ID) values
('Fatima Moura','376.483.637-71','Bairro São Vicente Rua bobos Nº457','99965 9806',1556.69,'2010-06-15',7,1),
('Herbert Oliveira','282.202.671-86','Bairro Mecejana Rua setembro Nº64','98998 3350',1556.69,'2012-10-15',7,1),
('Balico Geocondi','788.315.050-25','Bairro Buritis Rua teixeiro Nº489','98126 7595',1556.69,'2018-12-17',7,1),
('Geovania Monteiro','172.928.462-03','Bairro Uniao Rua capitão Nº97','99794 4996',1556.69,'2018-04-12',7,1);

/*
Para a limpeza esta prevista de 2 pessoas seja 1 por turno 
*/
INSERT INTO agente_limpeza ( AgL_Nome, AgL_CPF , AgL_End, AgL_Tel, AgL_Salario, AgL_Data_Entr,
    AgL_Horas_Trab, AgL_Pro_ID) 
values
('Debora Borges','582.666.735-43','Bairro Uniao rua Beija Flor Nº451','98996 7135',950.69,'2015-04-06',7,1),
('Lucia Amaral','619.776.551-90','Bairro Pricuma Nº9498','99444 4746',950.69,'2015-05-07',7,1);

/*
Populando os cliente
*/
INSERT INTO cliente ( Cli_Nome, Cli_CPF, Cli_Tel, Cli_Cat, Cli_Data_Enc,
 Cli_Pro_ID, Cli_Gar_ID, Cli_Ger_ID)
values
('Bianca','827.158.515-02','99568-48948','ordinario','2018-12-02',1,1,1),
('Lucia','158.653.566-82','99834-49751','VIP','2018-01-14',1,1,2),
('Jean','601.344.699-76','99868-8793','ordinario','2018-12-02',1,1,1),
('Marcia','181.747.547-92','99682-6543','VIP','2018-11-06',1,1,2),
('Romeo','729.306.542-60','99888-6557','VIP','2018-05-23',1,1,2);

/*
Populando o supermercado
*/
INSERT INTO supermercados ( Sup_Nome, Sup_CNPJ, Sup_End, Sup_Tel, Sup_Serv_Ofer, Sup_Data_Livr,
    Sup_Custo, Sup_Pro_ID )
values
('Nova ERA','63.711.540/0001-01','rua jão Alencar Nº2181','99145-49005','Frutas-','2018-10-15',5000,1),
('Atacadão','51.325.534/0001-29','Avenida Brazil Nº2516','3212-2525','Queijo-Leite','2018-12-8',7000,1),
('Parima Distribuidora','57.273.538/0001-97','Rua Raimundo Figueiras,1723- Buritis- BV','3625-5268','Bebidas Industrializada',
'2018-11-24',20000);


/*
Populando o agente de manutenção
*/
INSERT INTO agente_manu( AgM_Nome, AgM_CPF, AgM_End, AgM_Tel, AgM_Serv_Ofer, AgM_Data_Realizada,
    AgM_Custo, AgM_Pro_ID)
value
('Pedro','867.479.532-31','Av ville Roy Nº81','999846-9698','Pedeiro','2014-10-15 08:20',1000,1),
('José','222.771.663-08','Av Glaycon de Paiva Nº26','3212-2525','picheleiro','2018-12-8 15:50',200,1);

/*
Populando os pratos
Pra_categoria: temos o Tradicional, Exotico, sobremesa e doces
A Quantidade é quantificado pela quantidade de pessoas podendo comer o Prato confecionado
*/
INSERT INTO pratos ( Pra_Nome, Pra_Cat, Pra_Qtd_Disp, Pra_Preço_Uni, Pra_Coz_ID, Pra_Ger_ID)
values
('Quiche lorraine','tradicional',2,20.50,2,3),
('Crepe suzette','Sobremesas',10,12.49,3,3),
('Sopa de Cebola','tradicional',4,15,4,3),
('Cassoulet','tradicional',5,15,4,3),
('Sopa de Peixe','tradicional',5,15,1,3),
('Ratatouille','tradicional',5,20,2,3),
('Mousse de Chocolat','Sobremesas',10,13,1,3),
('Macaron','Doce',15,10,3,3),
('Escargots','exóticos',2,50,4,3);

/*
Populando  as bebidas_industrial
*/
INSERT INTO bebida_industri(Ind_Nome, Ind_Cat,Ind_Qtd_Disp, Ind_Preço_Uni ,Ind_Ger_ID)
values
('Devassa','cerveja',20,5.99,1),
('Sky','wisky', 2,30,2),
('Ciroc','wisky',2 ,40,1),
('Jack Daniels','wisky',2,110,1),
('Martini','Wisky',2 ,14,1),
('Heineken','Cerveja',2,13,1),
('Baileys','Wisky',2,35,1),
('Itaipava','Cerveja',50,7,1),
('Bohemia','Cerveja',10,5,1),
('Brahma','Cerveja',15,5,1),
('Skol','Cerveja',20,10,1),
('Antartica','Cerveja',20,5,1),
('Chandon','Vinho',6,30.40,1),
('Reservado','Vinho',5,48.41,1),
('Château Beaumont','Vinho',7, 51.99,1);

/*
Populando Bebida natural solvete
*/

INSERT INTO bebida_nat_sol(NaS_Nome, NaS_Cat, NaS_Qtd_Disp, NaS_Preço_Uni, NaS_Ger_ID,
	Nas_Coz_ID)
values
('pedadicinho de cel','Solvete',20,3,2,3),
('chocolate','Solvete',20,3,1,2),
('Chiclete','Solvete',20,3,1,4),
('Morango','Solvete',20,3,2,1),
('Maracuja','Suco',20,2.50,2,1),
('Acerola','Suco',20,2.50,1,2),
('Caju','Suco',20, 2.50,2,1,3),
('Cupuaçu','Suco',20,2.50,1,2,4);

/*

*/
INSERT INTO estoque(Est_Nome, Est_Cat, Est_Qtd_Disp, Est_Pro_ID)
values
('Tomate','Ingrediente',20,1),
('Cebola','Ingrediente',20,1),
('Peixe','Ingrediente',20,1),
('Leite','Ingrediente',20,1),
('Queijo','Ingrediente',20,1),
('manteiga','Ingrediente',20,1),
('Olheo','Ingrediente',20,1),
('Maracuja','Fruta',20,1),
('Acerola','Fruta',20,1),
('Caju','Fruta',20,1),
('Cupuaçu','Fruta',20,1),
('Devassa','Cerveja',20,1),
('Sky','Whisky',20,1),
('Devassa','cerveja',20,1),
('Sky','wisky',20,1),
('Ciroc','wisky',20,1),
('Jack Daniels','wisky',20,1),
('Martini','Wisky',20,1),
('Heineken','Cerveja',20,1),
('Baileys','Wisky',20,1),
('Itaipava','Cerveja',20,1),
('Bohemia','Cerveja',20,1),
('Brahma','Cerveja',20,1),
('Skol','Cerveja',20,1),
('Antartica','Cerveja',20,1),
('Chandon','Vinho',20,1),
('Reservado','Vinho',20,1),
('Château Beaumont','Vinho',20,1);
;

CREATE TABLE estoque(
	Est_ID SERIAL PRIMARY KEY, 
    Est_Nome VARCHAR (45) NOT NULL,
    Est_Cat VARCHAR(45),
    Est_Qtd_Disp BIGINT(20) DEFAULT 0,
    Est_Pro_ID BIGINT(20),
    FOREIGN KEY (Est_Pro_ID) REFERENCES proprietario(Pro_ID)
);

/*

*/
INSERT INTO utilizar_estoque()
values
();

CREATE TABLE utilizar_estoque(
	Uti_Est_Est_ID BIGINT(20),
    Uti_Est_Coz_ID BIGINT(20),
    Uti_Est_Est_
	FOREIGN KEY (Uti_Est_Est_ID) REFERENCES estoque(Est_ID),
    FOREIGN KEY (Uti_Est_Coz_ID) REFERENCES cozinheira(Coz_ID),
	PRIMARY KEY( Uti_Est_Est_ID,Uti_Est_Coz_ID)
);
/*
Poṕulando a Lista de mesas Disponivel,
temos 3 estados: 'Livres','Ocupado','Reservados' para um total de 10 mesas.
*/
INSERT INTO lista_mesas(Mes_Status)
values
('Livre'),
('Livre'),
('Reservado'),
('Livre'),
('Livre'),
('Livre'),
('Livre'),
('Ocupado'),
('Livre'),
('Reservado')
;
CREATE TABLE lista_mesas (
	Mes_ID SERIAL PRIMARY KEY,
    Mes_Status VARCHAR(45)
);
