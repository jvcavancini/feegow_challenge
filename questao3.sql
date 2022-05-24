ALTER TABLE Cliente
ADD Email varchar(255);

ALTER TABLE Cliente
DROP COLUMN Email;

UPDATE Cliente
SET Cpf = '222.444.777-33'
WHERE Nome = 'Silvia Macedo';

DELETE FROM Conta
WHERE Numero_conta = '86340-2';

SELECT Cpf, Endereco
FROM Cliente
WHERE Nome = 'Caetano K Lima';

SELECT Historico.Num_conta, Conta.Num_agencia, Cliente.nome
FROM Historico
JOIN Conta
ON Historico.Num_conta = Conta.Numero_conta
JOIN Cliente
ON Historico.Cpf_cliente = Cliente.Cpf;

SELECT *
FROM Cliente
WHERE Sexo='M';

SELECT count(*) as 'Num_clientes'
FROM Cliente;