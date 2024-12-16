-- 1. Procedure para adicionar um novo cliente
DELIMITER //
CREATE PROCEDURE sp_add_cliente(
    IN p_nome VARCHAR(45),
    IN p_dataNasc DATE,
    IN p_email VARCHAR(45)
)
BEGIN
    INSERT INTO Cliente(nome, dataNasc, email) 
    VALUES (p_nome, p_dataNasc, p_email);
END //
DELIMITER ;

-- 2. Procedure para adicionar um agendamento
DELIMITER //
CREATE PROCEDURE sp_add_agendamento(
    IN p_dataAgend DATETIME,
    IN p_funcionario_cpf VARCHAR(14),
    IN p_cliente_idCliente INT
)
BEGIN
    INSERT INTO Agendamento(dataAgend, Funcionario_cpf, Cliente_idCliente) 
    VALUES (p_dataAgend, p_funcionario_cpf, p_cliente_idCliente);
END //
DELIMITER ;

-- 3. Procedure para realizar uma venda
DELIMITER //
CREATE PROCEDURE sp_realizar_venda(
	IN p_data DATETIME,
    IN p_cliente_idCliente INT,
    IN p_funcionario_cpf VARCHAR(14),
    IN p_ValorTotal DECIMAL(6,2)
)
BEGIN
    INSERT INTO Vendas(data, ValorTotal, Cliente_idCliente, Funcionario_cpf) 
    VALUES (p_data, p_ValorTotal, p_cliente_idCliente, p_funcionario_cpf);
END //
DELIMITER ;

-- 4. Procedure para registrar um pagamento
DELIMITER //
CREATE PROCEDURE sp_registrar_pagamento(
    IN p_valorPago DECIMAL(6,2),
    IN p_formaPag VARCHAR(45),
    IN p_desconto DECIMAL(4,2),
    IN p_vendas_idVendas INT
)
BEGIN
    INSERT INTO Pagamento(valorPago, formaPag, desconto, Vendas_idVendas) 
    VALUES (p_valorPago, p_formaPag, p_desconto, p_vendas_idVendas);
END //
DELIMITER ;

-- 5. Function para calcular o total de vendas de um cliente
DELIMITER //
CREATE FUNCTION fn_total_vendas_cliente(p_cliente_id INT)
RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(6,2);
    SELECT SUM(ValorTotal) INTO total
    FROM Vendas
    WHERE Cliente_idCliente = p_cliente_id;
    RETURN total;
END //
DELIMITER ;

-- 6. Function para calcular o total de serviços realizados por um funcionário
DELIMITER //
CREATE FUNCTION fn_total_servicos_funcionario(p_funcionario_cpf VARCHAR(14))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM Servico
    WHERE Funcionario_cpf = p_funcionario_cpf;
    RETURN total;
END //
DELIMITER ;

-- 7. Procedure para atualizar o salário de um funcionário
DELIMITER //
CREATE PROCEDURE sp_atualizar_salario_funcionario(
    IN p_funcionario_cpf VARCHAR(14),
    IN p_novo_salario DECIMAL(7,2)
)
BEGIN
    UPDATE Funcionario
    SET salario = p_novo_salario
    WHERE cpf = p_funcionario_cpf;
END //
DELIMITER ;

-- 8. Procedure para remover um agendamento
DELIMITER //
CREATE PROCEDURE sp_remover_agendamento(
    IN p_idAgendamento INT
)
BEGIN
    DELETE FROM Agendamento 
    WHERE idAgendamento = p_idAgendamento;
END //
DELIMITER ;

-- 9. Procedure para atualizar email do cliente
DELIMITER //
CREATE PROCEDURE sp_atualizar_email_cliente(
    IN p_cliente_idcliente INT,
    IN p_novo_email VARCHAR(45)
)
BEGIN
    UPDATE Cliente
    SET email = p_novo_email
    WHERE idcliente = p_cliente_idcliente ;
END //
DELIMITER ;s

-- 10. Procedure para adicionar um feedback de um cliente
DELIMITER //
CREATE PROCEDURE sp_add_feedback(
	IN p_dataFeedback DATETIME,
    IN p_cliente_idCliente INT,
    IN p_comentario TEXT
)
BEGIN
    INSERT INTO Feedback(dataFeedback, comentario, Cliente_idCliente)
    VALUES (p_dataFeedback, p_comentario, p_cliente_idCliente);
END //
DELIMITER ;
