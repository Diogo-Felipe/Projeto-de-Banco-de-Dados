--
-- Esquema para criação do BD de Obras
-- Autor:  Almir Monteiro Junior
-- Data: 18/02/2020   Ver: 1.0
--
create sequence seq_profissional;
create sequence seq_obra;
create sequence seq_profissao;
create sequence seq_trabalha;
--
CREATE TABLE profissional (
    idpessoa int DEFAULT(nextval('seq_profissional')),
    nome     varchar(100) NOT null,
	CONSTRAINT pk_profissional PRIMARY KEY (idpessoa),
	CONSTRAINT ck_nomeprof     CHECK (length(nome) > 5)
);
--
CREATE TABLE profissao (
    idprof int DEFAULT (nextval('seq_profissao')),
    nome   varchar(100)  NOT NULL,
	CONSTRAINT pk_profissao PRIMARY KEY (idprof),
	CONSTRAINT ck_nomeprofissao CHECK (length(nome) > 5)
);
--
CREATE TABLE obra (
    idobra int DEFAULT (nextval('seq_obra')),
    descricao varchar(100) NOT NULL,
    CONSTRAINT pk_obra PRIMARY KEY (idobra),
    CONSTRAINT ck_descobra     CHECK (length(descricao) > 10)
);
--
CREATE TABLE trabalha (
	idtrabalha int DEFAULT(nextval('seq_trabalha')),
    idpessoa int,
    idobra   int,
    idprof   int,
    datainicio date,
    datafim    date,
	CONSTRAINT pk_trabalha PRIMARY KEY (idtrabalha),
	CONSTRAINT fk_prof     FOREIGN KEY (idpessoa) REFERENCES profissional,
	CONSTRAINT fk_obra     FOREIGN KEY (idobra)   REFERENCES obra,
	CONSTRAINT fk_profiss  FOREIGN KEY (idprof)   REFERENCES profissao,
	CONSTRAINT ck_datas    CHECK (datainicio < datafim)
);

--
-- Inserts de acordo com o enunciado do problema
--
INSERT INTO profissional (nome) VALUES ('Fátima Araújo Oliveira');
INSERT INTO profissional (nome) VALUES ('Waldir Castelo Quaresma');
INSERT INTO profissional (nome) VALUES ('Maria do Rosário Fernandes');
INSERT INTO profissional (nome) VALUES ('Sandra Regina Quadros');
INSERT INTO profissional (nome) VALUES ('Archimino Lara Rezende');
INSERT INTO profissional (nome) VALUES ('Agenor Navarro Aguiar');
INSERT INTO profissional (nome) VALUES ('Agripino Furtado das Neves');
INSERT INTO profissional (nome) VALUES ('João Pimenta de Oliveira');
INSERT INTO profissional (nome) VALUES ('Adamastor Capistrano');
INSERT INTO profissional (nome) VALUES ('Rafael Cabeça de Castro');
--
INSERT INTO obra (descricao) VALUES ('Ed. Torre Eiffel');
INSERT INTO obra (descricao) VALUES ('Pavimentação da rodovia PA-140');
INSERT INTO obra (descricao) VALUES ('Praça Antônio Carlos');

--
INSERT INTO profissao (nome) VALUES ('Arquiteto');
INSERT INTO profissao (nome) VALUES ('Eng. Civil');
INSERT INTO profissao (nome) VALUES ('Mestre de Obras');
INSERT INTO profissao (nome) VALUES ('Agrimessor');

--
-- Dados para: Fátima Araújo  Oliveira
--
-- Vamos descobrir o id da Fatima
SELECT * FROM profissional WHERE nome like 'Fátima%'
-- Vamos descobrir o id da obra da torre eiffel, pois ela trabalha nessa obra
SELECT * FROM obra where descricao like '%Eif%';
-- Vamos descobrir o id da profissao Eng Civil, já que ela trabalha na obra como eng.
SELECT * FROM profissao where nome like '%Civil%'
--
-- Inserir de acordo com os id's que foram encontrados.
--
INSERT INTO trabalha (idpessoa, idobra, idprof, datainicio, datafim)
VALUES (1,1,2,'2019-02-20',null)


