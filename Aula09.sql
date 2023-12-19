-- Cria o banco de dados --
CREATE DATABASE Aula09
GO

-- M
IF NOT EXISTS (
    SELECT name
    FROM sys.databases
    WHERE name = N'Aula09'
)
CREATE DATABASE Aula09
GO 

-- Conecta ao banco de dados --
USE Aula09
GO

-- Apaga o banco de dados --
DROP DATABASE Aula09
GO

-- Criar Tabela --
CREATE TABLE FUNCIONARIOS (
    ID INT PRIMARY KEY,
    Nome VARCHAR(25),
    Sexo CHAR(1),
    Admissao DATE,
    Salario DECIMAL(10,2)
)
GO

-- Exibe o nome dos bancos de dados que existem no servidor --
SELECT name 
FROM sys.databases
GO

-- Altera o formato de data do SQL Server -- 
SET DATEFORMAT DMY
GO

-- Inserir valores na Tabela --
INSERT INTO FUNCIONARIOS (
    ID, 
    Nome,
    Sexo,
    Admissao,
    Salario
)
VALUES(
    1,
    'Lucas',
    'M',
    '22-08-2023',
    4000.00
)
GO

-- Inseri valores na Tabela: --
-- Colunas em ordem, não precisa escrever -- 
INSERT INTO FUNCIONARIOS VALUES (
    2,
    'Maria Gabriela',
    'F',
    '22-03-2002',
    5000.00
)
GO

-- Inserir mais de um registro na tabela de uma vez --
INSERT INTO FUNCIONARIOS VALUES (
    3,
    'Cristiane',
    'F',
    '20-03-2002',
    2000.00
)
INSERT INTO FUNCIONARIOS VALUES (
    4,
    'Emerson',
    'M',
    '10-02-2002',
    1000.00
)
GO
-- OU TUDO EM UMA LINHA --
INSERT INTO FUNCIONARIOS VALUES
    (5, 'Gabrielle', 'F', '03-01-2006', 4200.70),
    (6, 'Matheus', 'M', '10-02-2003', 1140.00),
    (7, 'Gabriel', 'M', '25-12-1999', 1001.11),
    (8, 'Max', 'M', '10-12-2001', 9999.99)
GO

-- SELECT == Seleciona valores da tabela para exibir na saida --
-- SELECT * == Exibe tudo da tabela  --
SELECT * FROM FUNCIONARIOS 
GO


-- Filtro de registo WHERE --
--  =	Igual --
--  >	Maior que --
--  <	Menor que --
--  >=	Maior ou igual --
--  <= 	Menor ou igual --
--  <> ou !=  Diferente de --
-- IN  Incluindo (múltiplos valores) --
-- NOT IN	Excluindo (múltiplos valores) --
-- BETWEEN	Entre dois valores --
-- LIKE	Busca um padrão parecido --
-- IS NULL	Traz todos os valores nulos --
-- IS NOT NULL	Traz todos os valores que não são nulos --

-- OPERADORES LOGICOS --
-- AND --
-- OR --
-- NOT --

-- Exibe todos os dados da tabela onde o Sexo for igual à M --
SELECT * 
FROM FUNCIONARIOS 
WHERE Sexo='M'
GO

-- Exibe todos os dados da tabela onde o Sexo é diferente de M e o Salario maior que 1000
SELECT * 
FROM FUNCIONARIOS
WHERE Sexo != 'M' AND Salario > 1000 
GO

-- Exibe todos os dados da tabela onde o sexo não é igual a M
SELECT * 
FROM FUNCIONARIOS
WHERE NOT Sexo = 'M' AND Salario > 1000 
GO

-- Exibe todos os dados da tabela cujo salario esteja entre 1000 e 2000(inclusive)
SELECT * FROM FUNCIONARIOS
WHERE Salario >= 1000 AND Salario <= 2000
GO

SELECT * FROM FUNCIONARIOS
WHERE Salario BETWEEN 1000 AND 2000
GO

-- Exibe apenas os 3 primeiros valores da tabela --
SELECT TOP 3 * FROM FUNCIONARIOS
GO 

