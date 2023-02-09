# SQL Basics #

## Introdução ##
Como toda grande jornada, temos aqui o início de uma, falaremos da linguagem SQL (Structured Query Language), utilizada nos principais Bancos de Dados Relacionais que temos hoje no mundo.
Essa é a linguagem utilizada para criar, alterar e deletar tabelas em Bancos de Dados, também é com ela que faremos toda a manipulação dos dados dentro do nosso banco, faremos consultas, inserções, alterações, deleções e muito mais!

## Mas o que são Bancos de Dados? ##
Um Banco de Dados é uma coleção **organizada** de dados, estruturados ou não, normalmente armazenados em um sistema computacional.
A gestáo de uma Banco de Dados é feita por um **Sistema de Gestão de Bancos de Dados** também conhecido como **SGBD** ou **DBMS**, em inglês.

Bancos de Dados são separados em dois tipos básicos:

- **SQL**: também conhecidos como bancos de dados relacionais, são bancos de dados que são formados por tabelas, que contém linhas e colunas na sua estrutura, algo como o que mostramos abaixo:

| Coluna 1 | Coluna 2 | Coluna 3 | Coluna 4 |
| -------- | -------- | -------- | -------- |
| Linha 1  | Linha 1  | Linha 1  | Linha 1  |
| Linha 2  | Linha 2  | Linha 2  | Linha 2  |
| Linha 3  | Linha 3  | Linha 3  | Linha 3  |

Cada Linha é um **Registro** ou **Tupla**, as Colunas são dos dados da Tupla. Normalmente, e por melhores práticas, os dados dentro das colunas de um registro, devem caracterizar o registro, ou seja:

| Nome | Sobrenome | Idade | Sexo |
| ---- | --------- | ----- | ---- |
| José  | Silva  | 17  | Masculino  |
| Maria  | Lins  | 21  | Feminino  |
| Roberto  | Losada  | 53  | Masculino  |

Notem que em cada registro, temos dados sobre o elemento sendo descrito que o caracteriza.
Agora que já entendemos a estrutura de um banco de dados SQL, temos que explicar o porque os chamamos de Relacionais, como o próprio nome diz, são bancos de dados em que suas tabelas possuem **relacionamentos**, ou seja, estão conectadas à outras tabelas por uma coluna, vamos a um exemplo:

**Tabela Pessoa**
| ID | Nome | Sobrenome | Idade | Sexo |
| -- | ---- | --------- | ----- | ---- |
| 01 | José  | Silva  | 17  | Masculino  |
| 02 | Maria  | Lins  | 21  | Feminino  |
| 03 | Roberto  | Losada  | 53  | Masculino  |

**Tabela Endereço**
| ID | Rua | Número | Complemento | Bairro | Cidade | Estado | CEP |
| -- | --- | ------ | ----------- | ------ | ------ | ------ | --- |
| 01 | Rua D  | 01  | Apt. 01  | Vila Prudente | São Paulo | SP | 00000-000 |
| 02 | Rua A  | 10  | ---  | Vila Andrade | São Paulo | SP | 00000-000 |
| 03 | Rua X  | 42  | Torre Sul, Apt. 53  | Centro | São Paulo | SP | 00000-000 |

Temos duas tabelas, uma com o nome das pessoas, e outra com o endereço, uma saída, não muito inteligente, seria criar um tabelão com todas as informações, porém isso nos causaria diversos problemas.

- **NoSQL**:

## Estrutura da Linguagem SQL ##

Podemos estruturar a linguagem SQL em 5 subconjuntos de Linguagem, são estes:

- **DQL** (Data Query Language): define o comando de consulta de dados (SELECT)
- **DML** (Data Manipulation Language): define os comandos de manipulação do banco de dados (INSERT, UPDATE e DELETE)
- **DDL** (Data Definition Language): define os comandos para manipulação de tabelas, views, índices e atualização (CREATE, ALTER e DROP)
- **DCL** (Data Control Language): define os comandos de controle de acesso ao banco de dados (GRANT e REVOKE)
- **DTL** (Data Transaction Language): define os comandos de gestão das transações de bancos de dados (BEGIN, COMMIT e ROLLBACK)