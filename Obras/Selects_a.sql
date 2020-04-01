SELECT DISTINCT Profissional.nome, Profissao.nome 
FROM ((Trabalha 
INNER JOIN Profissional ON Trabalha.idpessoa = Profissional.idpessoa)
INNER JOIN Profissao ON Trabalha.idprof = Profissao.idprof)
ORDER BY Profissional.nome;