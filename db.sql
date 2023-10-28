-- testar bando de dados SQLITE: https://sqliteonline.com/
-- criar tabelas
CREATE TABLE aluno (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT NOT NULL
);
CREATE TABLE responsavel (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
);
CREATE TABLE parentesco (
    idResponsavel INTEGER,
    idAluno INTEGER,
    parentesco TEXT,
    FOREIGN KEY (idResponsavel) REFERENCES responsavel(id),
    FOREIGN KEY (idAluno) REFERENCES aluno(id)
    ON DELETE CASCADE
);

-- popular tabelas
-- alunos
INSERT INTO aluno (nome) VALUES ('Lucas');
--responsaveis
INSERT INTO responsavel (id, nome) VALUES (1, 'Brenda');
INSERT INTO responsavel (id, nome) VALUES (2, 'Pablo');
--parentesco
INSERT INTO parentesco (idResponsavel, idAluno, parentesco) VALUES (1, 1, 'mae');
INSERT INTO parentesco (idResponsavel, idAluno, parentesco) VALUES (2, 1, 'pai');
--

-- consultas
-- EXERCICIO 1 consultar um aluno especifico
SELECT
    aluno.nome AS aluno,
    responsavel1.nome AS responsavel1,
    parentesco1.parentesco AS parentesco1,
    responsavel2.nome AS responsavel2,
    parentesco2.parentesco AS parentesco2
FROM aluno
LEFT JOIN parentesco AS parentesco1 ON aluno.id = parentesco1.idAluno
LEFT JOIN responsavel AS responsavel1 ON parentesco1.idResponsavel = responsavel1.id
LEFT JOIN parentesco AS parentesco2 ON aluno.id = parentesco2.idAluno
LEFT JOIN responsavel AS responsavel2 ON parentesco2.idResponsavel = responsavel2.id
WHERE parentesco1.parentesco <> parentesco2.parentesco And aluno.nome = 'Lucas'
GROUP BY aluno
LIMIT 1;

-- EXERCICIO BONUS consultar todos os dados
SELECT
	aluno.id,
    aluno.nome AS aluno,
    responsavel1.nome AS responsavel1,
    parentesco1.parentesco AS parentesco1,
    responsavel2.nome AS responsavel2,
    parentesco2.parentesco AS parentesco2
FROM aluno
LEFT JOIN parentesco AS parentesco1 ON aluno.id = parentesco1.idAluno
LEFT JOIN responsavel AS responsavel1 ON parentesco1.idResponsavel = responsavel1.id
LEFT JOIN parentesco AS parentesco2 ON aluno.id = parentesco2.idAluno
LEFT JOIN responsavel AS responsavel2 ON parentesco2.idResponsavel = responsavel2.id
WHERE parentesco1.parentesco <> parentesco2.parentesco
GROUP BY aluno;

-- consultar todos os alunos
SELECT * FROM aluno;

-- consultar todos os responsaveis
SELECT
	responsavel.id,
	responsavel.nome AS responsavel_nome,
	aluno.nome AS aluno_nome
FROM responsavel
JOIN aluno ON aluno.id = parentesco.idAluno
JOIN parentesco ON responsavel.id = parentesco.idResponsavel;