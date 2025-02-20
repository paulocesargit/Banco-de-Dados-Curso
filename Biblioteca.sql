CREATE TABLE Livro ( ID_Livro INTEGER PRIMARY KEY, Titulo VARCHAR(255), Autor VARCHAR(255), Editora VARCHAR(255), Ano_Publicacao INTEGER, ISBN VARCHAR(20) );

CREATE TABLE AlunoLivro ( ID_AlunoLivro INTEGER PRIMARY KEY, fk_Aluno_Matricula_Aluno INTEGER, fk_Livro_ID_Livro INTEGER, Data_Emprestimo DATE, Data_Devolucao DATE, Status_Emprestimo VARCHAR(20), -- "Emprestado", "Devolvido", "Atrasado" FOREIGN KEY (fk_Aluno_Matricula_Aluno) REFERENCES Aluno (Matricula_Aluno) ON DELETE CASCADE, FOREIGN KEY (fk_Livro_ID_Livro) REFERENCES Livro (ID_Livro) ON DELETE CASCADE );

CREATE TABLE Multa ( ID_Multa INTEGER PRIMARY KEY, fk_Aluno_Matricula_Aluno INTEGER, Valor DECIMAL(10,2), Data_Multa DATE, Status_Pagamento VARCHAR(20), -- "Pendente", "Pago" FOREIGN KEY (fk_Aluno_Matricula_Aluno) REFERENCES Aluno (Matricula_Aluno) ON DELETE CASCADE );

ALTER TABLE AlunoLivro ADD CONSTRAINT FK_AlunoLivro_Aluno FOREIGN KEY (fk_Aluno_Matricula_Aluno) REFERENCES Aluno (Matricula_Aluno) ON DELETE CASCADE;

ALTER TABLE AlunoLivro ADD CONSTRAINT FK_AlunoLivro_Livro FOREIGN KEY (fk_Livro_ID_Livro) REFERENCES Livro (ID_Livro) ON DELETE CASCADE;

ALTER TABLE Multa ADD CONSTRAINT FK_Multa_Aluno FOREIGN KEY (fk_Aluno_Matricula_Aluno) REFERENCES Aluno (Matricula_Aluno) ON DELETE CASCADE;
