CREATE DATABASE lojaVinhos;
USE lojavinhos;


/*Criando tabelas */

CREATE TABLE cliente(

id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
sexo CHAR(1) NOT NULL,
idade INTEGER NOT NULL,
nascimento DATE NOT NULL

);

CREATE TABLE clienteespecial(

id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
sexo CHAR(1) NOT NULL,
idade INTEGER NOT NULL,
id_cliente INTEGER,
FOREIGN KEY(id_cliente) REFERENCES cliente(id),
cashback DECIMAL(10, 2)

);

CREATE TABLE funcionario(

id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
idade INTEGER NOT NULL,
sexo CHAR(1) NOT NULL,
cargo VARCHAR(25) NOT NULL,
salario DECIMAL(10, 2) NOT NULL,
nascimento DATE NOT NULL

);

CREATE TABLE produto (
id INTEGER PRIMARY KEY  NOT NULL AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
quantidade INTEGER NOT NULL,
descricao VARCHAR(200) NOT NULL,
valor DECIMAL(10,2)  NOT NULL
);

CREATE TABLE venda (
id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT ,
id_vendedor INTEGER,
FOREIGN KEY(id_vendedor) REFERENCES funcionario(id),
id_cliente INTEGER,
FOREIGN KEY(id_cliente) REFERENCES cliente(id),
id_produto INTEGER,
FOREIGN KEY(id_produto) REFERENCES produto(id),
data_venda DATE NOT NULL
);

CREATE TABLE funcionarioespecial(
id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
idade INTEGER NOT NULL,
sexo CHAR(1) NOT NULL,
cargo VARCHAR(25) NOT NULL,
salario DECIMAL(10, 2) NOT NULL,
nascimento DATE NOT NULL,
id_funcionario INTEGER,
FOREIGN KEY(id_funcionario) REFERENCES funcionario(id),
bonus DECIMAL (10,2)
);

/*Adicionando constrains*/

ALTER TABLE cliente ADD CONSTRAINT CHECK(sexo = 'f' OR sexo = 'm' OR sexo = 'o');
ALTER TABLE clienteespecial ADD CONSTRAINT CHECK(sexo = 'f' OR sexo = 'm' OR sexo = 'o');
ALTER TABLE funcionario ADD CONSTRAINT CHECK(sexo = 'f' OR sexo = 'm' OR sexo = 'o');
ALTER TABLE funcionarioespecial ADD CONSTRAINT CHECK(sexo = 'f' OR sexo = 'm' OR sexo = 'o');
ALTER TABLE funcionario ADD CONSTRAINT CHECK(cargo = 'vendedor' OR cargo = 'gerente' OR cargo = 'CEO');
ALTER TABLE funcionarioespecial ADD CONSTRAINT CHECK(cargo = 'vendedor' OR cargo = 'gerente' OR cargo = 'CEO');

/*Inserindo valores nas tabelas */

INSERT INTO produto(nome, quantidade, descricao, valor) VALUES ('Alma Negra Mistério I (Tikal) 2019/2020', '40', 'Vinho Tinto', '246.00');
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES('Casa Perini Merlot 2019/2020', '80', 'Vinho Tinto', '64.00');
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES('AAlto Riberia del Duero 2020', '50', 'Vinho Tinto', '829.00');
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES('Quinta do Morgado Tinto Suave', '120', 'Vinho Tinto', '15.00');
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES('Alamos Bonarda 2020/2021', '60', 'Vinho Tinto', '113.32');
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES('Barista Pinotage 2022', '70', 'Vinho Tinto', '204.00');
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES('Aqui Estamos Todos Locos Bequignol', '55', 'Vinho Tinto', '152.00');
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES('Finca La Linda Malbec', '65', 'Vinho Tinto', '113.00');
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES('EPU Almaviva 2017', '90', 'Vinho Tinto', '699.00');
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES('Amancaya 2020', '100', 'Vinho Tinto', '232.00');
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES("Destino Malbec", "35", "Vinho Tinto ", "90.00");
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES("Alorna Portas do Sol", "80", "Vinho Rosé ", "36.00");
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES("Quinta de Bons Ventos", "60", "Vinho Rosé ", "70.00");
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES("Amalaya Rosado de Corte", "55", "Vinho Rosé ", "100.00");
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES("Artero Rosado La Mancha", "40", "Vinho Rosé ", "100.00");
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES("Don Luciano Cosecha", "120", "Vinho Branco ", "41.00");
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES("Benjamin Suave Refrescante ", "80", "Vinho Branco ", "45.00");
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES("Settesoli Wave", "68", "Vinho Branco ", "50.00");
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES("Ciconia", "32", "Vinho Tinto ", "70.00");
INSERT INTO produto(nome, quantidade, descricao, valor) VALUES('Alto Riberia del Duero 2000', '50', 'Vinho Tinto', '1029.00');

