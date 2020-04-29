-- 1 
SELECT c.nome, oc.dataocorencia, oc.descocorencia, ov.nome
FROM Ocorrencia oc
    INNER JOIN Cliente c ON c.cpf = oc.cpf
    INNER JOIN Ouvidor ov On ov.matricula = oc.matricula
WHERE oc.situacao LIKE 'aberta' 
    AND EXTRACT(YEAR from oc.dataocorencia) = 2020;