SELECT Aluno.nome FROM Aluno 
    INNER JOIN Matricula ON Matricula.matricula = Aluno.matricula
    INNER JOIN ItensMatricula ON ItensMatricula.idMatricula = Matricula.idMatricula
    INNER JOIN Modalidade ON Modalidade.idModalidade = ItensMatricula.idModalidade
WHERE Modalidade.descricao LIKE '%atação%';

SELECT Modalidade.descricao,
    (
        SELECT count(*) 
        FROM Aluno a 
            INNER JOIN Matricula ma ON ma.matricula = a.matricula
            INNER JOIN ItensMatricula im ON im.idMatricula = ma.idMatricula
            INNER JOIN Modalidade mo ON mo.idModalidade = im.idModalidade
            WHERE Matricula.dataMatricula BETWEEN '01/01/2020' AND '21/12/2020'
                AND mo.idModalidade = mop.idModalidade
            GROUP BY mo.idModalidade
    ) Alunos
FROM Modalidade mop;
