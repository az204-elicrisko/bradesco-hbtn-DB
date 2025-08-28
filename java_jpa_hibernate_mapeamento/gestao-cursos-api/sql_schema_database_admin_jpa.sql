-- SQL Schema: sql_schema_database_admin.sql

-- Tabela Aluno
CREATE TABLE aluno (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
);

-- Tabela Endereco
CREATE TABLE endereco (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    aluno_id INTEGER NOT NULL,
    logradouro TEXT NOT NULL,
    numero TEXT,
    complemento TEXT,
    cidade TEXT,
    estado TEXT,
    cep TEXT,
    FOREIGN KEY (aluno_id) REFERENCES aluno(id)
);

-- Tabela Telefone
CREATE TABLE telefone (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    aluno_id INTEGER NOT NULL,
    numero TEXT NOT NULL,
    tipo TEXT,
    FOREIGN KEY (aluno_id) REFERENCES aluno(id)
);

-- Tabela Professor
CREATE TABLE professor (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
);

-- Tabela Curso
CREATE TABLE curso (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    professor_id INTEGER NOT NULL,
    material_id INTEGER UNIQUE,
    FOREIGN KEY (professor_id) REFERENCES professor(id),
    FOREIGN KEY (material_id) REFERENCES material(id)
);

-- Tabela Material
CREATE TABLE material (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    descricao TEXT NOT NULL
);

-- Tabela Aluno_Curso (Relacionamento N:N entre aluno e curso)
CREATE TABLE aluno_curso (
    aluno_id INTEGER NOT NULL,
    curso_id INTEGER NOT NULL,
    PRIMARY KEY (aluno_id, curso_id),
    FOREIGN KEY (aluno_id) REFERENCES aluno(id),
    FOREIGN KEY (curso_id) REFERENCES curso(id)
);
