-- 
-- Esquema Geração BD de Obras
-- Ver. 1.0 em 15/02/2020
-- Autor: Diogo L.C. Felipe
--

CREATE SEQUENCE seqobra;
CREATE SEQUENCE seqprofissional;
CREATE SEQUENCE seqprofissao;
create sequence seqtrabalha;

CREATE TABLE Obra(
    idobra int DEFAULT(nextval('seqobra')),
    descricao varchar(100) NOT NULL,
    CONSTRAINT pk_obra PRIMARY KEY (idobra),
    CONSTRAINT ck_descricao_obra CHECK (length(descricao) > 10) 
);

CREATE TABLE Profissional(
    idpessoa int DEFAULT(nextval('seqprofissional')),
    nome varchar(50) NOT NULL,
    CONSTRAINT pk_profissional PRIMARY KEY (idpessoa),
    CONSTRAINT ck_nome_profissional CHECK (length(nome) > 5)
);

CREATE TABLE Profissao(
    idprof int DEFAULT(nextval('seqprofissao')),
    nome varchar(50) NOT NULL,
    CONSTRAINT pk_profissao PRIMARY KEY (idprof),
    CONSTRAINT ck_nome_profissao CHECK (length(nome) > 5)
);

CREATE TABLE Trabalha(
    idtrabalha int DEFAULT(nextval('seqtrabalha')),
    datainicio date NOT NULL,
    datafim date,
    idobra int,
    idpessoa int,
    idprof int,
    CONSTRAINT pk_trabalha PRIMARY KEY (idtrabalha),
    CONSTRAINT fk_obra FOREIGN KEY (idobra) REFERENCES Obras (idobra),
    CONSTRAINT fk_profissional FOREIGN KEY (idpessoa) REFERENCES Profissional (idpessoa),
    CONSTRAINT fk_profissao FOREIGN KEY (idprof) REFERENCES Profissao (idprof),
    CONSTRAINT ck_datas CHECK (datainicio < datafim)
);
