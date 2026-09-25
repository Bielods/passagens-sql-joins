CREATE TABLE cliente (
    cod_cli     INTEGER,
    nome        VARCHAR(40),
    cpf         VARCHAR(11) UNIQUE,
    rua         VARCHAR(30),
    num         VARCHAR(10),
    bairro      VARCHAR(30),
    cidade      VARCHAR(35),
    uf          VARCHAR(2),
    cep         VARCHAR(8),
    CONSTRAINT pk_cliente PRIMARY KEY (cod_cli)
);

CREATE TABLE passagem(
    num             INTEGER,
    valor           NUMERIC(5,2) NOT NULL,
    poltrona        INTEGER NOT NULL,
    data_compra     DATE,
    tipo_cartao     INTEGER,
    num_cartao      VARCHAR(30) NOT NULL,
    cod_cli         INTEGER,
    CONSTRAINT      pk_passagem PRIMARY KEY (num),
    CONSTRAINT      fk_passagem_cli FOREIGN KEY (cod_cli)
        REFERENCES cliente(cod_cli)
);


CREATE TABLE rota(
    num_voo         VARCHAR(30),
    rota            VARCHAR(30) NOT NULL,
    num_passagem    INTEGER,
    CONSTRAINT pk_rota PRIMARY KEY (num_voo),
    CONSTRAINT fk_rota_pass FOREIGN KEY (num_passagem)
        REFERENCES passagem(num)
);

INSERT INTO cliente (cod_cli, nome, cpf, rua, num, bairro, cidade, uf, cep) 
VALUES
(1, 'EDUARDO SILVA',  '11111111111', 'Rua Cecilia',    '100', 'Centro',     'São Paulo',      'SP', '01000000'),
(2, 'MARIA OLIVEIRA', '22222222222', 'Avenida Brasil', '200', 'Jardim',     'Rio de Janeiro', 'RJ', '20000000'),
(3, 'JONAS PEREIRA',  '33333333333', 'Rua das Flores', '300', 'Bela Vista', 'Belo Horizonte', 'MG', '30000000'),
(4, 'GABRIEL SOUZA',  '44444444444', 'Rua Cecilia',    '150', 'Centro',     'São Paulo',      'SP', '01000000'),
(5, 'HELENA COSTA',   '55555555555', 'Rua Manaus',     '400', 'Industrial', 'Manaus',         'AM', '69000000'),
(6, 'EDUARDO GOMES',  '66666666666', 'Rua Central',    '500', 'Comercio',   'Salvador',       'BA', '40000000');
 
INSERT INTO passagem (num, valor, poltrona, data_compra, tipo_cartao, num_cartao, cod_cli) 
VALUES
(1, 200.00, 12, '2026-01-10', 1, '1111222233334444', 1),
(2, 350.50, 14, '2026-01-12', 2, '2222333344445555', 2),
(3, 120.00,  5, '2026-02-01', 1, '3333444455556666', 3),
(4, 180.00, 22, '2026-02-05', 2, '4444555566667777', 3),
(5,  95.00,  9, '2026-02-10', 1, '5555666677778888', 4),
(6, 275.00, 17, '2026-03-01', 2, '6666777788889999', 5);

INSERT INTO rota (num_voo, rota, num_passagem) 
VALUES
('VOO010', 'São Paulo - Rio de Janeiro',    1),
('VOO020', 'Belo Horizonte - São Paulo',    2),
('VOO030', 'Manaus - Salvador',             3),
('VOO040', 'Curitiba - Porto Alegre',       4),
('VOO050', 'São Paulo - Recife',            5),
('VOO060', 'Rio de Janeiro - Porto Alegre', 6);

--1.Selecione todos os códigos dos clientes que contém o nome EDUARDO.
SELECT cod_cli FROM cliente
	WHERE nome LIKE '%EDUARDO%';
--2.Selecione todos os clientes com o código maior ou igual a 2.
SELECT * FROM cliente
	WHERE cod_cli >=2;
--3.Selecione o número do voo de todas as rotas que contenham São Paulo.
SELECT num_voo FROM rota
	WHERE rota LIKE '%São Paulo%';
--4.Selecione todos os clientes que moram no estado de SP ou na ‘Rua Cecilia’.
SELECT * FROM cliente
	WHERE uf = 'SP' OR rua LIKE '%Rua Cecilia%';
--5.Selecione o código e o nome dos clientes em ordem crescente pelo nome.
SELECT cod_cli, nome FROM cliente
	ORDER BY nome;
--6.Selecione o código e o nome dos clientes em ordem decrescente pelo código.
SELECT cod_cli, nome FROM cliente
	ORDER BY cod_cli DESC;
--7.Selecione todos os clientes que não moram no estado de SP em ordem crescente pelo estado e ordem decrescente pelo nome.
SELECT * FROM cliente 
WHERE uf != 'SP'
ORDER BY uf ASC, nome DESC;
--8.Selecione os nomes dos clientes com código entre 2 e 5.
SELECT nome FROM cliente 
	WHERE cod_cli BETWEEN 2 AND 5;
--9.Selecione os nomes de clientes que contenham a letra E.
SELECT nome FROM cliente
	WHERE nome LIKE '%E%';
--10.Selecione os nomes de clientes que não comecem com a letra G
SELECT nome FROM cliente 
	WHERE nome NOT LIKE 'G%';
--11.Selecione os nomes de estados que comecem com M e tenham qualquer outro caractere
SELECT uf FROM cliente
	WHERE uf LIKE 'M%';
--12.Selecione o nome do cliente e seu respectivo número da passagem e poltrona ordenando pelo nome e número da passagem em ordem crescente.
SELECT c.nome, p.num, p.poltrona FROM cliente c
JOIN passagem p ON c.cod_cli = p.cod_cli
ORDER BY nome, p.num;
--13.Selecione o nome do cliente e seu respectivo número da passagem, poltrona e número do voo.
SELECT c.nome, p.num, p.poltrona, r.num_voo FROM cliente c
JOIN passagem p ON c.cod_cli = p.cod_cli
JOIN rota r ON r.num_passagem = p.num;
--14.Selecione o número da passagem, poltrona, rota e número do voo do cliente ‘JONAS’.
SELECT p.num, p.poltrona, r.rota, r.num_voo FROM passagem p
JOIN cliente c ON c.cod_cli = p.cod_cli
JOIN rota r ON r.num_passagem = p.num
WHERE c.nome LIKE '%JONAS%';
--15.Selecione o número da passagem, poltrona, rota e número do voo do cliente ‘JONAS’ cujo valor seja maior que R$ 150,00.
SELECT p.num, p.poltrona, r.rota, r.num_voo FROM passagem p
JOIN cliente c ON c.cod_cli = p.cod_cli
JOIN rota r ON r.num_passagem = p.num
WHERE c.nome LIKE '%JONAS%' AND p.valor >=150;