DELIMITER //
CREATE TRIGGER after_venda_delete
AFTER DELETE ON Vendas
FOR EACH ROW
BEGIN
    -- Deleta os registros de serviço associados à venda deletada
    DELETE FROM RegistroServico
    WHERE Vendas_idVendas = OLD.idVendas;
END //

CREATE TRIGGER after_agendamento_delete
AFTER DELETE ON Agendamento
FOR EACH ROW
BEGIN
    -- Deleta os registros de serviço associados ao agendamento deletado
    DELETE FROM RegistroServico
    WHERE Agendamento_idAgendamento = OLD.idAgendamento;
END//

CREATE TRIGGER after_agendamento_insert
AFTER INSERT ON Agendamento
FOR EACH ROW
BEGIN
    IF HOUR(NEW.dataAgend) < 8 OR HOUR(NEW.dataAgend) > 18 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Agendamento fora do horário de funcionamento.';
    END IF;
END//

CREATE TRIGGER before_cliente_delete
BEFORE DELETE ON Cliente
FOR EACH ROW
BEGIN
    -- Excluir agendamentos futuros do cliente que será excluído
    DELETE FROM Agendamento
    WHERE Cliente_idCliente = OLD.idCliente AND dataAgend > NOW();
END//

CREATE TRIGGER before_cliente_update
BEFORE UPDATE ON Cliente
FOR EACH ROW
BEGIN
    IF NOT NEW.email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email inválido.';
    END IF;
END//

CREATE TRIGGER after_funcionario_update
AFTER UPDATE ON Funcionario
FOR EACH ROW
BEGIN
	DECLARE msg VARCHAR(255);
    IF NEW.salario < OLD.salario THEN
        SET msg = CONCAT('Salário do funcionário ', NEW.nome, ' diminuiu para ', NEW.salario);
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = msg;
    END IF;
END//
DELIMITER ;