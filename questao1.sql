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