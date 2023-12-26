-- Criação de Tabela --

CREATE TABLE clientes(
  id_cliente SERIAL PRIMARY key,
  nome_cliente VARCHAR (48),
  CPF VARCHAR (14) NOT NULL,
  data_cadastro DATE
  )
 
 -- Inserindo dados a tabela Clientes--
INSERT INTO clientes (nome_cliente, cpf, data_cadastro) VALUES
('Estevão Santos', '123.456.789-00', '2022-08-19'),
('Helena Santos', '123.123.123-99', '2022-08-19'),
('João Souza', '456.123.789-88', '2022-08-18'),
('Maria do Rosario', '123.123.456-66', '2022-08-19')


--Criando função--
CREATE OR REPLACE FUNCTION calcula_quantida_clientes()
RETURNS TABLE (data_cadastro DATE, resultado BIGINT) 
LANGUAGE plpgsql
AS $$
 
BEGIN
RETURN QUERY
  SELECT q.data_cadastro, COUNT(*) AS resultado
  FROM clientes AS q
  GROUP BY q.data_cadastro;
  
END $$;


SELECT * FROM calcula_quantida_clientes();