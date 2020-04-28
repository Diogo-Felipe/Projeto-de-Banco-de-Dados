-- 3 Questão

CREATE SEQUENCE seqReceita;
CREATE SEQUENCE seqIngredientes;
CREATE SEQUENCE seqComposicao;
CREATE SEQUENCE seqGrupos;
CREATE SEQUENCE seqNivel;

CREATE TABLE receita (
    idreceita int DEFAULT(nextval('seqReceita')),
    nome varchar(50),
    instrucoes varchar(1000),
    CONSTRAINT pk_receita PRIMARY KEY (idreceita)
);

CREATE TABLE ingredientes (
    idingredientes int DEFAULT(nextval('seqIngredientes')),
    nome varchar(100),
    unidade varchar(10),
    grupo int,
    CONSTRAINT pk_ingredientes PRIMARY KEY (idingredientes),
    CONSTRAINT fk_grupo FOREIGN KEY (grupo) REFERENCES grupoalimentar (grupo)
);

CREATE TABLE grupoalimentar(
    grupo int DEFAULT(nextval('seqGrupos')),
    descricao varchar(100),
    complemento varchar(100),
    nivel int,
    CONSTRAINT pk_grupoalimentar PRIMARY KEY (grupo),
    CONSTRAINT fk_nivel FOREIGN KEY (nivel) REFERENCES nivel (nivel)
);

CREATE TABLE nivel(
    nivel int DEFAULT(nextval('seqNivel')),
    descricao varchar(100)
    CONSTRAINT pk_nivel PRIMARY KEY (nivel),
);

CREATE TABLE composicao (
    idComposicao int DEFAULT(nextval('seqComposicao')),
    qtd NUMERIC(5,2),
    idreceita int,
    idingredientes int,
    CONSTRAINT fk_receita FOREIGN KEY (idreceita) REFERENCES receita (idreceita),
    CONSTRAINT fk_ingredientes FOREIGN KEY (idingredientes) REFERENCES ingredientes (idingredientes)
);