INSERT INTO funcionario (nome, idade, sexo, cargo, salario, nascimento) VALUES("Camila", "44", "F", "CEO", "20000.00", "1980-03-03");
INSERT INTO funcionario (nome, idade, sexo, cargo, salario, nascimento) VALUES("Robson", "32", "M", "Gerente", "7000.00", "1992-03-03");
INSERT INTO funcionario (nome, idade, sexo, cargo, salario, nascimento) VALUES("Laura", "26", "F", "Vendedor", "2000.00", "1998-03-01");
INSERT INTO funcionario (nome, idade, sexo, cargo, salario, nascimento) VALUES("Fausto", "22", "M", "Vendedor", "2000.00", "2002-04-02");
INSERT INTO funcionario (nome, idade, sexo, cargo, salario, nascimento) VALUES("Fabiana", "24", "F", "Vendedor", "2000.00", "2000-05-02");

INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Camila","F", "44", "1980-03-03");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Alice", "F", 29, "1995-04-23");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Bruno", "M", 35, "1989-06-11");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Carlos", "M", 42, "1982-08-09");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Daniela", "F", 27, "1997-02-19");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Eduardo", "M", 38, "1986-12-17");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Fernanda", "F", 33, "1991-10-15");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Gabriel", "M", 30, "1994-01-05");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Helena", "F", 25, "1999-05-25");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Igor", "M", 41, "1983-07-13");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Juliana", "F", 36, "1988-11-21");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Karina", "O", 28, "1996-03-03");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Lucas", "M", 32, "1992-09-09");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Mariana", "F", 34, "1990-04-04");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Nicolas", "M", 39, "1985-08-18");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Olivia", "F", 24, "2000-12-12");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Pedro", "M", 31, "1993-06-06");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Quintino", "M", 45, "1979-10-10");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Rafaela", "F", 37, "1987-01-01");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Sofia", "F", 26, "1998-11-11");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Thiago", "M", 40, "1984-03-03");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Ursula", "F", 29, "1995-07-07");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Victor", "M", 28, "1996-05-05");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Wellington", "M", 38, "1986-09-09");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Xenia", "F", 27, "1997-01-21");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Yuri", "M", 35, "1989-04-14");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Zoe", "F", 30, "1994-08-08");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Amanda", "F", 32, "1992-12-12");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Brenda", "F", 31, "1993-05-15");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Caio", "M", 33, "1991-07-20");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Diana", "F", 34, "1990-03-30");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Elena", "F", 35, "1989-08-08");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Fábio", "M", 36, "1988-11-11");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Gustavo", "M", 27, "1997-04-04");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Hugo", "M", 28, "1996-01-01");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Isabel", "F", 29, "1995-02-02");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Joana", "F", 30, "1994-03-03");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Kleber", "O", 31, "1993-04-04");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Laura", "F", 32, "1992-05-05");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Marcelo", "M", 33, "1991-06-06");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Natália", "F", 34, "1990-07-07");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Otávio", "M", 35, "1989-08-08");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Paula", "F", 36, "1988-09-09");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Rodrigo", "M", 37, "1987-10-10");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Sabrina", "F", 38, "1986-11-11");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Tomás", "M", 39, "1985-12-12");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Ubirajara", "M", 40, "1984-01-01");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Viviane", "F", 41, "1983-02-02");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("William", "M", 42, "1982-03-03");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Ximena", "F", 43, "1981-04-04");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Yasmin", "F", 44, "1980-05-05");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Zeca", "M", 45, "1979-06-06");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Arthur", "M", 24, "2000-07-07");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Beatriz", "F", 25, "1999-08-08");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Cristina", "O", 26, "1998-09-09");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Diego", "M", 27, "1997-10-10");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Erick", "M", 28, "1996-11-11");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Fabiana", "F", 29, "1995-12-12");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Gilberto", "M", 30, "1994-01-01");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Heloisa", "F", 31, "1993-02-02");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Ian", "O", 32, "1992-03-03");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Jessica", "F", 33, "1991-04-04");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Kauan", "M", 34, "1990-05-05");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Larissa", "F", 35, "1989-06-06");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Miguel", "M", 36, "1988-07-07");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Nicole", "F", 37, "1987-08-08");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Otávia", "F", 40, "1983-09-09");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Paulo", "M", 41, "1982-10-10");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Quésia", "F", 42, "1981-11-11");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Renato", "M", 43, "1980-12-12");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Sônia", "F", 44, "1979-01-01");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Tiago", "M", 45, "1978-02-02");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Ubaldo", "M", 46, "1977-03-03");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Vera", "F", 47, "1976-04-04");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Walter", "M", 48, "1975-05-05");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Xavier", "M", 49, "1974-06-06");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Yara", "F", 50, "1973-07-07");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Zélia", "F", 51, "1972-08-08");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("André", "M", 52, "1971-09-09");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Bianca", "F", 53, "1970-10-10");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Caetano", "M", 54, "1969-11-11");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Diana", "F", 55, "1968-12-12");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Evandro", "M", 40, "1983-05-20");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Fernanda", "F", 41, "1982-04-25");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Gustavo", "M", 42, "1981-02-28");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Helena", "F", 43, "1980-01-30");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Ivan", "M", 44, "1979-06-10");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Janaína", "F", 45, "1978-04-16");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Kaique", "M", 46, "1977-12-22");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Lúcia", "F", 47, "1976-11-11");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Marcos", "M", 48, "1975-07-19");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Nádia", "F", 49, "1974-09-09");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Orlando", "M", 50, "1973-08-08");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Priscila", "F", 51, "1972-06-06");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Ronaldo", "M", 52, "1971-05-05");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Simone", "F", 53, "1970-04-04");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Tatiana", "F", 54, "1969-03-03");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Ulisses", "M", 55, "1968-02-02");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Vitória", "F", 44, "1979-01-01");
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES("Washington", "M", 45, "1978-12-12");

