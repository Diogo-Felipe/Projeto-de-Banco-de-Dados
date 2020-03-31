--
-- Fazer a associação (1,1) x (1,n) entre academia e modalidade para que a qtd de vagas de cada modalidade seja
-- por academia
--
ALTER TABLE modalidade ADD COLUMN cnpj varchar(13);
ALTER TABLE modalidade ADD CONSTRAINT fk_mod_acad FOREIGN KEY (cnpj) REFERENCES academia;
--
-- Verifique que o conteúdo da coluna cnpj da tabela modalidade está null
--
SELECT * from modalidade

--
-- Vamos associar as modalidades às academias, futebol, basquete e volei para a academia 1958 e as demais para a 1970
-- 
UPDATE modalidade SET cnpj = '1111111111111' WHERE idmodalidade IN (1,2,3);
SELECT * FROM modalidade
UPDATE modalidade SET cnpj = '2222222222222' WHERE cnpj is null;

--
-- Efeito colateral - Vamos ver agora quem é aluno de uma academia matriculado em modalidade de outra academia
--
SELECT alu.nome, alu.cnpj acad_aluno, moda.cnpj acad_modalidade, moda.idmodalidade, moda.descricao, item.iditem
FROM  academia acad INNER JOIN aluno alu ON acad.cnpj  = alu.cnpj
                    INNER JOIN matricula mat ON alu.matricula = mat.matricula
					INNER JOIN itensmatricula item ON mat.idmatricula = item.idmatricula
					INNER JOIN modalidade moda ON item.idmodalidade = moda.idmodalidade
					                            AND moda.cnpj != alu.cnpj

--
-- Vamos criar as modalidades que estão faltando nas academias com a qtd de vagas ofertadas
--
-- Futebol na academia 2222222222222 com qtd. vagas = 5 ; basquete com qtd. vagas = 3 e voleibol com qtd. vagas = 4
INSERT INTO modalidade (descricao, qtdvagas, cnpj) VALUES ('Futebol',5,'2222222222222');
INSERT INTO modalidade (descricao, qtdvagas, cnpj) VALUES ('Basquetebol',3,'2222222222222');
INSERT INTO modalidade (descricao, qtdvagas, cnpj) VALUES ('Voleibol',4,'2222222222222');

-- Natação na academia 1111111111111 com qtd. vagas = 8 ; Hidroginástica com qtd. vagas = 3 e Musculação com qtd. vagas = 10
INSERT INTO modalidade (descricao, qtdvagas, cnpj) VALUES ('Natação',8,'1111111111111');
INSERT INTO modalidade (descricao, qtdvagas, cnpj) VALUES ('Hidroginástica',3,'1111111111111');
INSERT INTO modalidade (descricao, qtdvagas, cnpj) VALUES ('Musculação',10,'1111111111111');

--
-- Vamos ver como ficou a tabela modalidade
--
SELECT * FROM modalidade

--
-- Temos que corrigir a base de dados, pois ela ficou inconsistente
--
UPDATE itensmatricula SET idmodalidade = ?  WHERE iditem = ?

--
-- Sentença para mostrar as modalidades que ainda possuem vagas disponíveis (uso de subquery no SELECT e no HAVING)
--
SELECT acad.razaosocial, moda.idmodalidade, moda.descricao, count(*),
       (SELECT qtdvagas FROM modalidade mo WHERE moda.idmodalidade = mo.idmodalidade ) vagas_ofertadas,
	   (SELECT qtdvagas FROM modalidade mo WHERE moda.idmodalidade = mo.idmodalidade ) - count(*) vagas_remanescentes
FROM  academia acad INNER JOIN aluno alu ON acad.cnpj  = alu.cnpj
                    INNER JOIN matricula mat ON alu.matricula = mat.matricula
					INNER JOIN itensmatricula item ON mat.idmatricula = item.idmatricula
					INNER JOIN modalidade moda ON item.idmodalidade = moda.idmodalidade
					                            AND moda.cnpj = acad.cnpj
WHERE mat.situacao = 'A'					
GROUP BY acad.cnpj, moda.idmodalidade
HAVING count(*) < (SELECT qtdvagas FROM modalidade mo WHERE moda.idmodalidade = mo.idmodalidade )

--
-- 
--