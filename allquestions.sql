/*/////////*/
/*Questão 1*/
/*/////////*/

CREATE TABLE Banco (
    Codigo INT NOT NULL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Cliente (
    Cpf VARCHAR(255) NOT NULL PRIMARY KEY,
    Nome VARCHAR(255),
    Sexo VARCHAR(255),
    Endereco VARCHAR(255)
);

CREATE TABLE Agencia (
    Numero_agencia VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255),
    Cod_banco INT,
    CONSTRAINT fk_banco FOREIGN KEY (Cod_banco) REFERENCES Banco(Codigo),
    CONSTRAINT PK_Agencia PRIMARY KEY (Cod_banco,Numero_agencia)
);

CREATE TABLE Conta (
    Numero_conta VARCHAR(255) NOT NULL PRIMARY KEY,
    Saldo FLOAT,
    Tipo_conta VARCHAR(255),
    Num_agencia INT,
    CONSTRAINT fk_agencia FOREIGN KEY (Num_agencia) REFERENCES Agencia(Numero_agencia)
);

CREATE TABLE Historico (
    Cpf_cliente VARCHAR(255),
    Num_conta VARCHAR(255),
    Data_inicio DATE,
    CONSTRAINT fk_cpf FOREIGN KEY (Cpf_cliente) REFERENCES Cliente(Cpf),
    CONSTRAINT fk_conta FOREIGN KEY (Num_conta) REFERENCES Conta(Numero_conta),
    CONSTRAINT PK_Historico PRIMARY KEY (Cpf_cliente,Num_conta)
);

CREATE TABLE Telefone_cliente (
    Cpf_cli VARCHAR(255),
    Telefone VARCHAR(255),
    CONSTRAINT fk_cpf FOREIGN KEY (Cpf_cli) REFERENCES Cliente(Cpf),
    CONSTRAINT PK_Telefone PRIMARY KEY (Cpf_cli,Telefone)
);


/*/////////*/
/*Questão 2*/
/*/////////*/

INSERT INTO Banco
VALUES (1, 'Banco do Brasil');

INSERT INTO Banco
VALUES (4, 'CEF');

INSERT INTO Cliente
VALUES ('111.222.333-44', 'Jennifer B Souza', 'F', 'Rua Cuiabá, 1050');

INSERT INTO Cliente
VALUES ('666.777.888-99', 'Caetano K Lima', 'M', 'Rua Ivinhema, 879');

INSERT INTO Cliente
VALUES ('555.444.777-33', 'Silvia Macedo', 'F', 'Rua Estados Unidos, 735');

INSERT INTO Agencia
VALUES ('0562', 'Rua Joaquim Teixeira Alves, 1555', '4');

INSERT INTO Agencia
VALUES ('3153', 'Av. Marcelino Pires, 1960', '1');

INSERT INTO Conta
VALUES ('86340-2', '763.05', '2', '3153');

INSERT INTO Conta
VALUES ('23584-7', '3879.12', '1', '0562');

INSERT INTO Historico
VALUES ('111.222.333-44', '23584-7', '17-12-1997');

INSERT INTO Historico
VALUES ('666.777.888-99', '23584-7', '17-12-1997');

INSERT INTO Historico
VALUES ('555.444.777-33', '86340-2', '29-11-2010');

INSERT INTO Telefone_cliente
VALUES ('111.222.333-44', '(67)3422-7788');

INSERT INTO Telefone_cliente
VALUES ('666.777.888-99', '(67)3423-9900');

INSERT INTO Telefone_cliente
VALUES ('666.777.888-99', '(67)8121-8833');


/*/////////*/
/*Questão 3*/
/*/////////*/

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


/*/////////*/
/*Questão 4*/
/*/////////*/

CREATE TABLE Regiao (
    id_regiao INT NOT NULL PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE Vinicula (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(255),
    pais VARCHAR(255),
    id_regiao VARCHAR(255),
    CONSTRAINT fk_regiao FOREIGN KEY (id_regiao) REFERENCES Regiao(id_regiao)
);

CREATE TABLE Tipo (
    id INT NOT NULL PRIMARY KEY,
    tipo VARCHAR(255)
);

CREATE TABLE Vinho (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(255),
    ano DATE,
    valor FLOAT,
    id_vinicula INT,
    id_tipo INT,
    CONSTRAINT fk_vinicula FOREIGN KEY (id_vinicula) REFERENCES Vinicula(id),
    CONSTRAINT fk_tipo FOREIGN KEY (id_tipo) REFERENCES Tipo(id)
);

CREATE TABLE Cliente (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(255)
);

CREATE TABLE Reserva (
    id INT NOT NULL PRIMARY KEY,
    qtd int,
    data_reserva date,
    id_cliente INT,
    id_vinho INT,
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id),
    CONSTRAINT fk_vinho FOREIGN KEY (id_vinho) REFERENCES Vinho(id)
);



SELECT Cliente.id, Cliente.nome, Vinho.id, Vinho.nome
FROM Reserva
JOIN Cliente
ON Reserva.id_cliente = Cliente.id
JOIN Vinho
ON Reserva.id_vinho = Vinho.id;



SELECT *
FROM Reserva
WHERE data_reserva<'20190121'



SELECT DISTINCT Cliente.nome
FROM Cliente
LEFT JOIN Reserva
ON Cliente.id = Reserva.id_cliente
WHERE Reserva.id=Null;



SELECT *
FROM Reserva
WHERE data_reserva BETWEEN '20181001' AND '20181101'



CREATE VIEW view_vinhos AS
SELECT DISTINCT Vinho.nome, Vinho.ano, Vinicula.nome
FROM Vinho
JOIN Vinicula
ON Vinho.id_vinicula = Vinicula.id