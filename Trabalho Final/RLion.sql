CREATE DATABASE RLion;

USE RLion;

CREATE TABLE caixa (
	Cai_ID SERIAL PRIMARY KEY,
    Cai_Saldo_Vista DECIMAL(10,2)UNSIGNED DEFAULT 0.0,
    Cai_Saldo_Cartão DECIMAL(10,2)UNSIGNED DEFAULT 0.0,
    Cai_Data DATE
);

CREATE TABLE proprietario (
	Pro_ID SERIAL PRIMARY KEY,
    Pro_Nome VARCHAR(45) NOT NULL,
    Pro_CNPJ VARCHAR(18),
    Pro_End VARCHAR(45),
    Pro_Tel VARCHAR(45),
    Pro_Cai_ID BIGINT(20) UNSIGNED,
    FOREIGN KEY (Pro_Cai_ID) REFERENCES caixa(Cai_ID)
);

CREATE TABLE gerente (
	Ger_ID SERIAL PRIMARY KEY,
    Ger_Nome VARCHAR(45)NOT NULL,
    Ger_CPF VARCHAR(14),
    Ger_End VARCHAR(45),
    Ger_Tel VARCHAR(45),
    Ger_Salario DECIMAL(10,2),
    Ger_Data_Entr DATE,
    Ger_Data_Said DATE,
    Ger_Pro_ID BIGINT(20) UNSIGNED,
    Ger_Cai_ID BIGINT(20) UNSIGNED,
    FOREIGN KEY (Ger_Pro_ID) REFERENCES proprietario(Pro_ID),
	FOREIGN KEY (Ger_Cai_ID) REFERENCES caixa(Cai_ID)
);

CREATE TABLE gerente_datas_trabalhos (
	GerD_ID SERIAL ,
    GerD_Ger_ID BIGINT(20) UNSIGNED,
    GerD_Data DATE,
    GerD_Hora_Entr TIME,
    GerD_Hora_Said TIME,
	FOREIGN KEY (GerD_Ger_ID) REFERENCES gerente(Ger_ID),
    PRIMARY KEY (GerD_ID,GerD_Ger_ID,GerD_Data)
);

CREATE TABLE garcom (
	Gar_ID SERIAL PRIMARY KEY,
    Gar_Nome VARCHAR(45) NOT NULL,
    Gar_CPF VARCHAR(14),
    Gar_End VARCHAR(45),
    Gar_Tel VARCHAR(45),
    Gar_Salario DECIMAL(10,2)UNSIGNED DEFAULT 0.0,
    Gar_Data_Entr DATE,
    Gar_Data_Said DATE,
    Gar_Pro_ID BIGINT(20) UNSIGNED,
    FOREIGN KEY (Gar_Pro_ID) REFERENCES proprietario(Pro_ID)
);

CREATE TABLE garcom_datas_trabalhos (
	GarD_ID SERIAL,
    GarD_Gar_ID BIGINT(20) UNSIGNED,
    GarD_Data DATE,
    GarD_Hora_Entr TIME,
    GarD_Hora_Said TIME,
	FOREIGN KEY (GarD_Gar_ID) REFERENCES garcom (Gar_ID),
    PRIMARY KEY (GarD_ID,GarD_Gar_ID,GarD_Data)
);

CREATE TABLE cozinheiro (
	Coz_ID SERIAL PRIMARY KEY,
    Coz_Nome VARCHAR(45)NOT NULL,
    Coz_CPF VARCHAR(14),
    Coz_End VARCHAR(45),
    Coz_Tel VARCHAR(45),
    Coz_Salario DECIMAL(10,2)UNSIGNED DEFAULT 0.0,
    Coz_Data_Entr DATE,
    Coz_Data_Said DATE,
    Coz_Pro_ID BIGINT(20) UNSIGNED,
    FOREIGN KEY (Coz_Pro_ID) REFERENCES proprietario(Pro_ID)
);

