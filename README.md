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

| ID Produto | Tipo | Atributo 1 | Atributo 2 | Atributo 3 |
| ---------- | ---- | ---------- | ---------- | ---------- |
| 1 | ID Livro | Odisséia | Homnero | 1871 |
| 2 | ID Album | 6 Partitas | Bach |
| 2 | ID Album: ID Faixa | Partita No. 1 |
| 3 | ID Filme | A Criança | Drama, Comédia | Charles Chaplin |

Sendo o **ID Produto** a **Chave de Partição**, o **Tipo** a **Chave de indexação**, e os **Atrbituos 1, 2 e 3** os **Atributos** de cada entrada.

*Créditos: AWS - Definição de Banco de Dados Chave Valor*

Alguns exemplos de bancos de dados desse tipo são:
- Amazon DynamoDB
- Redis
- Aerospike

**Documentos**: esse tipo de banco de dados, armazena informações em documentos, que não são totalmente estruturados, como os bancos relacionais, permitindo assim que cada documento possua uma estrutura única, se necessário.

**Documento 1**
```json
{
   "id":"1", 
   "name":"John Smith", 
   "isActive":true, 
   "dob":"1964-30-08"
}
```

**Documento 2**
```json
{
   "id":"2", 
   "fullname":"Sarah Jones", 
   "isActive":false, 
   "dob":"2002-02-18"
}
```

**Documento 3**
```json
{
   "id":"3", 
   "fullname":
        {
            "first":"Adam",
            "last":"Stark"
        }, 
   "isActive":true,
   "dob":"2015-04-19"
}
```

Alguns exemplos de bancos de dados deste tipo são:
- MongoDB
- CouchDB
- RavenDB

**Grafos**: esse tipo de banco de dados, organiza os dados como nós e as conexões (conexão entre os nós), nos nós temos os dados, que tal como os bancos de dados de Documentos, são semi-estruturados, e as conexões guardam as relações entre os nós. Muito parecido com o que vemos nas redes sociais.

