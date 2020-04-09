-- 1 A
SELECT acad.razaosocial, alu.nome FROM academia acad INNER JOIN aluno alu ON acad.cnpj = alu.cnpj ORDER BY acad.razaosocial, alu.nome

-- 2 C
SELECT count(*) FROM academia acad INNER JOIN aluno alu ON acad.cnpj = alu.cnpj INNER JOIN matricula mat ON alu.matricula = mat.matricula INNER JOIN itensmatricula item ON mat.idmatricula = item.idmatricula INNER JOIN modalidade moda ON item.idmodalidade = moda.idmodalidade WHERE acad.cnpj = '1111111111111' AND upper(moda.descricao) like '%MUSCULA%'

-- 3 B
SELECT acad.razaosocial, (SELECT count(*) FROM academia ac INNER JOIN aluno alu ON ac.cnpj = alu.cnpj INNER JOIN matricula mat ON alu.matricula = mat.matricula WHERE acad.cnpj = ac.cnpj and mat.situacao = 'A') alunos_ativos, (SELECT count(*) FROM academia ac INNER JOIN aluno alu ON ac.cnpj = alu.cnpj INNER JOIN matricula mat ON alu.matricula = mat.matricula WHERE acad.cnpj = ac.cnpj and mat.situacao = 'I') alunos_inativos FROM academia acad

-- 4
GO

CREATE VIEW V_ATIVOS AS (
    SELECT acad.razaosocial, alu.nome, moda.descricao
    FROM academia acad
        INNER JOIN aluno alu ON acad.cnpj = alu.cnpj INNER JOIN matricula mat ON alu.matricula = mat.matricula INNER JOIN itensmatricula item ON mat.idmatricula = item.idmatricula INNER JOIN modalidade moda ON item.idmodalidade = moda.idmodalidade
    WHERE mat.situacao = 'A'
)

GO

-- 5

SELECT acad.nome, moda.descricao
FROM academia acad
    INNER JOIN aluno alu ON acad.cnpj = alu.cnpj INNER JOIN matricula mat ON alu.matricula = mat.matricula INNER JOIN itensmatricula item ON mat.idmatricula = item.idmatricula INNER JOIN modalidade moda ON item.idmodalidade = moda.idmodalidade
WHERE (
    (SELECT count(*) FROM academia ac
        INNER JOIN aluno alu ON ac.cnpj = alu.cnpj INNER JOIN matricula mat ON alu.matricula = mat.matricula INNER JOIN itensmatricula item ON mat.idmatricula = item.idmatricula INNER JOIN modalidade moda ON item.idmodalidade = moda.idmodalidade
    WHERE mat.situacao = 'A'
        and acad.cnpj = ac.cnpj)
                >=
    (
        (SELECT count(*) FROM matricula)
         			/
        (SELECT count(*) FROM academia)
    )
)
GROUP BY acad.nome, moda.descricao;