-- 
-- Inserts Torre Eiffel BD de Obras
-- Ver. 1.0 em 15/02/2020
-- Autor: Diogo L.C. Felipe
--

INSERT INTO Obras ( descricao ) VALUES ( 'Edifício Torre Eiffel' );

INSERT INTO Profissao ( nome ) VALUES ( 'Engenheiro Civíl' );
INSERT INTO Profissao ( nome ) VALUES ( 'Arquiteto' );
INSERT INTO Profissao ( nome ) VALUES ( 'Mestre de Obra' );

INSERT INTO Profissional ( nome ) VALUES ( 'Fátima Araújo Oliveira' );
INSERT INTO Profissional ( nome ) VALUES ( 'Waldir Castelo Quaresma' );
INSERT INTO Profissional ( nome ) VALUES ( 'Maria do Rosário Fernandes' );
INSERT INTO Profissional ( nome ) VALUES ( 'Sandra Regina Quadros' );
INSERT INTO Profissional ( nome ) VALUES ( 'Archimino Lara Rezende' );
INSERT INTO Profissional ( nome ) VALUES ( 'Agenor Navarro Aguiar' );
INSERT INTO Profissional ( nome ) VALUES ( 'Agripino Furtado das Neves' );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoal,
    idprof
) VALUES ('20/02/2019', NULL, 1, 1, 1 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoal,
    idprof
) VALUES ('20/02/2019', NULL, 1, 2, 1 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoal,
    idprof
) VALUES ('20/02/2019', NULL, 1, 3, 1 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoal,
    idprof
) VALUES ('20/02/2019', '15/01/2020', 1, 4, 2 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoal,
    idprof
) VALUES ('20/02/2019', '15/01/2020', 1, 5, 2 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoal,
    idprof
) VALUES ('01/12/2019', NULL, 1, 6, 3 );

INSERT INTO Trabalha ( 
    datainicio,
    datafim,
    idobra,
    idpessoal,
    idprof
) VALUES ('20/02/2019', '31/11/2019', 1, 7, 3 );
