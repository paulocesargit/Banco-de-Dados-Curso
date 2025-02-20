CREATE TABLE Curso (
    ID_Curso INTEGER PRIMARY KEY,
    Disciplina_Curso VARCHAR(100),
    Nome_Curso VARCHAR(100),
    Descricao_Curso VARCHAR(100),
    Tipo_Curso VARCHAR(30),
    Data_Inicio_Curso DATE,
    Data_Fim_Curso DATE,
    Mensalidade_Curso DECIMAL(10,2),
    Turno_Curso VARCHAR(10),
    fk_Professor_ID_Professor INTEGER
);

CREATE TABLE Avaliacao (
    ID_Avaliacao INTEGER PRIMARY KEY,
    Data_Avaliacao DATE,
    Nota_Avaliacao DECIMAL(4,2),
    Tipo_Avaliacao VARCHAR(30),
    fk_Curso_ID_Curso INTEGER,
    fk_Aluno_Matricula_Aluno INTEGER,
    fk_Professor_ID_Professor INTEGER
);

CREATE TABLE Aluno (
    Matricula_Aluno INTEGER PRIMARY KEY,
    Nome_Aluno VARCHAR(100),
    CPF_Aluno VARCHAR(14),
    Endereco_Aluno VARCHAR(100),
    Telefone_Aluno VARCHAR(15),
    Email_Aluno VARCHAR(100),
    Forma_Pagamento_Aluno VARCHAR(30)
);

CREATE TABLE Sala (
    ID_Sala INTEGER PRIMARY KEY,
    Predio_Sala VARCHAR(100),
    Andar_Sala VARCHAR(3),
    Numero_Sala VARCHAR(10)
);

CREATE TABLE Professor (
    ID_Professor INTEGER PRIMARY KEY,
    Nome_Professor VARCHAR(100),
    CPF_Professor VARCHAR(14),
    Endereco_Professor VARCHAR(100),
    Telefone_Professor VARCHAR(15),
    Email_Professor VARCHAR(100),
    Conta_Bancaria_Professor VARCHAR(30)
);

CREATE TABLE CursoAluno (
    ID_CursoAluno INTEGER PRIMARY KEY,
    fk_Curso_ID_Curso INTEGER,
    fk_Aluno_Matricula_Aluno INTEGER
);

CREATE TABLE CursoSala (
    ID_CursoSala INTEGER PRIMARY KEY,
    fk_Sala_ID_Sala INTEGER,
    fk_Curso_ID_Curso INTEGER
);

ALTER TABLE Curso ADD CONSTRAINT FK_Curso_2
    FOREIGN KEY (fk_Professor_ID_Professor)
    REFERENCES Professor (ID_Professor)
    ON DELETE RESTRICT;

ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_2
    FOREIGN KEY (fk_Curso_ID_Curso)
    REFERENCES Curso (ID_Curso)
    ON DELETE CASCADE;

ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_3
    FOREIGN KEY (fk_Aluno_Matricula_Aluno)
    REFERENCES Aluno (Matricula_Aluno)
    ON DELETE CASCADE;

ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_4
    FOREIGN KEY (fk_Professor_ID_Professor)
    REFERENCES Professor (ID_Professor)
    ON DELETE RESTRICT;

ALTER TABLE CursoAluno ADD CONSTRAINT FK_CursoAluno_1
    FOREIGN KEY (fk_Curso_ID_Curso)
    REFERENCES Curso (ID_Curso)
    ON DELETE CASCADE;

ALTER TABLE CursoAluno ADD CONSTRAINT FK_CursoAluno_2
    FOREIGN KEY (fk_Aluno_Matricula_Aluno)
    REFERENCES Aluno (Matricula_Aluno)
    ON DELETE CASCADE;

ALTER TABLE CursoSala ADD CONSTRAINT FK_CursoSala_1
    FOREIGN KEY (fk_Sala_ID_Sala)
    REFERENCES Sala (ID_Sala)
    ON DELETE RESTRICT;

ALTER TABLE CursoSala ADD CONSTRAINT FK_CursoSala_2
    FOREIGN KEY (fk_Curso_ID_Curso)
    REFERENCES Curso (ID_Curso)
    ON DELETE RESTRICT;
