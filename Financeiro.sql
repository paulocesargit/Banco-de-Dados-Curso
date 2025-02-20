CREATE TABLE AlunoFinanceiro ( ID_Financeiro INTEGER PRIMARY KEY, fk_Aluno_Matricula_Aluno INTEGER, Valor_Mensalidade DECIMAL(10,2), Data_Vencimento DATE, Status_Pagamento VARCHAR(20), -- "Pago", "Pendente", "Atrasado" Metodo_Pagamento VARCHAR(30), FOREIGN KEY (fk_Aluno_Matricula_Aluno) REFERENCES Aluno (Matricula_Aluno) ON DELETE CASCADE );

CREATE TABLE Pagamento ( ID_Pagamento INTEGER PRIMARY KEY, fk_Financeiro_ID_Financeiro INTEGER, Data_Pagamento DATE, Valor_Pago DECIMAL(10,2), Metodo_Pagamento VARCHAR(30), FOREIGN KEY (fk_Financeiro_ID_Financeiro) REFERENCES AlunoFinanceiro (ID_Financeiro) ON DELETE CASCADE );

CREATE TABLE ProfessorSalario ( ID_Salario INTEGER PRIMARY KEY, fk_Professor_ID_Professor INTEGER, Salario_Base DECIMAL(10,2), Bonus DECIMAL(10,2), Descontos DECIMAL(10,2), Salario_Liquido DECIMAL(10,2), Data_Pagamento DATE, FOREIGN KEY (fk_Professor_ID_Professor) REFERENCES Professor (ID_Professor) ON DELETE CASCADE );

CREATE TABLE TransacaoFinanceira ( ID_Transacao INTEGER PRIMARY KEY, Tipo_Transacao VARCHAR(20), -- "Receita" ou "Despesa" Valor DECIMAL(10,2), Data_Transacao DATE, Descricao VARCHAR(255) );

ALTER TABLE AlunoFinanceiro ADD CONSTRAINT FK_AlunoFinanceiro_Aluno FOREIGN KEY (fk_Aluno_Matricula_Aluno) REFERENCES Aluno (Matricula_Aluno) ON DELETE CASCADE;

ALTER TABLE Pagamento ADD CONSTRAINT FK_Pagamento_Financeiro FOREIGN KEY (fk_Financeiro_ID_Financeiro) REFERENCES AlunoFinanceiro (ID_Financeiro) ON DELETE CASCADE;

ALTER TABLE ProfessorSalario ADD CONSTRAINT FK_ProfessorSalario_Professor FOREIGN KEY (fk_Professor_ID_Professor) REFERENCES Professor (ID_Professor) ON DELETE CASCADE;
