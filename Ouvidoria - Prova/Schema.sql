CREATE SEQUENCE seqTipoOcorrencia;
CREATE SEQUENCE seqProvidencia;
CREATE SEQUENCE seqOcorrencia;

CREATE TABLE Ouvidor(
    matricula int,
    nome varchar(100),
    CONSTRAINT pk_Ouvidor PRIMARY KEY (matricula)
);

CREATE TABLE Cliente(
    cpf varchar,
    nome varchar(100),
    CONSTRAINT pk_Cliente PRIMARY KEY (cpf)
);

CREATE TABLE TipoOcorrencia(
    idtipo int DEFAULT(nextval('seqTipoOcorrencia')),
    descricao varchar(100),
    CONSTRAINT pk_TipoOcorrencia PRIMARY KEY (idtipo)
);

CREATE TABLE Ocorrencia(
    idocorrencia int DEFAULT(nextval('seqTipoOcorrencia')),
    descocorencia varchar(100),
    situacao varchar(7) DEFAULT 'aberta',
    dataocorencia date,
    matricula int,
    cpf varchar,
    idtipo int,
    CONSTRAINT pk_Ocorrencia PRIMARY KEY (idocorrencia),
    CONSTRAINT ck_situacao CHECK (situacao = 'aberta' OR situacao = 'fechada'),
    CONSTRAINT fk_Ouvidor FOREIGN KEY (matricula) REFERENCES Ouvidor (matricula),
    CONSTRAINT fk_Cliente FOREIGN KEY (cpf) REFERENCES Cliente (cpf),
    CONSTRAINT fk_TipoOcorrencia FOREIGN KEY (idtipo) REFERENCES TipoOcorrencia (idtipo)
);

CREATE TABLE Providencia(
    idprovidencia int DEFAULT(nextval('seqTipoOcorrencia')),
    descprovidencia varchar(100),
    idocorrencia int,
    CONSTRAINT pk_Providencia PRIMARY KEY (idprovidencia),
    CONSTRAINT fk_Ocorrencia FOREIGN KEY (idocorrencia) REFERENCES Ocorrencia (idocorrencia)
);
