SELECT Profissao.nome, COUNT(Profissao.nome) 
from Profissao
    INNER JOIN Trabalha ON Profissao.idprof = Trabalha.idprof
GROUP BY (Profissao.nome);