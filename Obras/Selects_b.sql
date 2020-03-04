-- 
-- Selects BD de Obras
-- Ver. 1.0.0 em 04/03/2020
-- Autor: Diogo L.C. Felipe
--

SELECT Obra.nome, Profissional.nome, Profissao.nome, Trabalha.datainicio, Trabalha.datafim
FROM Obra
INNER JOIN Trabalha ON Obra.idobra = Trabalha.idobra
INNER JOIN Profissional ON Trabalha.idpessoa = Profissional.idpessoa
INNER JOIN Profissao ON Trabalha.idprof = Profissao.idprof;