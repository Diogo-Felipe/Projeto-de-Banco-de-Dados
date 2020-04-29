INSERT INTO Ouvidor (matricula, nome) VALUES (1, 'Diogo Felipe');
INSERT INTO Ouvidor (matricula, nome) VALUES (2, 'Ruan Gabriel');
INSERT INTO Ouvidor (matricula, nome) VALUES (3, 'Pedro Tavares');
INSERT INTO Ouvidor (matricula, nome) VALUES (4, 'João Gabriel');

INSERT INTO Cliente (cpf, nome) VALUES ('123.123.123-12', 'Isabela');
INSERT INTO Cliente (cpf, nome) VALUES ('234.234.234-23', 'Kevin');
INSERT INTO Cliente (cpf, nome) VALUES ('345.345.345-34', 'Dionisio');
INSERT INTO Cliente (cpf, nome) VALUES ('456.456.456-45', 'Perceus');
INSERT INTO Cliente (cpf, nome) VALUES ('567.567.567-56', 'Yan');

INSERT INTO TipoOcorrencia (descricao) VALUES ('reclamação');
INSERT INTO TipoOcorrencia (descricao) VALUES ('elogio');
INSERT INTO TipoOcorrencia (descricao) VALUES ('sugestão');

INSERT INTO Ocorrencia (descocorencia, dataocorencia, matricula, cpf, idtipo)
VALUES ('Falta de carater na empresa','01/01/2019', 1, '123.123.123-12', 1);
INSERT INTO Ocorrencia (descocorencia, dataocorencia, matricula, cpf, idtipo)
VALUES ('Boa recepção','02/04/2019', 2, '234.234.234-23', 2);
INSERT INTO Ocorrencia (descocorencia, dataocorencia, matricula, cpf, idtipo)
VALUES ('Mais vinho na empresa','17/05/2019', 3, '345.345.345-34', 3);
INSERT INTO Ocorrencia (descocorencia, dataocorencia, matricula, cpf, idtipo)
VALUES ('Falta água no bebedouro','20/06/2019', 4, '456.456.456-45', 1);

INSERT INTO Ocorrencia (descocorencia, situacao, dataocorencia, matricula, cpf, idtipo)
VALUES ('Boa comida', 'fechada', '22/07/2019', 2, '456.456.456-45', 2);
INSERT INTO Ocorrencia (descocorencia, situacao, dataocorencia, matricula, cpf, idtipo)
VALUES ('Muito quente na empresa', 'fechada', '24/07/2019', 1, '345.345.345-34', 1);
INSERT INTO Ocorrencia (descocorencia, situacao, dataocorencia, matricula, cpf, idtipo)
VALUES ('Colocar cadeiras melhores','fechada', '27/07/2019', 3, '123.123.123-12', 3);

INSERT INTO Providencia (descprovidencia, idocorrencia) VALUES ('Agradecimento ao cliente', 5);
INSERT INTO Providencia (descprovidencia, idocorrencia) VALUES ('Compra de central de ar', 6);
INSERT INTO Providencia (descprovidencia, idocorrencia) VALUES ('Compra de cadeiras estofadas', 7);

INSERT INTO Ocorrencia (descocorencia, dataocorencia, matricula, cpf, idtipo)
VALUES ('Mesa muito baixa','01/01/2020', 1, '123.123.123-12', 1);
INSERT INTO Ocorrencia (descocorencia, dataocorencia, matricula, cpf, idtipo)
VALUES ('Cadeiras ótimas','02/04/2020', 2, '234.234.234-23', 2);
INSERT INTO Ocorrencia (descocorencia, dataocorencia, matricula, cpf, idtipo)
VALUES ('Colocar fontes de vinho','17/05/2020', 3, '345.345.345-34', 3);
INSERT INTO Ocorrencia (descocorencia, dataocorencia, matricula, cpf, idtipo)
VALUES ('Falta um aquário','20/06/2020', 4, '456.456.456-45', 1);
