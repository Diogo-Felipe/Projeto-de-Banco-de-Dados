-- 
-- Selects BD de Obras
-- Ver. 1.1.0 em 15/02/2020
-- Autor: Diogo L.C. Felipe
--

SELECT DISTINCT Profissional.nome, Profissao.nome 
FROM ((Trabalha 
INNER JOIN Profissional ON Trabalha.idpessoa = Profissional.idpessoa)
INNER JOIN Profissao ON Trabalha.idprof = Profissao.idprof)
ORDER BY Profissional.nome;