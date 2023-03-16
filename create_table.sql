CREATE TABLE escola
(
	id_escola INT IDENTITY PRIMARY KEY, -- ID da Escola, número único que identifica a mesma, a propriedade IDENTITY, faz com que esse campo seja numérico incremental, a propriedade PRIMARY KEY, define esse campo como Chave Primária
	nome_escola VARCHAR(256) NOT NULL -- Nome da Escola, a propriedade NOT NULL, garante que esse campo não seja vazio
);

CREATE TABLE aluno
(
	id_aluno INT IDENTITY PRIMARY KEY, -- ID do Aluno, número único que identifica o mesmo, a propriedade IDENTITY, faz com que esse campo seja numérico incremental, a propriedade PRIMARY KEY, define esse campo como Chave Primária
	nome_aluno VARCHAR(32) NOT NULL, -- Primeiro Nome do Aluno, a propriedade NOT NULL, garante que esse campo não seja vazio
	nome_do_meio_aluno VARCHAR(32), -- Nome do meio do Aluno, a ausência da propriedade NOT NULL, permite que valores vazios sejam inseridos
	sobrenome_aluno VARCHAR(32) NOT NULL, -- Sobrenome do Aluno, a propriedade NOT NULL, garante que esse campo não seja vazio
	numero_serie INT CHECK (numero_serie BETWEEN -3 AND 12) -- Número da série, é um inteiro, a propriedade CHECK garante que o campo só contenha os valores entre -3 e 12, qualquer valor fora isso não é aceito
);

CREATE TABLE professor
(
	id_professor INT IDENTITY PRIMARY KEY, -- ID do Professor, número único que identifica o mesmo, a propriedade IDENTITY, faz com que esse campo seja numérico incremental, a propriedade PRIMARY KEY, define esse campo como Chave Primária
	nome_professor VARCHAR(32) NOT NULL, -- Primeiro Nome do Professor, a propriedade NOT NULL, garante que esse campo não seja vazio
	nome_do_meio_professor VARCHAR(32), -- Nome do meio do Professor, a ausência da propriedade NOT NULL, permite que valores vazios sejam inseridos
	sobrenome_professor VARCHAR(32) NOT NULL -- Sobrenome do Professor, a propriedade NOT NULL, garante que esse campo não seja vazio
);

CREATE TABLE materia
(
	id_materia INT IDENTITY PRIMARY KEY, -- ID da Matéria, número único que identifica o mesmo, a propriedade IDENTITY, faz com que esse campo seja numérico incremental, a propriedade PRIMARY KEY, define esse campo como Chave Primária
	nome_materia VARCHAR(64) NOT NULL, -- Nome da Matéria, a propriedade NOT NULL, garante que esse campo não seja vazio
);

CREATE TABLE turma
(
	id_turma INT IDENTITY PRIMARY KEY, -- ID do Turma, número único que identifica a mesma, a propriedade IDENTITY, faz com que esse campo seja numérico incremental, a propriedade PRIMARY KEY, define esse campo como Chave Primária
	id_escola INT, -- ID da escola, esse campo indica qual a escola a qual a turma pertence
	id_professor INT, -- ID do professor, esse campo indica qual o professor da turma
	id_aluno INT, -- ID do aluno, esse campo identifica o aluno que pertence à turma
	id_materia INT, -- ID da matéria da turma
	CONSTRAINT fk_id_escola FOREIGN KEY (id_escola) REFERENCES escola (id_escola), -- chave estrangeira que garante o relacionamento com os valores que existem na tabela escola
	CONSTRAINT fk_id_professor FOREIGN KEY (id_professor) REFERENCES professor (id_professor), -- chave estrangeira que garante o relacionamento com os valores que existem na tabela professor
	CONSTRAINT fk_id_aluno FOREIGN KEY (id_aluno) REFERENCES aluno (id_aluno), -- chave estrangeira que garante o relacionamento com os valores que existem na tabela aluno
	CONSTRAINT fk_id_materia FOREIGN KEY (id_materia) REFERENCES materia (id_materia) -- chave estrangeira que garante o relacionamento com os valores que existem na tabela materia
);