![Exemplo de Grafo](https://upload.wikimedia.org/wikipedia/commons/3/3a/GraphDatabase_PropertyGraph.png)

*Crédito: Wikipedia - Graph Databases*

Alguns exemplos de bancos de dados deste tipo são:
- Neo4j
- Apache Age
- Amazon Neptune
- Azure CosmosDB

**Coluna Larga**: esse tipo de banco de dados, organiza os dados em tabelas, linhas e colunas, mas não como um banco de dados relacional, cada linha tem sua própria estrutura de colunas.

![Exemplo de Coluna Larga](https://database.guide/wp-content/uploads/2016/06/wide_column_store_database_example_column_family-1.png)

*Crédito: database.guide*

Alguns exemplos de bancos de dados deste tipo são:
- Google Bigtable
- Apache Cassandra
- Apache Hbase

Muito bem, agora que já vimos um pouco sobre os tipos de Bancos de Dados que existem e um pouco de como estes funcionam, podemos avançar no nosso tópico.
## Bancos de Dados Relacionais na prática ##
Muito bem, agora que já falamos dos principais tipos de bancos de dados que temos, vamos focar no que melhor representa o que estamos falando, e alguns de seus princípios básicos, ou seja, falaremos de bancos de dados relacionais.

Como falamos antes, estes bancos de dados são constituídos de tabelas, tal como mostrado abaixo:
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

E estas tabelas podem se **relacionar**, tal como mostramos abaixo, que cada endereço, também possui o ID da Pessoa que ali mora.

**Tabela Endereço**
| ID | Rua | Número | Complemento | Bairro | Cidade | Estado | CEP | ID_Pessoa |
| -- | --- | ------ | ----------- | ------ | ------ | ------ | --- | --- |
| 01 | Rua D  | 01  | Apt. 01  | Vila Prudente | São Paulo | SP | 00000-000 | **03** |
| 02 | Rua A  | 10  | ---  | Vila Andrade | São Paulo | SP | 00000-000 | **02** |
| 03 | Rua X  | 42  | Torre Sul, Apt. 53  | Centro | São Paulo | SP | 00000-000 | **01** |

Pois bem, o que não falamos ainda, são alguns conceitos que ocorrem dentro de tabelas de bancos de dados relacionais

## Chave primária ##
Uma chave primária é um conceito básico em bancos de dados relacionais. Ela é composta por uma ou mais colunas em uma tabela que identifica exclusivamente cada registro na tabela. A chave primária é usada para garantir a integridade dos dados e garantir que não haja duplicação de registros.

Cada registro em uma tabela deve ter uma chave primária única e não nula, e os valores da chave primária devem ser diferentes para cada registro. As chaves primárias são usadas como referências para outras tabelas em um banco de dados relacionais e são usadas para garantir a integridade referencial.

Os principais tipos de chave primária são:

**Chave primária simples:** A chave primária simples é composta por uma única coluna em uma tabela. Por exemplo, em uma tabela de pessoas, a chave primária pode ser o cpf da pessoa, tal como mostrado abaixo:

**Tabela Pessoa**
| CPF | Nome | Sobrenome | Idade | Sexo |
| --- | ---- | --------- | ----- | ---- |
| **111.222.333-44** | José  | Silva  | 17  | Masculino  |
| **222.333.444-55** | Maria  | Lins  | 21  | Feminino  |
| **333.444.555-66** | Roberto  | Losada  | 53  | Masculino  |

No caso acima, temos uma chave primária simples, formada pelo CPF, pois este identifica unicamente cada Pessoa de nossa tabela, é **IMPORTANTE** ressaltar que chaves primárias não pode conter réplicas ou duplicatas no banco de dados, ou seja, estas são únicas, pois devem assim garantir a unicidade e integridade dos dados.

**Chave primária composta:** A chave primária composta é composta por duas ou mais colunas em uma tabela. Por exemplo, em uma tabela de pedidos, a chave primária pode ser composta pela combinação do número de pedido e do número de linha.

**Tabela Pedido**
| Numero_Pedido | Linha_Pedido | Numero_Item | Descricao_Item | Quantidade |
| ------------- | ------------ | ----------- | -------------- | ---------- |
| **00001** | **01** | 12345 | Parafuso Aço 16x3 | 3 |
| **00001** | **02** | 23456 | Rosca Aço 5x3 | 3 |
| **00001** | **03** | 34567 | Prego Anodizado 15x2 | 100 |
| **00002** | **01** | 12345 | Parafuso Aço 16x3 | 45 |
| **00002** | **02** | 34567 | Prego Anodizado 15x2 | 1000 |

Em chaves compostas a unicidade é encontrada, ao combinarmos os dois campos, o que garante que sempre tenhamos um número único identificando o registro.

**Chave primária artificial:** A chave primária artificial é uma criada pelo banco de dados em vez de usar uma chave natural. A chave primária artificial é útil quando não há uma coluna adequada na tabela para atuar como chave primária, ou quando a chave natural é muito grande ou complexa. Por exemplo, em uma tabela de clientes, o banco de dados pode criar uma chave primária artificial simplesmente atribuindo um número exclusivo a cada registro.

**Tabela Clientes**
| Cliente_PK | Numero_Cliente | Nome_Cliente | Agencia_Cliente | Conta_Cliente |
| ---------- | -------------- | ------------ | --------------- | ------------- |
| **001** | 9876 | Cliente 1 | Agência 1 | 12345 |
| **002** | 9877 | Cliente 2 | Agência 1 | 12346 |
| **003** | 9878 | Cliente 3 | Agência 2 | 12345 |
| **004** | 9879 | Cliente 4 | Agência 2 | 12346 |
| **005** | 9880 | Cliente 5 | Agência 3 | 12347 |

A chave primária aqui é criada para garantir a unicidade dos registros, e esta não é um campo do cliente, e sim um campo criado, existem várias formas de se criar essa chave, podendo a mesma ser sequêncial, ou um UUID (Universally Unique Identifier).

## Chave Estrangeira ##


## Estrutura da Linguagem SQL ##

Podemos estruturar a linguagem SQL em 5 subconjuntos de Linguagem, são estes:

- **DQL** (Data Query Language): define o comando de consulta de dados, a saber, o comando SELECT, que como o próprio nome diz, seleciona os dados nas fontes que queremos, alguns exemplos são:
- **DML** (Data Manipulation Language): define os comandos de manipulação do banco de dados (INSERT, UPDATE e DELETE)
- **DDL** (Data Definition Language): define os comandos para manipulação de tabelas, views, índices e atualização (CREATE, ALTER e DROP)
- **DCL** (Data Control Language): define os comandos de controle de acesso ao banco de dados (GRANT e REVOKE)
- **DTL** (Data Transaction Language): define os comandos de gestão das transações de bancos de dados (BEGIN, COMMIT e ROLLBACK)

## Exemplos de Códigos: ##

### *SELECT* ###
---

**1.** Buscar os dados de todas as colunas de uma tabela:
```sql
SELECT * FROM tabela; 
```
**2.** Buscar todos os dados de apenas uma coluna:
```sql
SELECT nome FROM tabela;
```
**3.** Buscar todos os dados de mais de uma coluna:
```sql
SELECT nome, sobrenome, endereço FROM tabela;
```
**4.** Buscar os dados de mais uma coluna sendo que uma das colunas venha ordenada em ascendente
```sql
SELECT matricula, nome, sobrenome, endereço FROM tabela ORDER BY matricula ASC;
```
**5.** Buscar os dados de mais uma coluna sendo que uma das colunas venha ordenada em descendente
```sql
SELECT matricula, nome, sobrenome, endereço FROM tabela ORDER BY matricula DESC;
```
**6.** Buscar os dados de uma coluna, porém garantindo que traga apenas valores únicos
```sql
SELECT DISTINCT(endereço) FROM tabela;
```
**7.** Buscar os dados de várias colunas mas que sejam maiores ou iguais à um determinado valor
```sql
SELECT matricula, nome, sobrenome FROM tabela WHERE matricula >= 1000;
```
**8.** Buscar os dados de várias colunas mas que sejam menores ou iguais à um determinado valor
```sql
SELECT matricula, nome, sobrenome FROM tabela WHERE matricula <= 1000;
```
**9.** Buscar os dados de várias colunas mas que sejam exatamente iguais à um determinado valor
```sql
SELECT matricula, nome, sobrenome FROM tabela WHERE matricula = 1000;
```
**10.** Buscar os dados de várias colunas mas que sejam seu valor esteja entre dois valores
```sql
SELECT matricula, nome, sobrenome FROM tabela WHERE matricula BETWEEN 500 AND 1000;
```
**11.** Buscar os dados de várias colunas, mas que possuam um valor texto específico
```sql
SELECT matricula, nome, sobrenome FROM tabela WHERE nome = 'Igor';
```
**12.** Buscar os dados de várias colunas, mas que contenham valores texto que estão em uma lista
```sql
SELECT matricula, nome, sobrenome FROM tabela WHERE nome IN ('Igor','Eric');
```
**13.** Buscar os dados de várias colunas, mas que contenham valores que comecem com um caractere
```sql
SELECT matricula, nome, sobrenome FROM tabela WHERE nome LIKE 'I%';
```
**14.** Buscar os dados de várias colunas, mas que contenham valores que não comecem com um caractere
```sql
SELECT matricula, nome, sobrenome FROM tabela WHERE nome NOT LIKE 'I%';
```
**15.** Buscar os dados de várias colunas, mas que contenham valores que não comecem com um caractere
```sql
SELECT matricula, nome, sobrenome FROM tabela WHERE nome NOT LIKE 'I%';
```
**16.** Buscar os dados de várias colunas, porém filtrando por mais de uma coluna
```sql
SELECT matricula, nome, sobrenome FROM tabela WHERE nome LIKE 'I%' AND matricula >= 1000;
```
**17.** Buscar os dados de várias colunas, porém filtrando apenas aqueles que possuem o campo desejado vazio
```sql
SELECT matricula, nome, sobrenome FROM tabela WHERE sobrenome IS NULL;
```
**18.** Buscar os dados de várias colunas, porém filtrando apenas aqueles que possuem o campo desejado não vazio
```sql
SELECT matricula, nome, sobrenome FROM tabela WHERE sobrenome IS NOT NULL;
```
**19.** Buscar os dados de várias colunas, porém filtrando apenas aqueles que possuem o campo desejado não vazio
```sql
SELECT matricula, nome, sobrenome FROM tabela WHERE sobrenome IS NOT NULL;
```
**20.** Somar todos os valores de uma coluna
```sql
SELECT SUM(salario) FROM tabela;
```
**21.** Realizar a média de todos os valores de uma coluna
```sql
SELECT AVG(salario) FROM tabela;
```
**22.** Achar o maior de todos os valores de uma coluna
```sql
SELECT MAX(salario) FROM tabela;
```
**23.** Achar o menor de todos os valores de uma coluna
```sql
SELECT MIN(salario) FROM tabela;
```
**24.** Contar o total de Matrículas que as pessoas tenham o mesmo primeiro nome
```sql
SELECT nome, COUNT(matricula) FROM tabela GROUP BY nome;
```
**25.** Contar o total de Matrículas que as pessoas tenham o mesmo primeiro nome que seja Igor ou Eric
```sql
SELECT nome, COUNT(matricula) FROM tabela WHERE nome IN ('Igor','Eric') GROUP BY nome;
```
**26.** Contar o total de Matrículas que as pessoas tenham o mesmo primeiro nome e que seja um total maior que 100
```sql
SELECT nome, COUNT(matricula) FROM tabela GROUP BY nome HAVING COUNT(matricula) > 100;
```
### *INSERT* ###
---
### *UPDATE* ###
---
### *DELETE* ###
---
### *CREATE* ###
---
### *ALTER* ###
---
### *DROP* ###
---