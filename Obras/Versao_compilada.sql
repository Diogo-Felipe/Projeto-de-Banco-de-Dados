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
    CONSTRAINT fk_obra FOREIGN KEY (idobra) REFERENCES Obra (idobra),
    CONSTRAINT fk_profissional FOREIGN KEY (idpessoa) REFERENCES Profissional (idpessoa),
    CONSTRAINT fk_profissao FOREIGN KEY (idprof) REFERENCES Profissao (idprof),
    CONSTRAINT ck_datas CHECK (datainicio < datafim),
    CONSTRAINT uk_unique UNIQUE (datainicio, idobra, idpessoa, idprof)
);

INSERT INTO Obra ( descricao ) VALUES ( 'Edifício Torre Eiffel' );

INSERT INTO Profissao ( nome ) VALUES ( 'Engenheiro Civíl' );
INSERT INTO Profissao ( nome ) VALUES ( 'Arquiteto' );
INSERT INTO Profissao ( nome ) VALUES ( 'Mestre de Obra' );

INSERT INTO Profissional ( nome ) VALUES ( 'Fátima Araújo Oliveira' );
INSERT INTO Profissional ( nome ) VALUES ( 'Waldir Castelo Quaresma' );
INSERT INTO Profissional ( nome ) VALUES ( 'Maria do Rosário Fernandes' );
INSERT INTO Profissional ( nome ) VALUES ( 'Sandra Regina Quadros' );
INSERT INTO Profissional ( nome ) VALUES ( 'Archimino Lara Rezende' );
INSERT INTO Profissional ( nome ) VALUES ( 'Agenor Navarro Aguiar' );
INSERT INTO Profissional ( nome ) VALUES ( 'Agripino Furtado das Neves' );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('20/02/2019', NULL, 1, 1, 1 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('20/02/2019', NULL, 1, 2, 1 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('20/02/2019', NULL, 1, 3, 1 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('20/02/2019', '15/01/2020', 1, 4, 2 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('20/02/2019', '15/01/2020', 1, 5, 2 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('01/12/2019', NULL, 1, 6, 3 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('20/02/2019', '30/11/2019', 1, 7, 3 );

INSERT INTO Obra ( descricao ) VALUES ( 'Pavimentação Rodovia PA-140' );

INSERT INTO Profissao ( nome ) VALUES ( 'Agrimessor' );

INSERT INTO Profissional ( nome ) VALUES ( 'João Pimenta de Oliveira' );
INSERT INTO Profissional ( nome ) VALUES ( 'Adamastor Capstrano' );
INSERT INTO Profissional ( nome ) VALUES ( 'Rafael Cabeça de Castro' );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('15/01/2017', NULL, 2, 8, 1 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('15/01/2017', NULL, 2, 9, 1 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('15/01/2017', '30/11/2018', 2, 10, 4 );

INSERT INTO Obra ( descricao ) VALUES ( 'Praça Antônio Carlos' );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('13/05/2012', '26/09/2013', 3, 4, 2 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('13/05/2012', '26/09/2013', 3, 5, 2 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('13/05/2012', '26/09/2013', 3, 8, 1 );

SELECT DISTINCT Profissional.nome, Profissao.nome 
FROM ((Trabalha 
    INNER JOIN Profissional ON Trabalha.idpessoa = Profissional.idpessoa)
    INNER JOIN Profissao ON Trabalha.idprof = Profissao.idprof)
ORDER BY Profissional.nome;

SELECT Obra.descricao, Profissional.nome, Profissao.nome, Trabalha.datainicio, Trabalha.datafim
FROM Obra
    INNER JOIN Trabalha ON Obra.idobra = Trabalha.idobra
    INNER JOIN Profissional ON Trabalha.idpessoa = Profissional.idpessoa
    INNER JOIN Profissao ON Trabalha.idprof = Profissao.idprof;

SELECT Profissao.nome, COUNT(Profissao.nome) 
from Profissao
    INNER JOIN Trabalha ON Profissao.idprof = Trabalha.idprof
GROUP BY (Profissao.nome);

SELECT nome FROM Profissional 
    INNER JOIN Trabalha ON Profissional.idpessoa = Trabalha.idpessoa
    INNER JOIN Obra ON Trabalha.idobra = Obra.idobra
WHERE Obra.descricao LIKE '%Eiffel%'
AND Trabalha.datafim = NULL;

-- Subqueries

SELECT idobra, descricao, 
    (
        SELECT count(*)
        FROM Profissional p
            INNER JOIN Trabalha t ON p.idpessoa = t.idpessoa
            INNER JOIN obra o ON t.idobra = o.idobra
            INNER JOIN Profissao pr ON t.idprof = pr.idprof
        WHERE UPPER ( pr,nome ) LIKE '%ARQ%'
            AND o.idobra = op.idobra
        GROUP BY o.idobra
    ) Arquitetos
FROM obra op;

SELECT idobra, descricao,
    (
        SELECT count(*)
        FROM Profissional p
            INNER JOIN Trabalha t ON p.idpessoa = t.idpessoa
            INNER JOIN obra o ON t.idobra = o.idobra
            INNER JOIN Profissao pr ON t.idprof = pr.idprof
        WHERE UPPER ( pr,nome ) LIKE '%ARQ%'
            AND o.idobra = op.idobra
        GROUP BY o.idobra
    ) / (
        SELECT count(*)
        FROM Profissional p
            INNER JOIN Trabalha t ON p.idpessoa = t.idpessoa
            INNER JOIN obra o ON t.idobra = o.idobra
            INNER JOIN Profissao pr ON t.idprof = pr.idprof
        WHERE o.idobra = op.idobra
        GROUP BY o.idobra
    ) * 100 "Percentual de arquitetos"
FROM obra op;