CREATE SEQUENCE seqMatricula;
CREATE SEQUENCE seqItemMatricula;
CREATE SEQUENCE seqModalidade;

CREATE TABLE Academia (
    cnpj varchar(14),
    nome varchar(100),
    CONSTRAINT pk_academia PRIMARY KEY (cnpj),
    CONSTRAINT ck_academia_nome CHECK (length(nome) >= 10)
);

CREATE TABLE Aluno (
    matricula int,
    cnpj varchar(14),
    nome varchar(50),
    CONSTRAINT pk_aluno PRIMARY KEY (matricula),
    CONSTRAINT fk_academia FOREIGN KEY (cnpj) REFERENCES Academia (cnpj),
    CONSTRAINT ck_aluno_nome CHECK (length(nome) >= 10),
    CONSTRAINT uk_matricula UNIQUE (cnpj,matricula)
);

CREATE TABLE Matricula (
    idMatricula int DEFAULT(nextval('seqMatricula')),
    matricula int,
    situacao char,
    dataMatricula date,
    CONSTRAINT pk_matricula PRIMARY KEY (idMatricula),
    CONSTRAINT fk_aluno FOREIGN KEY (matricula) REFERENCES Aluno (matricula),
    CONSTRAINT ck_situacao CHECK (situacao = 'A' OR situacao = 'I')
);

CREATE TABLE Modalidade (
    idModalidade int DEFAULT(nextval('seqModalidade')),
    qtdVagas int,
    descricao varchar(100),
    CONSTRAINT pk_modalidade PRIMARY KEY (idModalidade),
    CONSTRAINT ck_modadlidade_descricao CHECK (length(descricao) >= 5)
);

CREATE TABLE ItensMatricula (
    idItem int DEFAULT(nextval('seqItemMatricula')),
    precoItem float,
    idMatricula int,
    idModalidade int,
    CONSTRAINT pk_itensMatricula PRIMARY KEY (idItem),
    CONSTRAINT fk_idMatricula FOREIGN KEY (idMatricula) REFERENCES Matricula (idMatricula),
    CONSTRAINT fk_idModalidade FOREIGN KEY (idModalidade) REFERENCES Modalidade (idModalidade)
);