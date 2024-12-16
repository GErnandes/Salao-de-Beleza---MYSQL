INSERT INTO `mydb`.`Funcionario` (`cpf`, `nome`, `dataNasc`, `salario`, `email`, `cargo`, `dataAdm`, `sexo`) VALUES
('12345678901', 'Carlos Henrique', '1980-04-12', 2500.00, 'carlos.henrique@email.com', 'Atendente', '2020-06-10', 'M'),
('98765432100', 'Juliana Silva', '1990-02-25', 3200.00, 'juliana.silva@email.com', 'Recepcionista', '2021-01-20', 'F'),
('11223344556', 'Ricardo Pereira', '1985-07-30', 4000.00, 'ricardo.pereira@email.com', 'Gerente', '2018-03-05', 'M'),
('22334455667', 'Patrícia Costa', '1988-09-15', 3500.00, 'patricia.costa@email.com', 'Coordenadora', '2019-07-12', 'F'),
('33445566778', 'Luciano Almeida', '1992-01-10', 2700.00, 'luciano.almeida@email.com', 'Atendente', '2022-05-25', 'M'),
('44556677889', 'Ana Souza', '1987-11-20', 3000.00, 'ana.souza@email.com', 'Recepcionista', '2020-09-18', 'F'),
('55667788990', 'João Santos', '1983-03-08', 5000.00, 'joao.santos@email.com', 'Gerente', '2017-08-17', 'M'),
('66778899001', 'Marta Ribeiro', '1994-05-05', 2900.00, 'marta.ribeiro@email.com', 'Coordenadora', '2023-02-19', 'F'),
('77889900112', 'Rafael Martins', '1989-10-22', 3300.00, 'rafael.martins@email.com', 'Atendente', '2021-04-15', 'M'),
('88990011223', 'Carlos Costa', '1991-06-30', 3200.00, 'carlos.costa@email.com', 'Recepcionista', '2022-01-10', 'M');

INSERT INTO `mydb`.`Cliente` (`nome`, `dataNasc`, `email`) VALUES
('João Silva', '1985-05-15', 'joao.silva@email.com'),
('Maria Oliveira', '1990-03-22', 'maria.oliveira@email.com'),
('Carlos Pereira', '1982-07-30', 'carlos.pereira@email.com'),
('Ana Costa', '1989-12-04', 'ana.costa@email.com'),
('Pedro Souza', '1978-11-10', 'pedro.souza@email.com'),
('Luciana Almeida', '1993-01-25', 'luciana.almeida@email.com'),
('Rafael Mendes', '1980-09-18', 'rafael.mendes@email.com'),
('Juliana Santos', '1995-10-13', 'juliana.santos@email.com'),
('Ricardo Lima', '1983-06-07', 'ricardo.lima@email.com'),
('Patrícia Rodrigues', '1992-02-28', 'patricia.rodrigues@email.com'),
('Gabriel Silva', '1987-11-20', 'gabriel.silva@email.com'),
('Camila Martins', '1994-06-12', 'camila.martins@email.com'),
('Lucas Souza', '1986-02-05', 'lucas.souza@email.com'),
('Tatiane Costa', '1991-04-14', 'tatiane.costa@email.com'),
('Felipe Rocha', '1980-09-23', 'felipe.rocha@email.com');


INSERT INTO `mydb`.`Agendamento` (`dataAgend`, `Funcionario_cpf`, `Cliente_idCliente`) VALUES
('2024-12-14 09:00:00', '12345678901', 1),
('2024-12-14 10:00:00', '98765432100', 2),
('2024-12-14 11:00:00', '11223344556', 3),
('2024-12-14 14:00:00', '22334455667', 4),
('2024-12-14 15:00:00', '33445566778', 5),
('2024-12-14 16:00:00', '44556677889', 6),
('2024-12-14 17:00:00', '55667788990', 7),
('2024-12-15 09:00:00', '66778899001', 8),
('2024-12-15 10:00:00', '77889900112', 9),
('2024-12-15 11:00:00', '88990011223', 10),
('2024-12-17 14:00:00', '12345678901', 2),
('2024-12-17 13:00:00', '12345678901', 3),
('2024-12-17 12:00:00', '12345678901', 2),
('2024-12-17 11:00:00', '12345678901', 5);


