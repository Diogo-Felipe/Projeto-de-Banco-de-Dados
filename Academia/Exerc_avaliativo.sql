SELECT acad.razaosocial, (SELECT count(*) FROM academia ac INNER JOIN aluno alu ON ac.cnpj = alu.cnpj INNER JOIN matricula mat ON alu.matricula = mat.matricula WHERE acad.cnpj = ac.cnpj and mat.situacao = 'A') alunos_ativos, (SELECT count(*) FROM academia ac INNER JOIN aluno alu ON ac.cnpj = alu.cnpj INNER JOIN matricula mat ON alu.matricula = mat.matricula WHERE acad.cnpj = ac.cnpj and mat.situacao = 'I') alunos_inativos FROM academia acad