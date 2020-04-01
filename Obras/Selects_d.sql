SELECT nome FROM Profissional 
    INNER JOIN Trabalha ON Profissional.idpessoa = Trabalha.idpessoa
    INNER JOIN Obra ON Trabalha.idobra = Obra.idobra
WHERE Obra.descricao LIKE '%Eiffel%'
AND Trabalha.datafim = NULL;