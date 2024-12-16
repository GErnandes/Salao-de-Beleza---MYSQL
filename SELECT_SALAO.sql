-- 1. Listar todos os clientes e seus respectivos números de telefone
SELECT c.idCliente, c.nome, t.numero
FROM Cliente c
JOIN Telefone_cliente t ON c.idCliente = t.Cliente_idCliente;

-- 2. Listar os agendamentos de clientes junto com o nome do funcionário responsável
SELECT a.idAgendamento, a.dataAgend, c.nome AS Cliente, f.nome AS Funcionario
FROM Agendamento a
JOIN Cliente c ON a.Cliente_idCliente = c.idCliente
JOIN Funcionario f ON a.Funcionario_cpf = f.cpf;

-- 3. Verificar quais funcionários possuem agendamentos para um determinado dia
SELECT f.nome, COUNT(a.idAgendamento) AS TotalAgendamentos
FROM Funcionario f
JOIN Agendamento a ON f.cpf = a.Funcionario_cpf
WHERE DATE(a.dataAgend) = '2024-12-15'
GROUP BY f.nome;

-- 4. Listar clientes que agendaram serviços no dia 15 de dezembro de 2024
SELECT c.nome, a.dataAgend
FROM Agendamento a
JOIN Cliente c ON a.Cliente_idCliente = c.idCliente
WHERE DATE(a.dataAgend) = '2024-12-15';

-- 5. Exibir todos os serviços com o preço e o nome do funcionário responsável
SELECT s.nome AS Servico, s.preco, f.nome AS Funcionario
FROM Servico s
JOIN Funcionario f ON s.Funcionario_cpf = f.cpf;

-- 6. Contar o número de agendamentos por cliente
SELECT c.nome, COUNT(a.idAgendamento) AS TotalAgendamentos
FROM Cliente c
JOIN Agendamento a ON c.idCliente = a.Cliente_idCliente
GROUP BY c.nome;

-- 7. Buscar todos os agendamentos feitos por um cliente específico
SELECT a.idAgendamento, a.dataAgend, f.nome AS Funcionario
FROM Agendamento a
JOIN Funcionario f ON a.Funcionario_cpf = f.cpf
WHERE a.Cliente_idCliente = 1;

-- 8. Listar funcionários que têm um salário maior que a média salarial dos funcionários
SELECT f.nome, f.salario
FROM Funcionario f
WHERE f.salario > (SELECT AVG(salario) FROM Funcionario);

-- 9. Exibir o total de agendamentos por dia
SELECT DATE(a.dataAgend), COUNT(a.idAgendamento) AS TotalAgendamentos
FROM Agendamento a
GROUP BY DATE(a.dataAgend);

-- 10. Listar clientes que não possuem agendamentos
SELECT c.nome
FROM Cliente c
WHERE c.idCliente NOT IN (SELECT a.Cliente_idCliente FROM Agendamento a);

-- 11. Exibir os funcionários que têm mais de 3 agendamentos em um dia específico
SELECT f.nome, COUNT(a.idAgendamento) AS TotalAgendamentos
FROM Funcionario f
JOIN Agendamento a ON f.cpf = a.Funcionario_cpf
WHERE DATE(a.dataAgend) = '2024-12-17'
GROUP BY f.nome
HAVING COUNT(a.idAgendamento) > 3;

-- 12. Listar os serviços mais caros e os respectivos funcionários responsáveis
SELECT s.nome, s.preco, f.nome AS Funcionario
FROM Servico s
JOIN Funcionario f ON s.Funcionario_cpf = f.cpf
WHERE s.preco > (SELECT AVG(preco) FROM Servico);

-- 13. Contar o número de serviços realizados por cada funcionário
SELECT f.nome, COUNT(s.idServico) AS TotalServicos
FROM Funcionario f
JOIN Servico s ON f.cpf = s.Funcionario_cpf
GROUP BY f.nome;

-- 14. Exibir o nome do cliente, data do agendamento e o serviço solicitado
SELECT c.nome, a.dataAgend, s.nome, s.funcionario_cpf AS Servico
FROM Agendamento a
JOIN Cliente c ON a.Cliente_idCliente = c.idCliente
JOIN Servico s ON a.idAgendamento = s.idServico
JOIN Funcionario f ON s.Funcionario_cpf = f.cpf;

-- 15. Listar todos os funcionários e seus respectivos números de telefone
SELECT f.cpf, f.nome, t.numero
FROM Funcionario f
JOIN Telefone_funcionario t ON f.cpf = t.Funcionario_cpf;

-- 16. Listar os clientes que contrataram serviços com valor superior a 100 reais
SELECT c.nome, s.nome AS Servico, s.preco
FROM Cliente c
JOIN Agendamento a ON c.idCliente = a.Cliente_idCliente
JOIN Servico s ON a.idAgendamento = s.idServico
WHERE s.preco > 100;

-- 17. Exibir os funcionários com o menor salário em cada cargo
SELECT f.cargo, f.nome, f.salario
FROM Funcionario f
WHERE f.salario = (SELECT MIN(salario) FROM Funcionario WHERE cargo = f.cargo);

-- 18. Mostrar o feedback de um cliente especifico 
SELECT f.idFeedback, f.dataFeedback, f.comentario AS Comentario
FROM Feedback f
WHERE f.Cliente_idCliente = 1;

-- 19. Listar os serviços que foram realizados mais de 2 vezes
SELECT s.nome, COUNT(a.idAgendamento) AS TotalRealizacoes
FROM Servico s
JOIN Agendamento a ON s.idServico = a.idAgendamento
GROUP BY s.nome
HAVING COUNT(a.idAgendamento) > 2;

-- 20. Listar o nome do cliente e o valor total das suas vendas
SELECT c.nome AS cliente_nome, v.ValorTotal AS valor_venda
FROM Cliente c
JOIN Vendas v ON c.idCliente = v.Cliente_idCliente
LIMIT 10;