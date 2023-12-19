IF NOT EXISTS (
    SELECT name
    FROM sys.databases
    WHERE name = N'Aula09'
)

-- RESTRIÇÕES -- 
-- NULL
-- NOT NULL
-- DEFAULT
-- CHECK
-- UNIQUE 
-- PRIMARY KEY
-- FOREIGN KEY
-- '' -- '' -- 

CREATE TABLE TESTE (
    ID INT NOT NULL,
    Nome CHAR(10)
)
GO


EXEC sp_columns TESTE 
GO

-- Altera o tipo de dados da coluna Nome.
-- Neste caso, aumenta o tamanho do campo.
ALTER TABLE TESTE 
    ALTER COLUMN Nome CHAR (50)
GO

-- Adiciona a coluna Sexo na Tabela
ALTER TABLE TESTE 
    ADD Sexo CHAR(1) NULL
GO

-- Adiciona a coluna Data_Nasc e Peso na Tabela
ALTER TABLE TESTE 
    ADD Data_Nasc DATE,
        Peso DECIMAL(5,2)
GO

-- Remove a coluna Data_Nasc
ALTER TABLE TESTE 
    DROP COLUMN Data_Nasc
GO

-- Adiciona uma restrição do tipo única, na coluna Sexo.
ALTER TABLE TESTE 
    ADD UNIQUE (Sexo)
GO

-- Adiciona uma restrição nomeada, do tipo chave primária na coluna ID.
ALTER TABLE TESTE 
    ADD CONSTRAINT pk_id PRIMARY KEY (ID)
GO

-- Exibe informações sobre as restrições que existem na tabela.
EXEC sp_helpconstraint TESTE
GO

-- Removendo uma restrição nomeada.
ALTER TABLE TESTE
    DROP CONSTRAINT pk_id
GO

-- Outra forma de se exibir informações sobre as colunas da tabela.
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TESTE'
GO

-- Outra forma de se exibir informações especificas da tabela.
SELECT TABLE_CATALOG AS 'Banco de Dados',
       TABLE_NAME AS 'Tabela',
       ORDINAL_POSITION AS 'Posição',
       COLUMN_NAME AS 'Coluna',
       DATA_TYPE AS 'Tipo de Dados',
       COLLATION_NAME AS 'Idioma da Coluna',
       IS_NULLABLE AS 'Aceita Nulo?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'TESTE'
GO     


EXEC sp_help 'TESTE'
GO
