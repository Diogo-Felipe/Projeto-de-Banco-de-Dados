INSERT INTO Academia ( cnpj, nome ) VALUES ( '12345678901234', 'diogoFit2000');

INSERT INTO Aluno (matricula, nome, cnpj) VALUES ( 1, 'Diogo Felipe', '12345678901234' );
INSERT INTO Aluno (matricula, nome, cnpj) VALUES ( 2, 'Andre Solza', '12345678901234' );
INSERT INTO Aluno (matricula, nome, cnpj) VALUES ( 3, 'Erick Silva', '12345678901234' );
INSERT INTO Aluno (matricula, nome, cnpj) VALUES ( 4, 'Isabela Lima', '12345678901234' );
INSERT INTO Aluno (matricula, nome, cnpj) VALUES ( 5, 'Kevin Sarges', '12345678901234' );
INSERT INTO Aluno (matricula, nome, cnpj) VALUES ( 6, 'João Gabriel', '12345678901234' );
INSERT INTO Aluno (matricula, nome, cnpj) VALUES ( 7, 'Luiz Fernando', '12345678901234' );
INSERT INTO Aluno (matricula, nome, cnpj) VALUES ( 8, 'Thyci Marques', '12345678901234' );
INSERT INTO Aluno (matricula, nome, cnpj) VALUES ( 9, 'Livinho da Silva', '12345678901234' );
INSERT INTO Aluno (matricula, nome, cnpj) VALUES ( 10, 'Daniel de Macedo', '12345678901234' );

INSERT INTO Modalidade (qtdVagas, descricao)
VALUES( 50, "Musculação");
INSERT INTO Modalidade (qtdVagas, descricao)
VALUES( 15, "Dança");
INSERT INTO Modalidade (qtdVagas, descricao)
VALUES( 10, "Spinning");
INSERT INTO Modalidade (qtdVagas, descricao)
VALUES( 15, "Funcional");
INSERT INTO Modalidade (qtdVagas, descricao)
VALUES( 10, "Natação");

INSERT INTO Matricula (matricula, situacao, dataMatricula)
VALUES(1, 'A', '01/01/2019');
INSERT INTO Matricula (matricula, situacao, dataMatricula)
VALUES(2, 'I', '13/02/2019');
INSERT INTO Matricula (matricula, situacao, dataMatricula)
VALUES(3, 'A', '24/03/2019');
INSERT INTO Matricula (matricula, situacao, dataMatricula)
VALUES(4, 'I', '04/04/2019');
INSERT INTO Matricula (matricula, situacao, dataMatricula)
VALUES(5, 'A', '30/05/2019');
INSERT INTO Matricula (matricula, situacao, dataMatricula)
VALUES(6, 'I', '10/06/2019');
INSERT INTO Matricula (matricula, situacao, dataMatricula)
VALUES(7, 'A', '11/07/2019');
INSERT INTO Matricula (matricula, situacao, dataMatricula)
VALUES(8, 'I', '01/08/2019');
INSERT INTO Matricula (matricula, situacao, dataMatricula)
VALUES(9, 'A', '07/09/2019');
INSERT INTO Matricula (matricula, situacao, dataMatricula)
VALUES(10, 'I', '01/10/2019');
INSERT INTO Matricula (matricula, situacao, dataMatricula)
VALUES(1, 'A', '19/11/2019');
INSERT INTO Matricula (matricula, situacao, dataMatricula)
VALUES(2, 'I', '21/12/2019');
INSERT INTO Matricula (matricula, situacao, dataMatricula)
VALUES(3, 'A', '01/01/2020');
INSERT INTO Matricula (matricula, situacao, dataMatricula)
VALUES(4, 'A', '01/02/2020');
INSERT INTO Matricula (matricula, situacao, dataMatricula)
VALUES(5, 'I', '01/03/2020');

INSERT INTO ItensMatricula (precoItem, idMatricula, idModalidade)
VALUES (200, 1, 1);
INSERT INTO ItensMatricula (precoItem, idMatricula, idModalidade)
VALUES (250, 2, 2);
INSERT INTO ItensMatricula (precoItem, idMatricula, idModalidade)
VALUES (220, 3, 3);
INSERT INTO ItensMatricula (precoItem, idMatricula, idModalidade)
VALUES (210, 4, 4);
INSERT INTO ItensMatricula (precoItem, idMatricula, idModalidade)
VALUES (100, 5, 5);
INSERT INTO ItensMatricula (precoItem, idMatricula, idModalidade)
VALUES (150, 6, 1);
INSERT INTO ItensMatricula (precoItem, idMatricula, idModalidade)
VALUES (120, 7, 2);
INSERT INTO ItensMatricula (precoItem, idMatricula, idModalidade)
VALUES (200, 8, 3);
INSERT INTO ItensMatricula (precoItem, idMatricula, idModalidade)
VALUES (200, 9, 4);
INSERT INTO ItensMatricula (precoItem, idMatricula, idModalidade)
VALUES (300, 10, 5);
INSERT INTO ItensMatricula (precoItem, idMatricula, idModalidade)
VALUES (225, 11, 1);
INSERT INTO ItensMatricula (precoItem, idMatricula, idModalidade)
VALUES (300, 12, 2);
INSERT INTO ItensMatricula (precoItem, idMatricula, idModalidade)
VALUES (200, 13, 3);
INSERT INTO ItensMatricula (precoItem, idMatricula, idModalidade)
VALUES (200, 14, 4);
INSERT INTO ItensMatricula (precoItem, idMatricula, idModalidade)
VALUES (200, 15, 5);