--
-- Dados para: Waldir Castelo Quaresma 
--
-- Vamos descobrir o id do Waldir
SELECT * FROM profissional WHERE nome like 'Waldir%'
-- Vamos descobrir o id da obra da torre eiffel, pois ele tambem trabalha nessa obra
SELECT * FROM obra where descricao like '%Eif%';
-- Vamos descobrir o id da profissao Eng Civil, já que ela trabalha na obra como eng.
SELECT * FROM profissao where nome like '%Civil%'
--
-- Inserir de acordo com os id's que foram encontrados.
--
INSERT INTO trabalha (idpessoa, idobra, idprof, datainicio, datafim)
VALUES (2,1,2,'2019-02-20',null)

--
-- Dados para: Maria do Rosário Fernandes 
--
-- Vamos descobrir o id da Maria
SELECT * FROM profissional WHERE nome like 'Maria%'
-- Vamos descobrir o id da obra da torre eiffel, pois ele tambem trabalha nessa obra
SELECT * FROM obra where descricao like '%Eif%';
-- Vamos descobrir o id da profissao Eng Civil, já que ela trabalha na obra como eng.
SELECT * FROM profissao where nome like '%Civil%'
--
-- Inserir de acordo com os id's que foram encontrados.
--
INSERT INTO trabalha (idpessoa, idobra, idprof, datainicio, datafim)
VALUES (3,1,2,'2019-02-20',null)

--
-- Dados para: Sandra Regina Quadros  
--
-- Vamos descobrir o id da Sandra
SELECT * FROM profissional WHERE nome like 'Sandra%'
-- Vamos descobrir o id da obra da torre eiffel, pois ela tambem trabalha nessa obra
SELECT * FROM obra where descricao like '%Eif%';
-- Vamos descobrir o id da profissao Arquiteto, já que ela trabalhou na obra como arq.
SELECT * FROM profissao where nome like 'Arq%'
--
-- Inserir de acordo com os id's que foram encontrados.
--
INSERT INTO trabalha (idpessoa, idobra, idprof, datainicio, datafim)
VALUES (4,1,1,'2019-02-20','2020-01-15')

--
-- Dados para: Archimino Lara Rezende  
--
-- Vamos descobrir o id do Archimino
SELECT * FROM profissional WHERE nome like 'Arc%'
-- Vamos descobrir o id da obra da torre eiffel, pois ele tambem trabalha nessa obra
SELECT * FROM obra where descricao like '%Eif%';
-- Vamos descobrir o id da profissao Arquiteto, já que ele trabalhou na obra como arq.
SELECT * FROM profissao where nome like 'Arq%'
--
-- Inserir de acordo com os id's que foram encontrados.
--
INSERT INTO trabalha (idpessoa, idobra, idprof, datainicio, datafim)
VALUES (5,1,1,'2019-02-20','2020-01-15')


--
-- Dados para: Agenor Navarro Aguiar  
--
-- Vamos descobrir o id do Agenor
SELECT * FROM profissional WHERE nome like 'Age%'
-- Vamos descobrir o id da obra da torre eiffel, pois ele tambem trabalha nessa obra
SELECT * FROM obra where descricao like '%Eif%';
-- Vamos descobrir o id da profissao Mestre de obra, já que ele trabalha na obra como mestre.
SELECT * FROM profissao where nome like '%bra%'
--
-- Inserir de acordo com os id's que foram encontrados.
--
INSERT INTO trabalha (idpessoa, idobra, idprof, datainicio, datafim)
VALUES (6,1,3,'2019-01-12',null)


--
-- Dados para: Agripino Furtado das Neves  
--
-- Vamos descobrir o id do Agripinio
SELECT * FROM profissional WHERE nome like 'Agrip%'
-- Vamos descobrir o id da obra da torre eiffel, pois ele tambem trabalha nessa obra
SELECT * FROM obra where descricao like '%Eif%';
-- Vamos descobrir o id da profissao Mestre de obra, já que ele trabalhou na obra como mestre.
SELECT * FROM profissao where nome like '%bra%'
--
-- Inserir de acordo com os id's que foram encontrados.
--
INSERT INTO trabalha (idpessoa, idobra, idprof, datainicio, datafim)
VALUES (7,1,3,'2019-02-20','2019-11-30')

