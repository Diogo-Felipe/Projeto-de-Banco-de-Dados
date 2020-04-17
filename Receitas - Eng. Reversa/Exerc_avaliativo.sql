-- 3 Questão

CREATE SEQUENCE seqReceita;
CREATE SEQUENCE seqIngredientes;

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
    CONSTRAINT pk_ingredientes PRIMARY KEY (idingredientes)
);

CREATE TABLE composicao (
    qtd NUMERIC(5,2),
    idreceita int,
    idingredientes int,
    CONSTRAINT fk_receita FOREIGN KEY (idreceita) REFERENCES receita (idreceita),
    CONSTRAINT fk_ingredientes FOREIGN KEY (idingredientes) REFERENCES ingredientes (idingredientes)
);

-- 4 Questão

INSERT INTO receita (
    nome,
    instrucoes
) VALUES (
    'Bolo de Chocolate',
    'Bata no liquidificador os ovos, o açúcar, o achocolatado, o óleo e a água; Coloque a mistura em um...'
);

INSERT INTO ingredientes (nome, unidade) VALUES ('OVO', 'un');
INSERT INTO ingredientes (nome, unidade) VALUES ('TRIGO', 'g');
INSERT INTO ingredientes (nome, unidade) VALUES ('AÇUCAR', 'g');
INSERT INTO ingredientes (nome, unidade) VALUES ('ACHOCOLATADO', 'g');
INSERT INTO ingredientes (nome, unidade) VALUES ('OLEO', 'ml');
INSERT INTO ingredientes (nome, unidade) VALUES ('AGUA', 'ml');
INSERT INTO ingredientes (nome, unidade) VALUES ('FERMENTO', 'g');

INSERT INTO composicao (qtd, idreceita, idingredientes) VALUES (3.00, 1, 1);
INSERT INTO composicao (qtd, idreceita, idingredientes) VALUES (250.00, 1, 2);
INSERT INTO composicao (qtd, idreceita, idingredientes) VALUES (200.00, 1, 3);
INSERT INTO composicao (qtd, idreceita, idingredientes) VALUES (90.00, 1, 4);
INSERT INTO composicao (qtd, idreceita, idingredientes) VALUES (180.00, 1, 5);
INSERT INTO composicao (qtd, idreceita, idingredientes) VALUES (240.00, 1, 6);
INSERT INTO composicao (qtd, idreceita, idingredientes) VALUES (10.00, 1, 7);

-- 5 Questão

ALTER TABLE ingredientes ADD valor NUMERIC(5,2);