SELECT TOP 3 
    ID AS 'Cod_Func', 
    Nome 
FROM FUNCIONARIOS
GO 



-- Altera o nome da Coluna APENAS na saida --
-- AS == Alias == Apelidos --
SELECT ID AS 'Cod_Func',
    Nome
FROM FUNCIONARIOS
GO

-- EXISTS --
-- Verifica se existe algum funcionário --
-- cujo o valor do salário seja maior do que 1000 reais --
-- e exibe uma mensagem personalizada --

IF EXISTS (SELECT * FROM FUNCIONARIOS
           WHERE Salario > 1000)
    PRINT 'Alguém ganha mais que 1000 reais'
ELSE 
    PRINT 'Não localizamos ninguém que ganhe mais de 1000 reais'
GO

-- LIKE --  
-- Seleciona todos os valores cujo o nome começa com a letra M --
SELECT * FROM FUNCIONARIOS
WHERE Nome LIKE 'M%'
GO

-- Seleciona todos os funcionarios cujo o nome contenha 'Silva'
-- Utiliza a função UPPER(), para converter o nome para maiúsculas.
SELECT * FROM FUNCIONARIOS
WHERE UPPER(Nome) LIKE '%SILVA%'
GO

-- IN --
-- Adiciona valores em uma lista --

-- Seleciona todos os funcionarios cujo ID seja 1, 2 ou 5.
-- Utilizando OR.
SELECT * FROM FUNCIONARIOS
WHERE 
    ID = 1 OR
    ID = 2 OR 
    ID = 5 
GO

-- Utilizando IN --
SELECT * FROM FUNCIONARIOS
WHERE ID IN (1,2,5)
GO

SELECT * FROM FUNCIONARIOS 
WHERE Salario IN
	(SELECT Salario
	 FROM FUNCIONARIOS
	 WHERE Salario < 1000.00)
	 
-- Utilizando EXISTS --	 
IF EXISTS (SELECT Nome
	FROM FUNCIONARIOS
	WHERE Nome LIKE '%PEREIRA%')
PRINT 'Alguem se chama Pereira'


-- ORDER BY --
-- Seleciona todos os funcionarios, ordenando o resultado em ordem alfabetica(A-Z)
SELECT * FROM FUNCIONARIOS
ORDER BY Nome
GO
-- OU --
-- SELECT * FROM FUNCIONARIOS -- 
-- ORDER BY Nome ASC --
-- GO --


-- Seleciona todos os funcionarios, ordenando o resultado em ordem alfabetica(Z-A)
SELECT * FROM FUNCIONARIOS
ORDER BY Nome DESC
GO

INSERT INTO FUNCIONARIOS VALUES 
    (9, 'Maria Aparecida', 'F', '21/01/1940', 2.000),
    (10, 'Maria Aparecida', 'F', '21/01/1947', 1.431)
GO

UPDATE FUNCIONARIOS SET Salario = 1432.00 WHERE ID=10
GO

SELECT * FROM FUNCIONARIOS WHERE Salario < 10000 ORDER BY Nome, Salario DESC
GO


-- Alterando a estrutura com ALTER TABLE 
-- Adiciona o campo telefone, na tabela FUNCIONARIOS
ALTER TABLE FUNCIONARIOS
ADD Telefone CHAR(10)
GO

SELECT * FROM FUNCIONARIOS

SELECT TABLE_CATALOG AS 'Banco de Dados',
       TABLE_NAME AS 'Tabela',
       ORDINAL_POSITION AS 'Posição',
       COLUMN_NAME AS 'Coluna',
       DATA_TYPE AS 'Tipo de Dados',
       COLLATION_NAME AS 'Idioma da Coluna',
       IS_NULLABLE AS 'Aceita Nulo?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'FUNCIONARIOS'
GO     

-- Atualização de dados com UPDATE
UPDATE FUNCIONARIOS
    SET Telefone = NULL
GO

UPDATE FUNCIONARIOS
    SET Telefone = '3660-0101'
    WHERE ID = 1
GO