/*Adiconando permissões aos usuários */
CREATE USER 'administrador'@'localhost' IDENTIFIED BY '1234';
GRANT ALL ON lojavinhos.* TO 'administrador'@'localhost';

CREATE USER 'gerente'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT, DELETE, UPDATE ON lojavinhos.* TO 'gerente'@'localhost';

CREATE USER 'funcionario'@'localhost' IDENTIFIED BY '1234';
GRANT INSERT ON lojavinhos.cliente TO 'funcionario'@'localhost';
GRANT INSERT ON lojavinhos.clienteespecial TO 'funcionario'@'localhost';
GRANT INSERT ON lojavinhos.produto TO 'funcionario'@'localhost';
GRANT INSERT, SELECT ON lojavinhos.venda TO 'funcionario'@'localhost';

FLUSH PRIVILEGES;


/* Produto mais vendido */
SELECT venda.id_produto, produto.nome, COUNT(venda.id_produto) AS quantidade_venda FROM venda
JOIN produto ON (produto.id = venda.id_produto)
GROUP BY venda.id_produto, produto.nome
ORDER BY quantidade_venda DESC
LIMIT 1;


/* Vendedor associado ao produto mais vendido problema */
SELECT venda.id_produto, produto.nome,funcionario.nome, COUNT(venda.id_produto) AS quantidade_venda FROM venda
JOIN produto ON (produto.id = venda.id_produto)
JOIN funcionario ON(funcionario.id = venda.id_vendedor)
GROUP BY venda.id_produto, produto.nome
ORDER BY quantidade_venda DESC
LIMIT 1;

/* Produto menos vendido */
SELECT venda.id_produto, produto.nome, COUNT(venda.id_produto) AS quantidade_venda FROM venda
JOIN produto ON (produto.id = venda.id_produto)
GROUP BY venda.id_produto, produto.nome
ORDER BY quantidade_venda
LIMIT 1;

/* Valor ganho com o produto mais vendido */
SELECT venda.id_produto, produto.nome, COUNT(venda.id_produto) AS quantidade_venda, SUM(produto.valor) AS ganho_porduto FROM venda
JOIN produto ON (produto.id = venda.id_produto)
GROUP BY venda.id_produto, produto.nome
ORDER BY quantidade_venda DESC
LIMIT 1;

/*Mês de maior vendas e mês de menor vendas do produto mais vendido */
SET @produto_mais_vendido = (SELECT venda.id_produto FROM venda
JOIN produto ON (produto.id = venda.id_produto)
GROUP BY venda.id_produto
ORDER BY sum(venda.id_produto) DESC
LIMIT 1);

SELECT MONTH(venda.data_venda) AS Mes_mais_vendas FROM venda WHERE venda.id_produto = @produto_mais_vendido GROUP BY data_venda ORDER BY COUNT(MONTH(venda.data_venda)) DESC LIMIT 1;
SELECT MONTH(venda.data_venda) AS Mes_menos_vendas FROM venda WHERE venda.id_produto = @produto_mais_vendido GROUP BY data_venda ORDER BY COUNT(MONTH(venda.data_venda)) LIMIT 1;

