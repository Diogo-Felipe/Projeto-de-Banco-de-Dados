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

-- 4 Questão

INSERT INTO nivel (descricao) VALUES ('Alimentos Energéticos');
INSERT INTO nivel (descricao) VALUES ('Alimentos Reguladores');
INSERT INTO nivel (descricao) VALUES ('Alimentos Construtores');
INSERT INTO nivel (descricao) VALUES ('Alimentos Energéticos Extra');

INSERT INTO grupoalimentar (descricao, complemento, nivel)
VALUES ('Carboidratos', 'Alimentos que fornecem energia, pois ao serem comsumidos...', 1);
INSERT INTO grupoalimentar (descricao, complemento, nivel)
VALUES ('Verduras e Legumes','Fonte de fibras, vitaminas e minerais', 2);
INSERT INTO grupoalimentar (descricao, complemento, nivel)
VALUES ('Futas', 'Fontes de fobras, vitaminas e minerais, aumenta o nível...', 2);
INSERT INTO grupoalimentar (descricao, complemento, nivel)
VALUES ('Leites e Derivados', 'Fonte de proteínas e de cálcio, que é essencial...', 3);
INSERT INTO grupoalimentar (descricao, complemento, nivel)
VALUES ('Canes e Ovos', 'Fonte de proteína de origem animal, são ricos em ferro...', 3);
INSERT INTO grupoalimentar (descricao, complemento, nivel)
VALUES ('Leguminosas e Olegiminosas', 'Fonte de protína vegeral. Também...', 3);
INSERT INTO grupoalimentar (descricao, complemento, nivel)
VALUES ('Óleos e Gorduras', 'Fonte de energia e são responsáveis...', 4);
INSERT INTO grupoalimentar (descricao, complemento, nivel)
VALUES ('Açucares e doces', 'São alimentos ricos em carboidratos...', 4);

INSERT INTO receita (
    nome,
    instrucoes
) VALUES (
    'Bolo de Chocolate',
    'Bata no liquidificador os ovos, o açúcar, o achocolatado, o óleo e a água; Coloque a mistura em um...'
);

INSERT INTO ingredientes (nome, unidade, grupo) VALUES ('OVO', 'un', 4);
INSERT INTO ingredientes (nome, unidade, grupo) VALUES ('TRIGO', 'g', 1);
INSERT INTO ingredientes (nome, unidade, grupo) VALUES ('AÇUCAR', 'g', 8);
INSERT INTO ingredientes (nome, unidade, grupo) VALUES ('ACHOCOLATADO', 'g', 8);
INSERT INTO ingredientes (nome, unidade, grupo) VALUES ('OLEO', 'ml', 7);
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