CREATE TABLE cozinheiro_datas_trabalhos (
	CozD_ID SERIAL ,
    CozD_Coz_ID BIGINT(20) UNSIGNED,
    CozD_Data DATE,
    CozD_Hora_Entr TIME,
    CozD_Hora_Said TIME,
	FOREIGN KEY (CozD_Coz_ID) REFERENCES cozinheiro(Coz_ID),
    PRIMARY KEY (CozD_ID,CozD_Coz_ID,CozD_Data)
);

CREATE TABLE agente_limpeza (
	AgL_ID SERIAL PRIMARY KEY,
    AgL_Nome VARCHAR(45) NOT NULL,
    AgL_CPF VARCHAR(14),
    AgL_End VARCHAR(45),
    AgL_Tel VARCHAR(45),
    AgL_Salario DECIMAL(10,2)UNSIGNED DEFAULT 0.0,
    AgL_Data_Entr DATE,
    AgL_Data_Said DATE,
    AgL_Pro_ID BIGINT(20)UNSIGNED,
    FOREIGN KEY (AgL_Pro_ID) REFERENCES proprietario(Pro_ID)
);

CREATE TABLE agente_limpeza_datas_trabalhos (
	AgLD_ID SERIAL ,
    AgLD_AgL_ID BIGINT(20)UNSIGNED,
    AgLD_Data DATE,
    AgLD_Hora_Entr TIME,
    AgLD_Hora_Said TIME,
	FOREIGN KEY (AgLD_AgL_ID) REFERENCES agente_limpeza(AgL_ID),
    PRIMARY KEY (AgLD_ID,AgLD_AgL_ID,AgLD_Data)
);

CREATE TABLE clientes (
	Cli_ID SERIAL PRIMARY KEY,
    Cli_Nome VARCHAR(45) NOT NULL,
    Cli_CPF VARCHAR(14),
    Cli_Tel VARCHAR(12),
    Cli_Cat VARCHAR(15),
    Cli_Data_Enc DATETIME,
    Cli_Pro_ID BIGINT(20)UNSIGNED,
    Cli_Gar_ID BIGINT(20)UNSIGNED,
    Cli_Ger_ID BIGINT(20)UNSIGNED,
    FOREIGN KEY (Cli_Pro_ID) REFERENCES proprietario(Pro_ID),
    FOREIGN KEY (Cli_Gar_ID) REFERENCES garcom(Gar_ID),
    FOREIGN KEY (Cli_Ger_ID) REFERENCES gerente(Ger_ID)
);

CREATE TABLE supermercados (
	Sup_ID SERIAL PRIMARY KEY,
    Sup_Nome VARCHAR(45)NOT NULL,
    Sup_CNPJ VARCHAR(18),
    Sup_End VARCHAR(45),
    Sup_Tel VARCHAR(12),
    Sup_Serv_Ofer VARCHAR(45),
    Sup_Data_Livr DATETIME,
    Sup_Custo DECIMAL(10,2)UNSIGNED DEFAULT 0.0,
    Sup_Pro_ID BIGINT(20)UNSIGNED,
     FOREIGN KEY (Sup_Pro_ID) REFERENCES proprietario(Pro_ID)
);

CREATE TABLE agente_manu (
	AgM_ID SERIAL PRIMARY KEY,
    AgM_Nome VARCHAR(45) NOT NULL,
    AgM_CPF VARCHAR(14),
    AgM_End VARCHAR(45),
    AgM_Tel VARCHAR(45),
    AgM_Serv_Ofer VARCHAR(45),
    AgM_Data_Realizada DATETIME,
    AgM_Custo DECIMAL(10,2) UNSIGNED DEFAULT 0.0,
    AgM_Pro_ID BIGINT(20)UNSIGNED,
    FOREIGN KEY (AgM_Pro_ID) REFERENCES proprietario(Pro_ID)
);


