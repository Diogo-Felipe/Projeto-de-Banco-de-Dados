SELECT Aluno.nome FROM ALuno 
    INNER JOIN Matricula ON Matricula.matricula = Aluno.matricula
    INNER JOIN ItensMatricula ON ItensMatricula.idMatricula = Matricula.idMatricula
    INNER JOIN Modalidade ON Modalidade.idModalidade = ItensMatricula.idModalidade
WHERE Modalidade.descricao LIKE '%atação%';

