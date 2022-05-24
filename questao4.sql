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