-- Inserts da Tabela escola
INSERT INTO escola (nome_escola) VALUES 
    ("Escola do Sítio do Pica Pau Amarelo"),
    ("Escola do Braz Cubas"),
    ("Escola da Terra do Nunca"),
    ("Escola Cabana do Pai Tomás");

-- Inserts da Tabela aluno
INSERT INTO aluno (nome_aluno, nome_do_meio_aluno, sobrenome_aluno, numero_serie) VALUES
    ('João', 'Silva', 'Santos', 1),
    ('Maria', 'Ferreira', 'Oliveira', 1),
    ('Lucas', 'Santos', 'Souza', 1),
    ('Ana', 'Carla', 'Silva', 1),
    ('Pedro', 'Henrique', 'Ribeiro', 2),
    ('Mariana', 'Campos', 'Rodrigues', 2),
    ('Thiago', 'Alves', 'Costa', 2),
    ('Julia', 'Cardoso', 'Pereira', 2),
    ('Bruno', 'Fernandes', 'Nascimento', 3),
    ('Gabriela', 'Gonçalves', 'Gomes', 3),
    ('Paulo', 'José', 'Rocha', 3),
    ('Larissa', 'Souza', 'Pereira', 3),
    ('Rafael', 'Gomes', 'Barbosa', 4),
    ('Camila', 'Lima', 'Ferreira', 4),
    ('Leonardo', 'Martins', 'Costa', 4),
    ('Amanda', 'Silva', 'Oliveira', 4),
    ('Luciana', 'Pereira', 'Santos', 5),
    ('Felipe', 'Barbosa', 'Ribeiro', 5),
    ('Carla', 'Santana', 'Silva', 5),
    ('Raphael', 'Pereira', 'Lima', 5),
    ('Isabela', 'Nascimento', 'Gonçalves', 6),
    ('Daniel', 'Silva', 'Campos', 6),
    ('Beatriz', 'Fernandes', 'Pereira', 6),
    ('Vinicius', 'Costa', 'Rodrigues', 6),
    ('Natalia', 'Alves', 'Santos', 7),
    ('Guilherme', 'Oliveira', 'Rocha', 7),
    ('Fernanda', 'Gomes', 'Barbosa', 7),
    ('Arthur', 'Ribeiro', 'Lima', 7),
    ('Leticia', 'Silva', 'Souza', 8),
    ('Henrique', 'Martins', 'Costa', 8);

-- Inserts da Tabela professor
INSERT INTO professor (nome_professor, nome_do_meio_professor, sobrenome_professor) VALUES 
    ('Pedro', 'Henrique', 'Silva'),
    ('Maria', 'Aparecida', 'Souza'),
    ('Lucas', 'Fernando', 'Santos'),
    ('Ana', NULL, 'Pereira'),
    ('Paula', 'Carla', 'Rodrigues'),
    ('Thiago', 'de Souza', 'Oliveira'),
    ('Julia', NULL, 'Ribeiro'),
    ('Bruno', 'Ferreira', 'Silveira'),
    ('Gabriela', 'Araújo', 'Gomes'),
    ('Gustavo', 'Mendes', 'Lima'),
    ('Larissa', 'Costa', 'Martins'),
    ('Rafael', 'Barbosa', 'Nascimento'),
    ('Camila', 'Farias', 'Fernandes'),
    ('Leonardo', 'Pereira', 'Alves'),
    ('Amanda', 'Rocha', 'Ferreira');

-- Inserts da Tabela materia
INSERT INTO materia (nome_materia) VALUES 
    ('Matemática'),
    ('Português'),
    ('Inglês'),
    ('História'),
    ('Geografia'),
    ('Biologia'),
    ('Física'),
    ('Química'),
    ('Artes'),
    ('Educação Física'),
    ('Literatura'),
    ('Redação'),
    ('Ciências'),
    ('Informática');

-- Inserts da Tabela turma
INSERT INTO turma (id_escola, id_professor, id_aluno, id_materia) VALUES
    (),