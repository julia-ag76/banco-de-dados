-- Conecte-se ao banco de dados (isso cria o arquivo de banco de dados automaticamente)
-- No SQLite, você não precisa usar CREATE DATABASE. Basta conectar-se a um arquivo.

-- Criação da tabela de departamentos
CREATE TABLE departamentos (
    id_departamento INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
);

-- Criação da tabela de funcionários
CREATE TABLE funcionarios (
    id_funcionario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cargo TEXT,
    salario REAL,
    id_departamento INTEGER,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

-- Criação da tabela de projetos
CREATE TABLE projetos (
    id_projeto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    id_departamento INTEGER,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

-- Inserção de dados na tabela departamentos
INSERT INTO departamentos (nome) VALUES 
('TI'),
('Recursos Humanos'),
('Financeiro');

-- Inserção de dados na tabela funcionarios
INSERT INTO funcionarios (nome, cargo, salario, id_departamento) VALUES
('João Silva', 'Analista de Sistemas', 5000.00, 1),
('Maria Oliveira', 'Gerente de RH', 7000.00, 2),
('Carlos Santos', 'Contador', 6000.00, 3),
('Ana Souza', 'Desenvolvedora', 5500.00, 1);

-- Inserção de dados na tabela projetos
INSERT INTO projetos (nome, id_departamento) VALUES
('Sistema de Gestão', 1),
('Reestruturação Organizacional', 2),
('Auditoria Financeira', 3);

-- Consulta com INNER JOIN para listar funcionários e seus departamentos
SELECT f.nome AS Funcionario, f.cargo, f.salario, d.nome AS Departamento
FROM funcionarios f
INNER JOIN departamentos d ON f.id_departamento = d.id_departamento;

-- Consulta com LEFT JOIN para listar todos os departamentos e seus projetos (mesmo que não tenham projetos)
SELECT d.nome AS Departamento, p.nome AS Projeto
FROM departamentos d
LEFT JOIN projetos p ON d.id_departamento = p.id_departamento;

-- Consulta com LEFT JOIN para listar todos os projetos e seus departamentos correspondentes
SELECT p.nome AS Projeto, d.nome AS Departamento
FROM departamentos d
LEFT JOIN projetos p ON d.id_departamento = p.id_departamento;