CREATE TABLE pratos (
	Pra_ID SERIAL PRIMARY KEY,
    Pra_Nome VARCHAR(45) NOT NULL,
    Pra_Cat VARCHAR(45),
    Pra_Qtd_Disp BIGINT(20)UNSIGNED DEFAULT 0,
    Pra_Preço_Uni DECIMAL(10,2)UNSIGNED DEFAULT 0.0,
    Pra_Coz_ID BIGINT(20)UNSIGNED,
    Pra_Ger_ID BIGINT(20)UNSIGNED,
	FOREIGN KEY (Pra_Coz_ID) REFERENCES cozinheiro (Coz_ID),
    FOREIGN KEY (Pra_Ger_ID) REFERENCES gerente(Ger_ID)
);

CREATE TABLE bebida_industri (
	Ind_ID SERIAL PRIMARY KEY,
    Ind_Nome VARCHAR(45) NOT NULL,
    Ind_Cat VARCHAR(45),
    Ind_Qtd_Disp BIGINT(20)UNSIGNED DEFAULT 0,
    Ind_Preço_Uni DECIMAL(10,2)UNSIGNED DEFAULT 0.0,
    Ind_Ger_ID BIGINT(20)UNSIGNED,
	FOREIGN KEY (Ind_Ger_ID) REFERENCES gerente(Ger_ID)
);


CREATE TABLE bebida_nat_sol (
	NaS_ID SERIAL PRIMARY KEY,
    NaS_Nome VARCHAR (45) NOT NULL,
    NaS_Cat VARCHAR (45),
    NaS_Qtd_Disp BIGINT(20)UNSIGNED DEFAULT 0,
    NaS_Preço_Uni DECIMAL(10,2)UNSIGNED DEFAULT 0.0,
    NaS_Ger_ID BIGINT(20)UNSIGNED,
    Nas_Coz_ID BIGINT(20)UNSIGNED,
	FOREIGN KEY (NaS_Ger_ID) REFERENCES gerente(Ger_ID),
    FOREIGN KEY (NaS_Coz_ID) REFERENCES cozinheiro (Coz_ID)
);

CREATE TABLE estoque(
	Est_ID SERIAL PRIMARY KEY, 
    Est_Nome VARCHAR (45) NOT NULL,
    Est_Cat VARCHAR(45),
    Est_Qtd_Disp BIGINT(20)UNSIGNED DEFAULT 0,
    Est_Pro_ID BIGINT(20)UNSIGNED,
    FOREIGN KEY (Est_Pro_ID) REFERENCES proprietario(Pro_ID)
);

CREATE TABLE utilizar_estoque(
	Uti_Est_ID SERIAL,
	Uti_Est_Est_ID BIGINT(20)UNSIGNED,
    Uti_Est_Coz_ID BIGINT(20)UNSIGNED,
	Uti_Est_Est_Nome VARCHAR(45) NOT NULL,
    Uti_Est_Est_Qtd BIGINT(20)UNSIGNED,
    Uti_Est_Est_Date DATE,
	FOREIGN KEY (Uti_Est_Est_ID) REFERENCES estoque(Est_ID),
    FOREIGN KEY (Uti_Est_Coz_ID) REFERENCES cozinheiro(Coz_ID),
	PRIMARY KEY( Uti_Est_ID, Uti_Est_Est_ID,Uti_Est_Coz_ID)
);

CREATE TABLE lista_mesas (
	Mes_ID SERIAL PRIMARY KEY,
    Mes_Status VARCHAR(45)
);

CREATE TABLE reservas(
	Res_ID SERIAL ,
    Res_Mes_ID BIGINT(20)UNSIGNED,
    Res_Data DATETIME,
    Res_Cli_ID BIGINT(20)UNSIGNED,
    FOREIGN KEY (Res_Mes_ID) REFERENCES lista_mesas(Mes_ID),
    FOREIGN KEY (Res_Cli_ID) REFERENCES clientes(Cli_ID),
    PRIMARY KEY(Res_ID, Res_Mes_ID,Res_Cli_ID)
);

