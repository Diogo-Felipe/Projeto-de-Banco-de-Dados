INSERT INTO Obra ( descricao ) VALUES ( 'Pavimentação Rodovia PA-140' );

INSERT INTO Profissao ( nome ) VALUES ( 'Agrimessor' );

INSERT INTO Profissional ( nome ) VALUES ( 'João Pimenta de Oliveira' );
INSERT INTO Profissional ( nome ) VALUES ( 'Adamastor Capstrano' );
INSERT INTO Profissional ( nome ) VALUES ( 'Rafael Cabeça de Castro' );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('15/01/2017', NULL, 2, 8, 1 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('15/01/2017', NULL, 2, 9, 1 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoa,
    idprof
) VALUES ('15/01/2017', '30/11/2018', 2, 10, 4 );