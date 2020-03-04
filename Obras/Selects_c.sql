-- 
-- Selects BD de Obras
-- Ver. 1.0.0 em 04/03/2020
-- Autor: Diogo L.C. Felipe
--

SELECT Profissao.nome, COUNT(Profissao.nome) 
from Profissao
    INNER JOIN Trabalha ON Profissao.idprof = Trabalha.idprof
GROUP BY (Profissao.nome);