CREATE TABLE pedidos (
	Ped_ID SERIAL,
    Ped_Cli_ID BIGINT(20)UNSIGNED,
    Ped_Mes_ID BIGINT(20)UNSIGNED,
    Ped_Status VARCHAR(45) DEFAULT 'EM ANDAMENTO',
    Ped_Data_hora DATETIME,
    Ped_ValT DECIMAL(20,2) UNSIGNED DEFAULT 0.0 ,
	FOREIGN KEY (Ped_Cli_ID) REFERENCES clientes(Cli_ID),
	FOREIGN KEY (Ped_Mes_ID) REFERENCES lista_mesas(Mes_ID),
    PRIMARY KEY(Ped_ID , Ped_Cli_ID, Ped_Mes_ID)
);

CREATE TABLE pedidos_itens(
	PeI_ID SERIAL,
    PeI_Ped_ID BIGINT(20)UNSIGNED,
    PeI_Ped_Cli_ID BIGINT(20)UNSIGNED,
    PeI_Ped_Mes_ID BIGINT(20)UNSIGNED,
    PeI_Pra_ID BIGINT(20)UNSIGNED,
    PeI_Bed_ID BIGINT(20)UNSIGNED,
    FOREIGN KEY (PeI_Ped_ID) REFERENCES pedidos(Ped_ID),
    FOREIGN KEY (PeI_Ped_Cli_ID) REFERENCES clientes(Cli_ID),
	FOREIGN KEY (PeI_Ped_Mes_ID) REFERENCES lista_mesas(Mes_ID),
    FOREIGN KEY (PeI_Pra_ID) REFERENCES pratos(Pra_ID),
    FOREIGN KEY (PeI_Bed_ID) REFERENCES bebida_industri(Ind_ID),
	FOREIGN KEY (PeI_Bed_ID) REFERENCES bebida_nat_sol(NaS_ID),
    PRIMARY KEY (PeI_ID, PeI_Ped_ID, PeI_Ped_Cli_ID, PeI_Ped_Mes_ID)
);

CREATE TABLE pagamento (
	Pag_ID SERIAL,
    Pag_Ped_ID BIGINT(20)UNSIGNED,
    Pag_modalidade VARCHAR(20),
	Pag_Status VARCHAR(45),
    FOREIGN KEY (Pag_Ped_ID) REFERENCES pedidos(Ped_ID),
    PRIMARY KEY(Pag_ID,Pag_Ped_ID)
);

/* Para apagar uma Tabela Deseja*/
DROP TABLE caixa;
DROP TABLE proprietario;
DROP TABLE gerente;
DROP TABLE gerente_datas_trabalhos;
DROP TABLE garcom;
DROP TABLE garcom_datas_trabalhos;
DROP TABLE cozinheiro;
DROP TABLE agente_limpeza;
DROP TABLE agente_limpeza_datas_trabalhos;
DROP TABLE clientes;
DROP TABLE supermercados;
DROP TABLE agente_manu;
DROP TABLE pratos;
DROP TABLE bebida_industri;
DROP TABLE bebida_nat_sol;
DROP TABLE estoque;
DROP TABLE utilizar_estoque;
DROP TABLE lista_mesas;
DROP TABLE reservas;
DROP TABLE pedidos;
DROP TABLE pedidos_itens;
DROP TABLE pagamento;

/*Exibir a descripção da esquema de uma tabela*/

describe caixa;
describe proprietario;
describe gerente;
describe gerente_datas_trabalhos;
describe garcom;
describe garcom_datas_trabalhos;
describe cozinheiro;
describe agente_limpeza;
describe agente_limpeza_datas_trabalhos;
describe clientes;
describe supermercados;
describe agente_manu;
describe pratos;
describe bebida_industri;
describe bebida_nat_sol;
describe estoque;
describe utilizar_estoque;
describe lista_mesas;
describe reservas;
describe pedidos;
describe pedidos_itens;
describe pagamento;

/*Aoagar o DataBase*/
DROP DATABASE RLion;