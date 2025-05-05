CREATE DATABASE IF NOT EXISTS db_sistema_faculdade;
USE db_sistema_faculdade;

CREATE TABLE tbl_curso (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(100),
    duracao INT
);

CREATE TABLE tbl_aluno (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(100),
    cpf CHAR(11) UNIQUE,
    data_nascimento DATE,
    matricula INT
);

CREATE TABLE tbl_telefone (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    numero_telefone VARCHAR(20),
    id_aluno INT,
    FOREIGN KEY (id_aluno) REFERENCES tbl_aluno(id)
);

CREATE TABLE tbl_email (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    email VARCHAR(100),
    id_aluno INT,
    FOREIGN KEY (id_aluno) REFERENCES tbl_aluno(id)
);

CREATE TABLE tbl_disciplina (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(100),
    carga_horaria INT,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES tbl_curso(id)
);

CREATE TABLE tbl_professor (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(100),
    cpf CHAR(11) UNIQUE,
    especialidade VARCHAR(45)
);

CREATE TABLE tbl_turma (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    ano_semestre VARCHAR(10),
    sala VARCHAR(20),
    id_disciplina INT,
    FOREIGN KEY (id_disciplina) REFERENCES tbl_disciplina(id)
);

CREATE TABLE tbl_leciona (
    id_turma INT,
    id_professor INT,
    PRIMARY KEY (id_turma, id_professor),
    FOREIGN KEY (id_turma) REFERENCES tbl_turma(id),
    FOREIGN KEY (id_professor) REFERENCES tbl_professor(id)
);

CREATE TABLE tbl_matricula (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    data_matricula DATE,
    nota_prova DECIMAL(5,2),
    nota_final DECIMAL(5,2),
    id_aluno INT,
    id_turma INT,
    FOREIGN KEY (id_aluno) REFERENCES tbl_aluno(id),
    FOREIGN KEY (id_turma) REFERENCES tbl_turma(id)
);
