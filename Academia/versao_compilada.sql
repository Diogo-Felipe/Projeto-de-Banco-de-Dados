SELECT Aluno.nome FROM Aluno 
    INNER JOIN Matricula ON Matricula.matricula = Aluno.matricula
    INNER JOIN ItensMatricula ON ItensMatricula.idMatricula = Matricula.idMatricula
    INNER JOIN Modalidade ON Modalidade.idModalidade = ItensMatricula.idModalidade
WHERE Modalidade.descricao LIKE '%atação%';

SELECT mop.descricao,
    (
        SELECT count(*) 
        FROM Aluno a 
            INNER JOIN Matricula ma ON ma.matricula = a.matricula
            INNER JOIN ItensMatricula im ON im.idMatricula = ma.idMatricula
            INNER JOIN Modalidade mo ON mo.idModalidade = im.idModalidade
            WHERE ma.dataMatricula BETWEEN '01/01/2020' AND '21/12/2020'
                AND mo.idModalidade = mop.idModalidade
            GROUP BY mo.idModalidade
    ) Alunos
FROM Modalidade mop;


SELECT mop.descricao,
    (
        SELECT count(*) 
        FROM Aluno a 
            INNER JOIN Matricula ma ON ma.matricula = a.matricula
            INNER JOIN ItensMatricula im ON im.idMatricula = ma.idMatricula
            INNER JOIN Modalidade mo ON mo.idModalidade = im.idModalidade
            WHERE ma.situacao = 'A'
                AND mo.idModalidade = mop.idModalidade
            GROUP BY mo.idModalidade
    ) Alunos,
    round(1.0 * (
        SELECT count(*) 
        FROM Aluno a 
            INNER JOIN Matricula ma ON ma.matricula = a.matricula
            INNER JOIN ItensMatricula im ON im.idMatricula = ma.idMatricula
            INNER JOIN Modalidade mo ON mo.idModalidade = im.idModalidade
            WHERE ma.situacao = 'A'
                AND mo.idModalidade = mop.idModalidade
    ) / (
        SELECT count(*) 
        FROM Aluno a 
            INNER JOIN Matricula ma ON ma.matricula = a.matricula
            INNER JOIN ItensMatricula im ON im.idMatricula = ma.idMatricula
            INNER JOIN Modalidade mo ON mo.idModalidade = im.idModalidade
            WHERE ma.situacao = 'A'
    ) * 100, 2) Percentual
FROM Modalidade mop;


SELECT mop.descricao,
    (
        SELECT count(*) 
        FROM Matricula ma
            INNER JOIN ItensMatricula im ON im.idMatricula = ma.idMatricula
            INNER JOIN Modalidade mo ON mo.idModalidade = im.idModalidade
            WHERE mo.idModalidade = mop.idModalidade
            GROUP BY mo.idModalidade
    ) Matriculas
FROM Modalidade mop
ORDER BY Matriculas DESC;

SELECT DISTINCT mo.descricao "Possuem Vagas"
FROM Modalidade mo
    INNER JOIN ItensMatricula im ON im.idModalidade = mo.idModalidade
    INNER JOIN Matricula ma ON ma.idMatricula = im.idMatricula
WHERE mo.qtdVagas > (
    SELECT count(*) 
    from Matricula
);

SELECT ap.nome,
    (
        SELECT max(count(*)) FROM Modalidade
            INNER JOIN ItensMatricula im ON im.idModalidade = mo.idModalidade
            INNER JOIN Matricula ma ON ma.idMatricula = im.idMatricula
            INNER JOIN Aluno a ON ma.matricula = a.matricula
        WHERE a.matricula = ap.matricula
        GROUP BY a.matricula
    ) Quantidade
FROM Aluno ap;

SELECT count(*) FROM Matricula
WHERE dataMatricula BETWEEN '01/03/2020' AND '01/04/2020';