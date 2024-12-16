-- EXECUTANDO AS VIEWS
SELECT * FROM vw_servicos_funcionario;
SELECT * FROM vw_clientes_vendas;
SELECT * FROM vw_funcionarios_servicos;
SELECT * FROM vw_vendas_data;
SELECT * FROM vw_feedback_clientes;
SELECT * FROM vw_PagamentosVendas;
select * from vw_registros_servicos;
select * from vw_vendas_cliente;
select * from vw_agendamentos_funcionario;
select * from vw_agendamentos_data_cliente_funcionario;

-- Testando a trigger after_venda_delete
SELECT * FROM RegistroServico WHERE Vendas_idVendas = 1;
DELETE FROM Vendas WHERE idVendas = 1;

-- Testando a trigger after_agendamento_delete
DELETE FROM Agendamento WHERE idAgendamento = 2;
SELECT * FROM RegistroServico WHERE Agendamento_idAgendamento = 2;

-- Testando a trigger after_agendamento_insert DEVE DAR ERRO, POIS O HORARIO É INDISPONIVEL
INSERT INTO Agendamento (dataAgend, Funcionario_cpf, Cliente_idCliente)
VALUES ('2024-12-15 07:30:00', '77889900112', 16);

-- Testando a trigger before_cliente_delete
DELETE FROM Cliente WHERE idCliente = 2;

-- Testando a trigger before_cliente_update DEVE DAR ERRO, POIS O EMAIL ESTÁ ERRADO
UPDATE Cliente SET email = 'novoemail@d9om*[n}io.com' WHERE idCliente = 1;

-- Testando a trigger after_funcionario_update
UPDATE Funcionario
SET salario = 3400.00
WHERE cpf = '22334455667';

-- Executando as procedures após criação

CALL sp_add_cliente('Gabriel Ernandes', '2005-02-02', 'gernandes@email.com');

CALL sp_add_agendamento('2024-12-17 17:00:00', '12345678901', 16);

CALL sp_realizar_venda('2024-12-18 10:00:00', 16, '77889900112',  100.00 );

CALL sp_registrar_pagamento(230.00, 'Dinheiro', 0.00, 16);

SELECT fn_total_vendas_cliente(1) AS total_servicos;

SELECT fn_total_servicos_funcionario('77889900112') AS total_servicos;

CALL sp_atualizar_salario_funcionario('77889900112', 3500.00);

CALL sp_remover_agendamento(17);

CALL sp_atualizar_email_cliente(16, 'gen@email.com');

CALL sp_add_feedback('2024-12-30 14:30:00', 16, 'Muito satisfeito com o atendimento, a estrutura e principalmente com meu cabelo :)');