/* Valor ganho com o produto menos vendido */
SELECT venda.id_produto, produto.nome, COUNT(venda.id_produto) AS quantidade_venda, SUM(produto.valor) AS ganho_porduto FROM venda
JOIN produto ON (produto.id = venda.id_produto)
GROUP BY venda.id_produto, produto.nome
ORDER BY quantidade_venda
LIMIT 1;

/*Mês de maior vendas e menor vendas do produto menos vendido */
SET @produto_menos_vendido = (SELECT venda.id_produto FROM venda
JOIN produto ON (produto.id = venda.id_produto)
GROUP BY venda.id_produto
ORDER BY sum(venda.id_produto)
LIMIT 1);

SELECT MONTH(venda.data_venda) AS Mes_mais_vendas FROM venda WHERE venda.id_produto = @produto_menos_vendido GROUP BY data_venda ORDER BY COUNT(MONTH(venda.data_venda)) DESC LIMIT 1;
SELECT MONTH(venda.data_venda) AS Mes_menos_vendas FROM venda WHERE venda.id_produto = @produto_menos_vendido GROUP BY data_venda ORDER BY COUNT(MONTH(venda.data_venda)) LIMIT 1;


#view 1 
CREATE VIEW view_media_valor_vinhos_tintos_vendidos AS
SELECT p.descricao, AVG(p.valor) AS valor_medio
FROM produto p
JOIN venda v ON p.id = v.id_produto
WHERE p.descricao = 'Vinho Tinto'
GROUP BY p.descricao;

#view 2
CREATE VIEW view_vendas_de_produto_por_funcionario AS
SELECT f.nome AS funcionario, p.nome AS produto
FROM funcionario f
JOIN venda v ON f.id = v.id_vendedor
JOIN produto p ON v.id_produto = p.id
GROUP BY f.nome, p.nome;

SELECT * FROM view_vendas_de_produto_por_funcionario;

#view 3
CREATE VIEW view_valor_total_ganho_por_cliente AS
SELECT c.nome AS cliente, SUM(p.valor) AS total_compras
FROM cliente c
JOIN venda v ON c.id = v.id_cliente
JOIN produto p ON v.id_produto = p.id
GROUP BY c.nome;

/*Procedures*/

/*Procedure 1*/
DELIMITER //
CREATE PROCEDURE Reajuste(porcentagem_aumento FLOAT, categoria_aumento VARCHAR(25))
BEGIN 

DECLARE contador INT DEFAULT 0;
DECLARE limite INT;
DECLARE cargo_reajuste VARCHAR(20);
DECLARE aumento INTEGER;

SELECT COUNT(*) INTO limite FROM funcionario;

loop_reajuste: LOOP
	SET contador = contador + 1;
    
    IF contador > limite THEN
		LEAVE loop_reajuste;
	END IF;
    
    SELECT cargo INTO cargo_reajuste FROM funcionario WHERE id = contador;
    
    IF cargo_reajuste = categoria_aumento THEN
		SELECT salario INTO aumento FROM funcionario WHERE id = contador;
        SET aumento = aumento * porcentagem_aumento;
        SET aumento = aumento/100;
		UPDATE funcionario SET salario = salario + aumento WHERE id = contador;
	END IF;
END LOOP;

END//
DELIMITER ;

/*Procedure 2 */
DELIMITER $$
CREATE PROCEDURE Sorteio()
BEGIN 

DECLARE cliente_sorteado INTEGER;
DECLARE especial INTEGER DEFAULT 0;
DECLARE nome_sorteado VARCHAR(40);
DECLARE mensagem TEXT;

SELECT id INTO cliente_sorteado FROM cliente ORDER BY RAND() LIMIT 1;

SELECT id INTO especial FROM clienteespecial WHERE id = cliente_sorteado;
SELECT nome INTO nome_sorteado FROM cliente WHERE id = cliente_sorteado;


IF especial = 0 THEN
SELECT "Parabéns", nome_sorteado, "você ganhou um vale compras de 100 reais!";

END IF;

IF especial != 0 THEN
SELECT "Parabens", nome_soretado, "você ganhou um vale compras de 200 reais!";
END IF;


END$$
DELIMITER ;