INSERT INTO `mydb`.`Servico` (`nome`, `descricao`, `preco`, `Funcionario_cpf`) VALUES
('Corte de Cabelo', 'Corte de cabelo masculino', 50.00, '12345678901'),
('Manicure', 'Serviço de manicure e pedicure', 30.00, '98765432100'),
('Massagem Relaxante', 'Massagem terapêutica', 80.00, '11223344556'),
('Limpeza de Pele', 'Tratamento facial', 120.00, '22334455667'),
('Corte de Cabelo', 'Corte de cabelo feminino', 60.00, '33445566778'),
('Pintura de Unhas', 'Unhas decoradas e coloridas', 40.00, '44556677889'),
('Design de Sobrancelhas', 'Modelagem e design de sobrancelhas', 35.00, '55667788990'),
('Depilação', 'Depilação facial e corporal', 90.00, '66778899001'),
('Escova Progressiva', 'Escova progressiva para cabelos', 150.00, '77889900112'),
('Corte de Cabelo', 'Corte de cabelo estilo moderno', 55.00, '88990011223'),
('Hidratação Capilar', 'Tratamento de hidratação para cabelos', 70.00, '12345678901'),
('Maquiagem', 'Serviço de maquiagem para eventos', 100.00, '55667788990'),
('Alisamento', 'Tratamento para alisar cabelos', 200.00, '12345678901'),
('Barbearia', 'Aparar barba e bigode com estilo', 40.00, '12345678901'),
('Coloração', 'Tintura completa para cabelos', 120.00, '33445566778'),
('Peeling Facial', 'Peeling químico para rejuvenescimento da pele', 130.00, '22334455667'),
('Alongamento de Unhas', 'Unhas em gel ou acrílico', 80.00, '44556677889'),
('Tratamento Capilar', 'Reconstrução capilar profunda', 110.00, '77889900112'),
('Banho de Lua', 'Clareamento dos pelos corporais', 90.00, '22334455667'),
('Penteado', 'Penteado para festas e eventos', 150.00, '88990011223');

