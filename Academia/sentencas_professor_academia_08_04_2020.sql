--
-- Exemplo do uso de subquery na cláusula SELECT. 
-- Observe também o uso de expressão aritmética (o cálculo do percentual de alunos)
--
SELECT acad.cnpj,
        acad.razaosocial, 
		(SELECT count(*) FROM aluno alu WHERE alu.cnpj = acad.cnpj ) qtd_alunos_meu,
		(SELECT count(*) FROM aluno alu WHERE alu.cnpj != acad.cnpj ) qtd_alunos_dos_outros,
		round((SELECT count(*) FROM aluno alu WHERE alu.cnpj = acad.cnpj ) * 1.0 / 
			  (SELECT count(*) FROM aluno alu ) * 100 , 2) perc_alunos
FROM   academia acad

--
-- Exemplo do uso de subquery na cláusula FROM. Como qualquer query retorna uma tabela, podemos
-- direcionar o seu resultado e utilizar essa "tabela" como fonte do dado
--

SELECT acad.cnpj,
       acad.razaosocial,
	   alu.cpf,
	   alu.nome,
	   qtd_alunos_meu,
	   qtd_alunos_dos_outros,
	   perc_alunos
FROM  academia acad INNER JOIN aluno alu ON acad.cnpj  = alu.cnpj
                    INNER JOIN matricula mat ON alu.matricula = mat.matricula	   
	                INNER JOIN (SELECT acad.cnpj,
                                       acad.razaosocial, 
		                              (SELECT count(*) FROM aluno alu WHERE alu.cnpj = acad.cnpj ) qtd_alunos_meu,
		                              (SELECT count(*) FROM aluno alu WHERE alu.cnpj != acad.cnpj ) qtd_alunos_dos_outros,
		                                round((SELECT count(*) FROM aluno alu WHERE alu.cnpj = acad.cnpj ) * 1.0 / 
									           (SELECT count(*) FROM aluno alu ) * 100 , 2) perc_alunos
							   FROM   academia acad) nova ON nova.cnpj = acad.cnpj

CREATE VIEW V_NOVA AS 
   (SELECT acad.cnpj,
                                       acad.razaosocial, 
		                              (SELECT count(*) FROM aluno alu WHERE alu.cnpj = acad.cnpj ) qtd_alunos_meu,
		                              (SELECT count(*) FROM aluno alu WHERE alu.cnpj != acad.cnpj ) qtd_alunos_dos_outros,
		                                round((SELECT count(*) FROM aluno alu WHERE alu.cnpj = acad.cnpj ) * 1.0 / 
									           (SELECT count(*) FROM aluno alu ) * 100 , 2) perc_alunos
							   FROM   academia acad)
--
-- Exemplo do uso de subquery na cláusula WHERE. Como qualquer query retorna uma tabela, podemos
-- direcionar o seu resultado e utilizar os dados dessa "tabela" em sentenças da cláusula WHERE. Lembre que
-- a cláusula where é composta por sentença lógica e portanto retorna somente false ou true
--
-- Exemplo: retornar somente as modalidades da academia com cnpj = 11111111111 que ainda possuem vagas (SEM ESPECIFICAR A QTD.
-- DE VAGAS REMANESCENTES)
--
SELECT moda.descricao, moda.cnpj
FROM   academia acad INNER JOIN modalidade moda ON acad.cnpj = moda.cnpj
WHERE  acad.cnpj = '1111111111111' AND
       moda.qtdvagas > (SELECT count(*) 
					    FROM   academia acad1 INNER JOIN aluno alu ON acad1.cnpj  = alu.cnpj
                                             INNER JOIN matricula mat ON alu.matricula = mat.matricula	
                                             INNER JOIN itensmatricula it ON mat.idmatricula = it.idmatricula 
						WHERE  acad.cnpj = acad1.cnpj   
						       AND moda.idmodalidade = it.idmodalidade
				        GROUP BY it.idmodalidade )
  
-- Exemplo 02: Todas as academias que possuem matriculas canceladas (não ativas) uso do operador IN (operador de conjunto)
SELECT acad.razaosocial
FROM   academia acad
WHERE  acad.cnpj IN (SELECT ac.cnpj FROM academia ac INNER JOIN aluno alu ON ac.cnpj = alu.cnpj
					                               INNER JOIN matricula ma ON ma.matricula = alu.matricula
					 WHERE ma.situacao = 'I')

-- Exemplo 03: Academia que possue o maior numero de alunos 
SELECT acad.razaosocial
FROM   academia acad
WHERE  acad.cnpj = (SELECT ac.cnpj FROM academia ac INNER JOIN aluno alu ON ac.cnpj = alu.cnpj
					                               INNER JOIN matricula ma ON ma.matricula = alu.matricula
					WHERE ma.situacao = 'A'
				    GROUP BY ac.cnpj
				    ORDER BY count(*) DESC
				    limit 1)
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
-- USO DE VIEWS PARA SIMPLIFICAR AS SENTENÇAS
--
CREATE OR REPLACE VIEW V_NOVA AS 
   (SELECT acad.cnpj,
                                       acad.razaosocial, 
		                              (SELECT count(*) FROM aluno alu WHERE alu.cnpj = acad.cnpj ) qtd_alunos_meu,
		                              (SELECT count(*) FROM aluno alu WHERE alu.cnpj != acad.cnpj ) qtd_alunos_dos_outros,
		                                round((SELECT count(*) FROM aluno alu WHERE alu.cnpj = acad.cnpj ) * 1.0 / 
									           (SELECT count(*) FROM aluno alu ) * 100 , 2) perc_alunos
							   FROM   academia acad)
-- A mesma sentença utilizando a view	    						   
SELECT acad.cnpj,
       acad.razaosocial,
	   alu.cpf,
	   alu.nome,
	   qtd_alunos_meu,
	   qtd_alunos_dos_outros,
	   perc_alunos
FROM  academia acad INNER JOIN aluno alu ON acad.cnpj  = alu.cnpj
                    INNER JOIN matricula mat ON alu.matricula = mat.matricula	   
	                INNER JOIN v_nova  nova ON nova.cnpj = acad.cnpj

-- USO DE VIEW PARA "ESCONDER" UMA COLUNA (QUERO ESCONDER A COLUNA cpf)
CREATE OR REPLACE VIEW v_aluno AS
  SELECT matricula, nome, cnpj from aluno
  
  
  
select * from v_aluno  