/*Procedure 3 */
DELIMITER $$
CREATE PROCEDURE Venda(id_produto_vendido INTEGER, id_funcionario INTEGER, id_cliente_venda INTEGER)
BEGIN 

	DECLARE valor_produto DECIMAL(10,2);
    
    SELECT valor INTO valor_produto FROM produto WHERE id = id_produto_vendido;

	UPDATE produto SET produto.quantidade = produto.quantidade - 1 WHERE id = id_produto_vendido;
    UPDATE clienteespecial SET cashback = cashback - valor_produto WHERE id_cliente = id_cliente_venda;
    INSERT INTO venda (id_vendedor, id_cliente, id_produto, data_venda) VALUES (id_funcionario, id_cliente_venda, id_produto_vendido, curdate());
    
    


END$$
DELIMITER ;

/* Triggers */

/*Trigger 1*/
DELIMITER $$
CREATE TRIGGER verificacao_total_valor_em_vendas_do_vendedor
AFTER INSERT ON venda
FOR EACH ROW 
BEGIN
    DECLARE valorTotalEmVendas DECIMAL(10, 2);
    DECLARE bonusSalario DECIMAL(10, 2);
    DECLARE nome_funcionario VARCHAR(40);
    DECLARE idade_funcionario INTEGER;
    DECLARE sexo_funcionario CHAR(1);
    DECLARE cargo_funcionario VARCHAR(25);
    DECLARE salario_funcionario DECIMAL(10, 2);
    DECLARE nascimento_funcionario DATE;


    SELECT SUM(p.valor) INTO valorTotalEmVendas 
    FROM venda v 
    JOIN produto p ON v.id_produto = p.id 
    WHERE v.id_vendedor = NEW.id_vendedor;

    IF valorTotalEmVendas > 1000 THEN
        SET bonusSalario = valorTotalEmVendas * 0.05;

        IF NOT EXISTS (SELECT 1 FROM funcionarioespecial WHERE id_funcionario = NEW.id_vendedor) THEN

            SELECT f.nome, f.idade, f.sexo, f.cargo, f.salario, f.nascimento INTO nome_funcionario, idade_funcionario, sexo_funcionario, cargo_funcionario, salario_funcionario, nascimento_funcionario
            FROM funcionario f
            WHERE f.id = NEW.id_vendedor;

            INSERT INTO funcionarioespecial (nome, idade, sexo, cargo, salario, nascimento, id_funcionario, bonus)
            VALUES (nome_funcionario, idade_funcionario, sexo_funcionario, cargo_funcionario, salario_funcionario, nascimento_funcionario, NEW.id_vendedor, bonusSalario);
        ELSE
            UPDATE funcionarioespecial SET bonus = bonus + bonusSalario WHERE id_funcionario = NEW.id_vendedor;
        END IF;
    END IF;
END$$
DELIMITER ;

/*Trigger 2 */
DELIMITER $$
CREATE TRIGGER verifica_total_compra_do_cliente
AFTER INSERT ON venda
FOR EACH ROW
BEGIN
    DECLARE valor_produto DECIMAL(10, 2);
    DECLARE cashback_cliente DECIMAL(10, 2);
    DECLARE nome_cliente VARCHAR(40);
    DECLARE sexo_cliente CHAR(1);
    DECLARE idade_cliente INTEGER;

    SELECT valor INTO valor_produto FROM produto WHERE id = NEW.id_produto;

    IF valor_produto > 500 THEN

        SET cashback_cliente = valor_produto * 0.02;

        SELECT nome, sexo, idade INTO nome_cliente, sexo_cliente, idade_cliente
        FROM cliente
        WHERE id = NEW.id_cliente;

        IF NOT EXISTS (SELECT 1 FROM clienteespecial WHERE id_cliente = NEW.id_cliente) THEN

            INSERT INTO clienteespecial (nome, sexo, idade, id_cliente, cashback)
            VALUES (nome_cliente, sexo_cliente, idade_cliente, NEW.id_cliente, cashback_cliente);
        ELSE

            UPDATE clienteespecial SET cashback = cashback + cashback_cliente WHERE id_cliente = NEW.id_cliente;
        END IF;
    END IF;
END$$
DELIMITER ;

/*Trigger 3 */
DELIMITER $$
CREATE TRIGGER verifica_valor_do_cashback_cliente_especial
AFTER INSERT ON venda
FOR EACH ROW
BEGIN
    DECLARE cashback_cliente DECIMAL(10, 2);

    SELECT cashback INTO cashback_cliente
    FROM clienteespecial
    WHERE id_cliente = NEW.id_cliente
    LIMIT 1;

    IF cashback_cliente <= 0.0 THEN
        DELETE FROM clienteespecial
        WHERE id_cliente = NEW.id_cliente;
    END IF;
END$$

DELIMITER ;
