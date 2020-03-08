-- 
-- Selects BD de Obras
-- Ver. 1.0.0 em 08/03/2020
-- Autor: Diogo L.C. Felipe
--

SELECT nome FROM Profissional 
    INNER JOIN Trabalha ON Profissional.idpessoa = Trabalha.idpessoa
    INNER JOIN Obra ON Trabalha.idobra = Obra.idobra
WHERE Obra.descricao LIKE '%Eiffel%'
AND Trabalha.datafim = NULL;