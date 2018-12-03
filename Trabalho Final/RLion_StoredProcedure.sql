USE RLion;

-- CRIAÇÂO DA PROCEDURA PEDIR
DELIMITER $$
CREATE PROCEDURE pedir (IN garcom_ID BIGINT(20)UNSIGNED, IN cliente_ID BIGINT(20)UNSIGNED, OUT pedido_ID BIGINT(20)UNSIGNED)
BEGIN
	DECLARE mesa_cliente BIGINT(20)UNSIGNED;
    DECLARE cliente_reservado BIGINT(20)UNSIGNED;
    DECLARE id_mesa_reservado BIGINT(20)UNSIGNED;
    SET cliente_reservado = (SELECT COUNT(*) FROM reservas WHERE Res_Cli_ID = garcom_ID GROUP BY Res_Cli_ID); 
    -- SE O cLIENTE NÃO TIVER RESERVADO UMA MESA ESCOLHER ALEATOIRIAMENTE UMA MESA lIVRE
    IF cliente_reservado =0 THEN
		SET mesa_cliente = (SELECT Mes_ID FROM lista_mesas WHERE Mes_status !='Ocupado' AND Mes_status != 'Reservado' ORDER BY RAND() LIMIT 1);
		UPDATE lista_mesa
        SET Mes_status = 'Ocupado'
        WHERE Mes_ID = mesa_cliente;
    ELSE
    -- CASO CONTRARIO PEGAR O ID DA MESA RESERVADA PARA O ESTADO OCUPADO E APAGAR ESSA RESERVA DENTRO DA TABELA DE RESERVA
		SET mesa_cliente = (SELECT Res_Mes_ID FROM clientes JOIN reservas ON Cli_ID = Res_Cli_ID);
        UPDATE lista_mesa
        SET Mes_status = 'Ocupado'
        WHERE Mes_ID = mesa_cliente;
        SET id_mesa_reservado = (SELECT Res_ID FROM reservas WHERE Res_Cli_ID = mesa_cliente);
        DELETE FROM reservas WHERE Res_ID = id_mesa_reservado;
    END IF;
    
-- IDENTIFIANDO O GARÇOM QUE ATENDEU O CLIENTE
	UPDATE clientes
	SET Cli_Gar_ID = garcom_ID
    WHERE Cli_ID = cliente_ID;
    
-- CRIAÇÂO DO PEDIDO    
	INSERT INTO pedidos (Ped_Cli_ID, Ped_Mes_ID, Ped_Status, Ped_Data_hora)
	values (cliente_ID,mesa_cliente,NOW());
-- OBTER O ID DO PEDIDO
	SET pedido_ID = (SELECT Ped_ID FROM pedidos WHERE Ped_Cli_ID = cliente_ID AND Ped_Mes_ID = mesa_cliente AND Ped_Status = 'EM ANDAMENTO');
END $$
DELIMITER ;



CALL pedir(1,2,@pedido_ID);
SELECT @pedido_ID; 

DROP procedure pedir;