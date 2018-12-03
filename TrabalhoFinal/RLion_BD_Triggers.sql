USE Rlion;

/*
QUANDO UM PAGAMENTO É 'FECHADO' É ATUALIZADA O STATUS DO PEDIDO E INCREMENTADO O PRECO DANS DA CAIXA
COM RESPEITO A MODALIDE DE PAGAMENTO.
*/

DELIMITER $$
CREATE TRIGGER atualizar_caixa
AFTER UPDATE ON pagamento
FOR EACH ROW
BEGIN
	DECLARE ref_pedido_ID  BIGINT(20)UNSIGNED;
    DECLARE valor_venda DECIMAL(10,2)UNSIGNED;
    DECLARE paga_modalida VARCHAR(45);
    DECLARE valor_anterior DECIMAL(10,2)UNSIGNED;
    
    SET ref_pedido_ID = (SELECT Pag_Ped_ID FROM pagamento WHERE Pag_Status = 'FECHADO');
    SET paga_modalida = (SELECT Pag_modalidade FROM pagamento WHERE Pag_Status = 'FECHADO');
	SET valor_venda = (SELECT Ped_ValT FROM pagamento JOIN pedidos ON Pag_Ped_ID = Ped_ID WHERE Ped_Status = 'FECHADO');
    
    UPDATE pedidos
    SET Ped_Status = 'FECHADO'
    WHERE Ped_ID = ref_pedido_ID;
    
    IF paga_modalida = 'Vista' THEN
		SET valor_anterior = (SELECT Cai_Saldo_Vista FROM caixa WHERE Cai_ID =1); 
		UPDATE caixa
		SET Cai_Saldo_Vista = valor_anterior + valor_venda
        WHERE Cai_caixa = 1;
    END IF;
    IF paga-modalida ='Cartao' THEN
		SET valor_anterior = (SELECT Cai_Saldo_Cartão FROM caixa WHERE Cai_ID =1); 
		UPDATE caixa
		SET Cai_Saldo_Cartão = valor_anterior + valor_venda
        WHERE Cai_caixa = 1;
    END IF;
    DELETE FROM pagamento WHERE Pag_Status = 'FECHADO';
END; $$
DELIMITER ;

/* Atualiza a lista de mesa quando uma reservação está feita pelo cliente*/

DELIMITER $$
CREATE TRIGGER atualizar_lista_mesa
AFTER INSERT ON reservas
FOR EACH ROW
BEGIN
	UPDATE lista_mesas
    SET Mes_Status = 'Reservado'
    WHERE Mes_ID = Res_Mes_ID;    
END; $$
DELIMITER ;