INSERT INTO `mydb`.`agendamentoservico` (`Agendamento_idAgendamento`, `Servico_idServico`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO `mydb`.`Dependentes` (`cpf`, `nome`, `parentesco`, `dataNasc`, `Funcionario_cpf`) VALUES
('11111111111', 'Maria Clara', 'Filha', '2010-03-25', '12345678901'), -- Carlos Henrique
('22222222222', 'Pedro Henrique', 'Filho', '2012-08-12', '98765432100'), -- Juliana Silva
('33333333333', 'Ana Beatriz', 'Esposa', '1987-05-15', '11223344556'), -- Ricardo Pereira
('44444444444', 'Lucas Costa', 'Filho', '2015-09-22', '22334455667'), -- Patrícia Costa
('55555555555', 'João Guilherme', 'Filho', '2018-11-03', '33445566778'), -- Luciano Almeida
('66666666666', 'Isabela Souza', 'Filha', '2016-07-18', '44556677889'), -- Ana Souza
('77777777777', 'Gabriel Santos', 'Filho', '2013-12-02', '55667788990'), -- João Santos
('88888888888', 'Sofia Ribeiro', 'Filha', '2020-04-15', '66778899001'), -- Marta Ribeiro
('99999999999', 'Fernanda Martins', 'Esposa', '1991-06-12', '77889900112'), -- Rafael Martins
('12345678900', 'Clara Costa', 'Filha', '2017-02-28', '88990011223'); -- Carlos Costa

INSERT INTO `mydb`.`Endereco` (`cep`, `rua`, `bairro`, `cidade`, `numero`, `Funcionario_cpf`) VALUES
('50000000', 'Rua do Sol', 'Boa Vista', 'Recife', 100, '12345678901'),
('51000000', 'Avenida Conde da Boa Vista', 'Centro', 'Recife', 200, '98765432100'),
('52000000', 'Rua da Aurora', 'São José', 'Recife', 300, '11223344556'),
('52100000', 'Avenida Agamenon Magalhães', 'Santo Amaro', 'Recife', 400, '22334455667'),
('52130000', 'Rua Dom Bosco', 'Afogados', 'Recife', 500, '33445566778'),
('52150000', 'Avenida Mascarenhas de Morais', 'Imbiribeira', 'Recife', 600, '44556677889'),
('52200000', 'Rua Barão de Itapary', 'Cordeiro', 'Recife', 700, '55667788990'),
('52300000', 'Avenida Beira Mar', 'Boa Viagem', 'Recife', 800, '66778899001'),
('52400000', 'Rua João de Barros', 'Espinheiro', 'Recife', 900, '77889900112'),
('52500000', 'Avenida Recife', 'Jardim São Paulo', 'Recife', 1000, '88990011223');

INSERT INTO `mydb`.`Vendas` (`data`, `ValorTotal`, `Cliente_idCliente`, `Funcionario_cpf`) VALUES
('2024-12-10 10:00:00', 180.00, 1, '12345678901'),
('2024-12-10 14:00:00', 100.00, 3, '12345678901'),
('2024-12-11 09:00:00', 80.00, 11, '98765432100'),
('2024-12-11 11:00:00', 150.00, 2, '98765432100'),
('2024-12-11 15:00:00', 200.00, 7, '11223344556'),
('2024-12-12 10:00:00', 130.00, 9, '22334455667'),
('2024-12-12 11:00:00', 100.00, 5, '33445566778'),
('2024-12-12 12:00:00', 250.00, 3, '11223344556'),
('2024-12-13 13:00:00', 130.00, 4, '22334455667'),
('2024-12-14 14:00:00', 100.00, 5, '33445566778'),
('2024-12-15 15:00:00', 200.00, 6, '44556677889'),
('2024-12-16 16:00:00', 180.00, 7, '55667788990'),
('2024-12-17 17:00:00', 250.00, 8, '66778899001'),
('2024-12-18 18:00:00', 220.00, 9, '77889900112'),
('2024-12-19 19:00:00', 300.00, 10, '88990011223'),
('2024-12-20 10:30:00', 210.00, 1, '12345678901'),
('2024-12-21 11:30:00', 170.00, 2, '98765432100'),
('2024-12-22 12:30:00', 260.00, 3, '11223344556'),
('2024-12-23 13:30:00', 140.00, 4, '22334455667'),
('2024-12-24 14:30:00', 110.00, 3, '33445566778'),
('2024-12-25 15:30:00', 230.00, 1, '44556677889'),
('2024-12-26 16:30:00', 190.00, 13, '55667788990'),
('2024-12-27 17:30:00', 270.00, 8, '66778899001'),
('2024-12-28 18:30:00', 240.00, 7, '77889900112'),
('2024-12-29 19:30:00', 310.00, 12, '88990011223');


INSERT INTO `mydb`.`Pagamento` (`valorPago`, `formaPag`, `desconto`, `Vendas_idVendas`) VALUES
(180.00, 'Cartão de Crédito', 0.00, 1),
(150.00, 'Dinheiro', 0.00, 2),
(250.00, 'Pix', 0.00, 3),
(130.00, 'Cartão de Débito', 0.00, 4),
(100.00, 'Cartão de Crédito', 0.00, 5),
(200.00, 'Pix', 0.00, 6),
(180.00, 'Dinheiro', 0.00, 7),
(250.00, 'Cartão de Débito', 0.00, 8),
(220.00, 'Cartão de Crédito', 0.00, 9),
(300.00, 'Dinheiro', 0.00, 10);

INSERT INTO `mydb`.`Feedback` (`dataFeedback`, `comentario`, `Cliente_idCliente`) VALUES
('2024-12-10 10:00:00', 'Ótimo atendimento!', 1),
('2024-12-11 11:00:00', 'Serviço rápido e eficaz!', 2),
('2024-12-12 12:00:00', 'Muito satisfeito com o corte!', 3),
('2024-12-13 13:00:00', 'Profissionais bem qualificados.', 4),
('2024-12-14 14:00:00', 'Ambiente agradável.', 5),
('2024-12-15 15:00:00', 'Preço justo e atendimento excelente.', 6),
('2024-12-16 16:00:00', 'Corte de cabelo impecável!', 7),
('2024-12-17 17:00:00', 'Amei o design de sobrancelhas!', 8),
('2024-12-18 18:00:00', 'Recomendo para todos!', 9),
('2024-12-19 19:00:00', 'Sempre volto! Serviço de qualidade.', 10),
('2024-12-20 10:30:00', 'Atendimento excepcional, adorei!', 1),
('2024-12-21 11:30:00', 'Os produtos utilizados são de alta qualidade.', 2),
('2024-12-22 12:30:00', 'Minha pele ficou incrível após o tratamento.', 3),
('2024-12-23 13:30:00', 'Equipe super atenciosa e cuidadosa.', 1),
('2024-12-24 14:30:00', 'Meus cabelos ficaram perfeitos, muito obrigado!', 10),
('2024-12-25 15:30:00', 'Horários bem organizados, tudo muito pontual.', 6),
('2024-12-26 16:30:00', 'Voltei pela segunda vez e continuaram incríveis.', 2),
('2024-12-27 17:30:00', 'Minha manicure ficou maravilhosa, recomendo!', 8),
('2024-12-28 18:30:00', 'Muito satisfeita com a progressiva.', 9),
('2024-12-29 19:30:00', 'Melhor salão da região, com certeza!', 10);

INSERT INTO `mydb`.`registroservico` (`dataRegistro`, `Agendamento_idAgendamento`, `Vendas_idVendas`, `Servico_idServico`) VALUES
('2024-12-10 10:00:00', 1, 1, 1),
('2024-12-11 11:00:00', 2, 2, 2),
('2024-12-12 12:00:00', 3, 3, 3),
('2024-12-13 13:00:00', 4, 4, 4),
('2024-12-14 14:00:00', 5, 5, 5),
('2024-12-15 15:00:00', 6, 6, 6),
('2024-12-16 16:00:00', 7, 7, 7),
('2024-12-17 17:00:00', 8, 8, 8),
('2024-12-18 18:00:00', 9, 9, 9),
('2024-12-19 19:00:00', 10, 10, 10);

INSERT INTO `mydb`.`Telefone_cliente` (`numero`, `Cliente_idCliente`) VALUES
('8181234567', 1),
('8182345678', 2),
('8183456789', 3),
('8184567890', 4),
('8185678901', 5),
('8186789012', 6),
('8187890123', 7),
('8188901234', 8),
('8189012345', 9),
('8180123456', 10);

INSERT INTO `mydb`.`Telefone_funcionario` (`numero`, `Funcionario_cpf`) VALUES
('8181122334', '12345678901'),
('8182233445', '98765432100'),
('8183344556', '11223344556'),
('8184455667', '22334455667'),
('8185566778', '33445566778'),
('8186677889', '44556677889'),
('8187788990', '55667788990'),
('8188899001', '66778899001'),
('8189900112', '77889900112'),
('8181011122', '88990011223');
