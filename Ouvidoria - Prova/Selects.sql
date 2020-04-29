-- 1 
SELECT c.nome, oc.dataocorencia, oc.descocorencia, ov.nome
FROM Ocorrencia oc
    INNER JOIN Cliente c ON c.cpf = oc.cpf
    INNER JOIN Ouvidor ov On ov.matricula = oc.matricula
WHERE oc.situacao LIKE 'aberta' 
    AND EXTRACT(YEAR from oc.dataocorencia) = 2020;

-- 2

SELECT ovp.nome, 
    (
        SELECT COUNT(oc.idocorrencia) 
        FROM Ocorrencia oc
            INNER JOIN Ouvidor ovs ON ovs.matricula = oc.matricula
            WHERE ovs.matricula = ovp.matricula
                AND oc.situacao LIKE 'aberta' 
                AND EXTRACT(YEAR from oc.dataocorencia) = 2020
    ) ocorrencias_abertas,
    (
        SELECT COUNT(oc.idocorrencia) 
        FROM Ocorrencia oc
            INNER JOIN Ouvidor ovs ON ovs.matricula = oc.matricula
            WHERE ovs.matricula = ovp.matricula
                AND oc.situacao LIKE 'fechada' 
                AND EXTRACT(YEAR from oc.dataocorencia) = 2020
    ) ocorenciias_fechadas,
    (
        round(1.0 *(
            SELECT COUNT(oc.idocorrencia) 
            FROM Ocorrencia oc
                INNER JOIN Ouvidor ovs ON ovs.matricula = oc.matricula
                WHERE ovs.matricula = ovp.matricula
                    AND oc.situacao LIKE 'fechada' 
                    AND EXTRACT(YEAR from oc.dataocorencia) = 2020
        ) / (
            SELECT COUNT(oc.idocorrencia) 
            FROM Ocorrencia oc
                INNER JOIN Ouvidor ovs ON ovs.matricula = oc.matricula
                WHERE ovs.matricula = ovp.matricula
                AND EXTRACT(YEAR from oc.dataocorencia) = 2020
        ) * 100, 2)
    ) percentual
FROM Ouvidor ovp

-- 3

SELECT tocp.descricao,
    (
        SELECT COUNT(oc.idtipo)
        FROM Ocorrencia oc
            INNER JOIN TipoOcorrencia tocs ON tocs.idtipo = oc.idtipo
        WHERE tocs.descricao = tocp.descricao
    ) quantidade
FROM TipoOcorrencia tocp
ORDER BY quantidade DESC;