--
-- Dados para: João Pimenta de Oliveira   
--
-- Vamos descobrir o id do João
SELECT * FROM profissional WHERE nome like 'João%'
-- Vamos descobrir o id da obra da rodovia PA-140, pois ele trabalha nessa obra
SELECT * FROM obra where descricao like '%PA%';
-- Vamos descobrir o id da profissao Engenheiro civil, já que ele trabalhou na obra como mestre.
SELECT * FROM profissao where nome like '%Civ%'
--
-- Inserir de acordo com os id's que foram encontrados.
--
INSERT INTO trabalha (idpessoa, idobra, idprof, datainicio, datafim)
VALUES (8,2,2,'2017-01-15',null)

--
-- Dados para: Adamastor Capistrano  
--
-- Vamos descobrir o id do Adamastor
SELECT * FROM profissional WHERE nome like 'Adamastor%'
-- Vamos descobrir o id da obra da rodovia PA-140, pois ele trabalha nessa obra
SELECT * FROM obra where descricao like '%PA%';
-- Vamos descobrir o id da profissao Engenheiro civil, já que ele trabalhou na obra como mestre.
SELECT * FROM profissao where nome like '%Civ%'
--
-- Inserir de acordo com os id's que foram encontrados.
--
INSERT INTO trabalha (idpessoa, idobra, idprof, datainicio, datafim)
VALUES (9,2,2,'2017-01-15',null)

--
-- Dados para: Rafael Cabeça de Castro  
--
-- Vamos descobrir o id do Rafael
SELECT * FROM profissional WHERE nome like 'Rafael%'
-- Vamos descobrir o id da obra da rodovia PA-140, pois ele trabalha nessa obra
SELECT * FROM obra where descricao like '%PA%';
-- Vamos descobrir o id da profissao Agrimessor, já que ele trabalhou na obra como mestre.
SELECT * FROM profissao where nome like 'Agri%'
--
-- Inserir de acordo com os id's que foram encontrados.
--
INSERT INTO trabalha (idpessoa, idobra, idprof, datainicio, datafim)
VALUES (10,2,4,'2017-01-15','2018-11-30')


--
-- Dados para: Sandra Regina Quadros (obra da praça)  
--
-- Vamos descobrir o id da Sandra
SELECT * FROM profissional WHERE nome like 'Sandra%'
-- Vamos descobrir o id da obra da praça Antonio Carlos, pois ela trabalha nessa obra
SELECT * FROM obra where descricao like '%Carlos%';
-- Vamos descobrir o id da profissao Arquiteto, já que ela trabalhou na obra como mestre.
SELECT * FROM profissao where nome like 'Arq%'
--
-- Inserir de acordo com os id's que foram encontrados.
--
INSERT INTO trabalha (idpessoa, idobra, idprof, datainicio, datafim)
VALUES (4,3,1,'2012-05-13','2013-09-26')

--
-- Dados para: Archimino Lara Rezende (obra da praça)  
--
-- Vamos descobrir o id do Archimino
SELECT * FROM profissional WHERE nome like 'Archimino%'
-- Vamos descobrir o id da obra da praça Antonio Carlos, pois ele trabalha nessa obra
SELECT * FROM obra where descricao like '%Carlos%';
-- Vamos descobrir o id da profissao Arquiteto, já que ele trabalhou na obra como mestre.
SELECT * FROM profissao where nome like 'Arq%'
--
-- Inserir de acordo com os id's que foram encontrados.
--
INSERT INTO trabalha (idpessoa, idobra, idprof, datainicio, datafim)
VALUES (5,3,1,'2012-05-13','2013-09-26')


--
-- Dados para: João Pimenta de Oliveira (obra da praça)  
--
-- Vamos descobrir o id do João
SELECT * FROM profissional WHERE nome like 'Jo%'
-- Vamos descobrir o id da obra da praça Antonio Carlos, pois ele trabalha nessa obra
SELECT * FROM obra where descricao like '%Carlos%';
-- Vamos descobrir o id da profissao Eng. Civil, já que ele trabalhou na obra como mestre.
SELECT * FROM profissao where nome like 'Eng%'
--
-- Inserir de acordo com os id's que foram encontrados.
--
INSERT INTO trabalha (idpessoa, idobra, idprof, datainicio, datafim)
VALUES (8,3,2,'2012-05-13','2013-09-26')


--
-- a.	Projetar todos os profissionais com o seu nome e o nome da sua profissão
--
select distinct pf.nome, pr.nome profissao
from profissional pf INNER JOIN trabalha tr ON pf.idpessoa = tr.idpessoa
                     INNER JOIN profissao pr ON tr.idprof = pr.idprof
order by pf.nome					 



