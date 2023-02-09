# SQL Basics #

## Introdução ##
Como toda grande jornada, temos aqui o início de uma, falaremos da linguagem SQL (Structured Query Language), utilizada nos principais Bancos de Dados Relacionais que temos hoje no mundo.
Essa é a linguagem utilizada para criar, alterar e deletar tabelas em Bancos de Dados, também é com ela que faremos toda a manipulação dos dados dentro do nosso banco, faremos consultas, inserções, alterações, deleções e muito mais!

## Mas o que são Bancos de Dados? ##
Um Banco de Dados é uma coleção **organizada** de dados, estruturados ou não, normalmente armazenados em um sistema computacional.
A gestáo de uma Banco de Dados é feita por um **Sistema de Gestão de Bancos de Dados** também conhecido como **SGBD** ou **DBMS**, em inglês.

Bancos de Dados são separados em dois tipos básicos:

### SQL ### 
Também conhecidos como bancos de dados relacionais, são bancos de dados que são formados por tabelas, que contém linhas e colunas na sua estrutura, algo como o que mostramos abaixo:

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

Temos duas tabelas, uma com o nome das pessoas, e outra com o endereço, uma saída, não muito inteligente, seria criar um tabelão com todas as informações, porém isso nos causaria diversos problemas, dentre eles, dificuldade de manutenção, dificuldade em realizar alterações na estrutura da tabela, problemas de integridade e muito mais. Então como podemos resolver isso? Bem, podemos criar um relacionamento entre as tabelas, ou seja, usar um identificador que seja comum à ambas. Para isso, vamos considerar a seguinte relação, uma pessoa mora em um endereço, sendo assim, como cada pessoa possui um identificador único, o campo **ID**, ao invés de copiarmos todos os dados, simplesmente indicamos na tabela endereço qual o ID da pessoa que ali mora, tal como mostrado abaixo:

**Tabela Endereço**
| ID | Rua | Número | Complemento | Bairro | Cidade | Estado | CEP | ID_Pessoa |
| -- | --- | ------ | ----------- | ------ | ------ | ------ | --- | --- |
| 01 | Rua D  | 01  | Apt. 01  | Vila Prudente | São Paulo | SP | 00000-000 | **03** |
| 02 | Rua A  | 10  | ---  | Vila Andrade | São Paulo | SP | 00000-000 | **02** |
| 03 | Rua X  | 42  | Torre Sul, Apt. 53  | Centro | São Paulo | SP | 00000-000 | **01** |

Agora a última coluna da nossa tabela de endereço contém o ID da pessoa que mora naquele endereço, ou seja, criamos um relacionamento entre as tabelas, em outras palavras, as duas compartilham um campo, que as conecta e nos permite buscar mais dados sobre um dado registro.

Em bancos de dados relacionais, a linguagem utilizada para manipular os dados é a linguagem **SQL** (Structured Query Language), daqui a pouco, falaremos mais sobre isso.

Os principais bancos de dados relacionais no mercado são:
- Microsoft SQL Server
- Oracle Database Server
- MySQL (Oracle)
- PostgresQL
- Apache Ignite

### NoSQL ###

Outro tipo de Bancos de Dados que existe, e são largamente utilizados, são os bancos do tipo **NoSQL** (Not Only SQL), ao contrário dos bancos relacionais, esses bancos de dados não precisam estruturar os dados, uma vez que são altamente flexíveis quanto a sua forma de armazenagem, ou seja, eles não são estruturados. Mas o que isso quer dizer? Muito bem, em bancos relacionais, falamos de tabelas, o que obriga que todos os registros tenham a mesma estrutura ou seja, todos os campos, mesmo que vazios, mas devem possuir, tal como mostrado abaixo:

**Tabela Endereço**
| ID | Rua | Número | Complemento | Bairro | Cidade | Estado | CEP |
| -- | --- | ------ | ----------- | ------ | ------ | ------ | --- |
| 01 | Rua D  | 01  | Apt. 01  | Vila Prudente | São Paulo | SP | 00000-000 |
| 02 | Rua A  | 10  | ---  | Vila Andrade | São Paulo | SP | 00000-000 |
| 03 | Rua X  | 42  | Torre Sul, Apt. 53  | Centro | São Paulo | SP | 00000-000 |

Note que o endereço de ID 02 não possui o complemento, mesmo assim, o seu registro deve conter o campo complemento em sua estrutura, mesmo que vazio. No caso de Bancos de Dados NoSQL, isso não é necessário, a armazenagem ficaria mais ou menos assim:

```json
{
    "ID": 01,
    "Rua": "Rua D",
    "Número": 01,
    "Complemento": "Apt. 01",
    "Bairro": "Vila Prudente",
    "Cidade": "São Paulo",
    "Estado": "SP",
    "CEP": "00000-00"
}
{
    "ID": 02,
    "Rua": "Rua A",
    "Número": 10,
    "Bairro": "Vila Andrade",
    "Cidade": "São Paulo",
    "Estado": "SP",
    "CEP": "00000-00"
}
{
    "ID": 03,
    "Rua": "Rua X",
    "Número": 42,
    "Complemento": "Torre Sul, Apt. 53",
    "Bairro": "Centro",
    "Cidade": "São Paulo",
    "Estado": "SP",
    "CEP": "00000-00"
}
```
O registro númeto 02, não possui o complemento, e não há problema, pois em bancos NoSQL, sua estrutura é altamente flexível.
Diferente de bancos de dados realacionais, bancos de dados NoSQL, podem ser de 4 tipos:

**Chave-Valor**: esse é o tipo de banco de dados mais utilizado no mundo dos NoSQL, pois é extremamente simples de se utilizar e altamente confiável. Basicamente se utiliza uma chave (simples ou complexa) que nos permite buscar mais atributos do registro que queremos, um exemplo pode ser visto abaixo:

![Exemplo Chave-Valor](https://d1.awsstatic.com/product-marketing/DynamoDB/PartitionKey.8dd0530a7f6d66d101f31de30db515564f4cf28a.png)
*Créditos: AWS - Definição de Banco de Dados Chave Valor*

Alguns exemplos de bancos de dados desse tipo são:
- Amazon DynamoDB
- Redis
- Aerospike

**Documentos**:

**Grafos**:

**Coluna Larga**:

## Estrutura da Linguagem SQL ##

Podemos estruturar a linguagem SQL em 5 subconjuntos de Linguagem, são estes:

- **DQL** (Data Query Language): define o comando de consulta de dados (SELECT)
- **DML** (Data Manipulation Language): define os comandos de manipulação do banco de dados (INSERT, UPDATE e DELETE)
- **DDL** (Data Definition Language): define os comandos para manipulação de tabelas, views, índices e atualização (CREATE, ALTER e DROP)
- **DCL** (Data Control Language): define os comandos de controle de acesso ao banco de dados (GRANT e REVOKE)
- **DTL** (Data Transaction Language): define os comandos de gestão das transações de bancos de dados (BEGIN, COMMIT e ROLLBACK)