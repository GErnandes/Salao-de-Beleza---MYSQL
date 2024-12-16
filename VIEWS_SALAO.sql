-- 1. View para listar clientes com suas vendas
CREATE VIEW vw_clientes_vendas AS
SELECT 
    c.idCliente, 
    c.nome AS cliente_nome, 
    COUNT(v.idVendas) AS total_vendas, 
    SUM(v.ValorTotal) AS total_valor_vendas
FROM 
    Cliente c
JOIN 
    Vendas v ON c.idCliente = v.Cliente_idCliente
GROUP BY 
    c.idCliente;

-- 2. View para listar os funcionários e seus serviços
CREATE VIEW vw_funcionarios_servicos AS
SELECT 
    f.cpf AS funcionario_cpf, 
    f.nome AS funcionario_nome, 
    s.nome AS servico_nome, 
    COUNT(s.idServico) AS total_servicos
FROM 
    Funcionario f
JOIN 
    Servico s ON f.cpf = s.Funcionario_cpf
GROUP BY 
    f.cpf, s.idServico;
    
-- 3. View para listar vendas realizadas por data
CREATE VIEW vw_vendas_data AS
SELECT 
    v.idVendas, 
    v.data AS data_venda, 
    v.ValorTotal, 
    c.nome AS cliente_nome
FROM 
    Vendas v
JOIN 
    Cliente c ON v.Cliente_idCliente = c.idCliente
ORDER BY 
    v.data DESC;

-- 4. View para listar agendamentos por data, com informações sobre o cliente e o funcionário
CREATE VIEW vw_agendamentos_data_cliente_funcionario AS
SELECT 
    ag.idAgendamento, 
    ag.dataAgend, 
    c.nome AS cliente_nome, 
    f.nome AS funcionario_nome, 
    f.cargo AS funcionario_cargo, 
    ag.Funcionario_cpf, 
    ag.Cliente_idCliente
FROM 
    Agendamento ag
JOIN 
    Cliente c ON ag.Cliente_idCliente = c.idCliente
JOIN 
    Funcionario f ON ag.Funcionario_cpf = f.cpf
ORDER BY 
    ag.dataAgend DESC;

-- 5. View para listar serviços de um funcionário
CREATE VIEW vw_servicos_funcionario AS
SELECT 
    f.nome AS funcionario_nome, 
    s.nome AS servico_nome, 
    s.preco
FROM 
    Funcionario f
JOIN 
    Servico s ON f.cpf = s.Funcionario_cpf;

-- 6. View para listar feedbacks de clientes
CREATE VIEW vw_feedback_clientes AS
SELECT 
    f.idFeedback, 
    f.dataFeedback, 
    f.comentario, 
    c.nome AS cliente_nome
FROM 
    Feedback f
JOIN 
    Cliente c ON f.Cliente_idCliente = c.idCliente;

-- 7. View para listar os pagamentos de vendas
CREATE VIEW vw_PagamentosVendas AS
SELECT 
    Pagamento.idPagamento AS IDPagamento,
    Vendas.idVendas AS IDVenda,
    Pagamento.valorPago AS ValorPago,
    Pagamento.formaPag AS FormaPagamento,
    Pagamento.desconto AS Desconto,
    Vendas.data AS DataVenda,
    Vendas.ValorTotal AS ValorTotalVenda,
    Vendas.Cliente_idCliente AS IDCliente,
    Vendas.Funcionario_cpf AS CPFFuncionario
FROM 
    Pagamento
INNER JOIN 
    Vendas ON Pagamento.Vendas_idVendas = Vendas.idVendas;

-- 8. View para listar registros de serviços realizados
CREATE VIEW vw_registros_servicos AS
SELECT 
    rs.idRegistroServico, 
    rs.dataRegistro,
    v.valorTotal, 
    v.idVendas, 
    s.nome AS servico_nome
FROM 
    RegistroServico rs
JOIN 
    Vendas v ON rs.Vendas_idVendas = v.idVendas
JOIN 
    Servico s ON rs.idRegistroServico = s.idServico;

-- 9. View para listar as vendas de um cliente específico
CREATE VIEW vw_vendas_cliente AS
SELECT 
    v.idVendas, 
    v.data, 
    v.ValorTotal
FROM 
    Vendas v
JOIN 
    Cliente c ON v.Cliente_idCliente = c.idCliente
WHERE 
    c.idCliente = 1;  -- Alterar conforme necessário para o cliente desejado

-- 10. View para listar os agendamentos de um funcionário especifico
CREATE VIEW vw_agendamentos_funcionario AS
SELECT 
    ag.idAgendamento, 
    ag.dataAgend, 
    c.nome AS cliente_nome
FROM 
    Agendamento ag
JOIN 
    Funcionario f ON ag.Funcionario_cpf = f.cpf
JOIN 
    Cliente c ON ag.Cliente_idCliente = c.idCliente
WHERE 
    f.cpf = '12345678901';  -- Alterar conforme necessário para o funcionário desejado
    