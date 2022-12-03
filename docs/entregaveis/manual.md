# Manual do Usuário

## Clonar o Repositório

Inicialmente, o repositório do projeto pode ser baixado em sua máquina usando o comando

```bash
# Caso use HTTPS
git clone https://github.com/izaiasmachado/TrabalhoBD-2022_2-NullBank.git

# Caso use SSH
git clone git@github.com:izaiasmachado/TrabalhoBD-2022_2-NullBank.git
```

Entre na pasta do projeto

```bash
cd TrabalhoBD-2022_2-NullBank
```

## Árvore de diretórios

Utilize essa árvore para identificar a localização dos arquivos do projeto.

```bash
.
├── LICENSE
├── README.md
├── docker-compose.yml
├── docs
│   ├── dev
│   └── entregaveis
│   │   ├── especificacoes.md
│   │   └── manual.md
├── pdfs
│   ├── especificacoes.pdf
│   ├── manual.pdf
│   └── modelagem.pdf
├── src
│   ├── client
│   ├── server
│   └── sql
└── vendor
    └── roteiro-nullbank-v2.pdf
```

## Dependências

Para rodar o projeto, é necessário instalar todas as dependências do documento de especificações. Faça isso antes de prosseguir para as próximas etapas.

## Subir o Banco de Dados

Para subir o banco de dados, execute o comando

```bash
docker-compose up -d
```

O banco MySQL deve ficar acessível em `http://localhost:3306`, com usuário `root` e senha `root`. Também é possível acessar o banco de dados pelo usuário `admin` e senha `root`. Essas informações podem ser alteradas no arquivo `docker-compose.yml`.

## Rodar Scripts SQL

Para rodar os scripts SQL, utilize um cliente MySQL de sua preferência. Os scripts SQL estão na pasta `src/sql` e devem ser executados na seguinte ordem:

1. `schema.sql`
2. `migrations.sql`
3. `triggers.sql`

Onde `schema.sql` cria o banco de dados e as tabelas, `migrations.sql` insere os dados de povoamento inicial e `triggers.sql` cria os gatilhos.

## Iniciar o Servidor

Navegue para a pasta do servidor

```bash
cd src/server
```

Instale as dependências do servidor

```bash
npm install
```

Crie um arquivo `.env` copiando o arquivo `.env.example`

```bash
cp .env.example .env # Linux e MacOS
copy .env.example .env # Windows
```

Certifique-se de que o arquivo `.env` foi criado corretamente e também que as informações de conexão com o banco de dados estão corretas nesse arquivo.

Com isso, o servidor pode ser iniciado com o comando

```bash
npm start
```

A API deve ficar acessível em `http://localhost:5001`. Caso queira mudar a porta do servidor, basta alterar a variável `PORT` no arquivo `.env`.

## Iniciar o Cliente

Abra um novo terminal e navegue até a raíz do projeto. Em seguida, navegue para a pasta do frontend

```bash
cd src/client
```

Instale as dependências do frontend e crie o arquivo de configuração

```bash
npm install
```

Com isso, o frontend pode ser iniciado com o comando

```bash
npm start
```

O frontend deve ficar acessível em `http://localhost:3000`.

## Encerrar Execuções

Para encerrar a execução do servidor e também do cliente, basta pressionar `Ctrl+C` no terminal onde o servidor está sendo executado.

Para encerrar a execução do banco de dados, execute o comando

```bash
docker-compose down
```