UPDATE FUNCIONARIOS SET Telefone = '3660-0202' WHERE ID = 2
UPDATE FUNCIONARIOS SET Telefone = '3660-0404' WHERE ID = 4
UPDATE FUNCIONARIOS SET Telefone = '3660-0505' WHERE ID = 5
UPDATE FUNCIONARIOS SET Telefone = '3660-0707' WHERE ID = 7
UPDATE FUNCIONARIOS SET Telefone = '3660-0909' WHERE ID = 9
UPDATE FUNCIONARIOS SET Telefone = '3660-1010' WHERE ID = 10
GO


UPDATE FUNCIONARIOS 
    SET Salario = Salario * 1.10
    WHERE YEAR(Admissao) < 2016
GO

SELECT  COUNT(*) AS 'Total de Funcionarios',
        SUM(Salario) AS 'Gasto Salarial',
        AVG(Salario) AS 'Salário Médio',
        MAX(Salario) AS 'Maior Salário',
        MIN(Salario) AS 'Menor Salário',
        STDEV(Salario) AS 'Desvio Padrão',
        VAR(Salario) AS 'Variância'
FROM FUNCIONARIOS
GO

SELECT Sexo AS 'Sexo',
        COUNT(Sexo) AS 'Total de Funcionarios'
FROM FUNCIONARIOS
GO

SELECT Sexo AS 'Sexo',
        COUNT(Sexo) AS 'Total de Funcionarios'
FROM FUNCIONARIOS
GROUP BY Sexo
GO

SELECT YEAR(Admissao) AS 'Ano de Admissão',
        COUNT(*) AS 'Total de Funcionarios'
FROM FUNCIONARIOS
GROUP BY YEAR(Admissao)
GO


-- Clausula HAVING --
SELECT SUBSTRING(Nome, 1, 1) AS 'Inicial',
        COUNT(Nome) AS 'Quantidade de Funcionários',
        SUM(Salario) AS 'Gasto Salarial'
FROM FUNCIONARIOS
-- WHERE SUM(Salario) > 2000 ERRO!!!
-- HAVING SUM(Salario) > 2000 ERRO!!!
GROUP BY SUBSTRING(Nome, 1, 1)
HAVING SUM(Salario) > 2000
GO




SELECT ID, 
        Nome,
        Salario AS 'Salário'
FROM FUNCIONARIOS
ORDER BY Salario DESC
GO

-- Selecione todos os funcionarios, ordenando de acordo com o maior salario
-- Utiliza ROW_NUMBER, RANK, DENSE_RANK e NITLE para classificar o resultado.

SELECT ID, 
        Nome,
        Salario AS 'Salário',
        ROW_NUMBER() OVER (ORDER BY Salario DESC) AS 'ROW NUMBER',
        RANK() OVER (ORDER BY Salario DESC) AS 'RANK',
        DENSE_RANK() OVER (ORDER BY Salario DESC) AS 'DENSE RANK',
        NTILE(3) OVER (ORDER BY Salario) AS 'NITLE'
FROM FUNCIONARIOS
ORDER BY Salario DESC
GO

-- Selecione todos os funcionarios, ordenando de acordo com o maior salario
-- Particiona o resultado de acordo com o sexo de cada funcionario
SELECT ID, 
        Nome,
        Sexo,
        Salario AS 'Salário',
        ROW_NUMBER() OVER (PARTITION BY Sexo ORDER BY Salario DESC) AS 'ROW NUMBER',
        RANK() OVER (PARTITION BY Sexo ORDER BY Salario DESC) AS 'RANK',
        DENSE_RANK() OVER (PARTITION BY Sexo ORDER BY Salario DESC) AS 'DENSE RANK',
        NTILE(3) OVER (PARTITION BY Sexo ORDER BY Salario) AS 'NITLE'
FROM FUNCIONARIOS
GO

CREATE VIEW Maiores_Salarios AS 
    SELECT ID,
            Nome,
            Salario AS 'Salario'
    FROM FUNCIONARIOS
GO

SELECT * FROM Maiores_Salarios

SELECT Nome, Salario FROM Maiores_Salarios

