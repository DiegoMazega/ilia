# Projeto Ilia

Este repositório contém o código fonte para o Backend e o Mobile App do projeto User List.

## Estrutura do Projeto

- `backend/`: Contém a API Node.js/Express.
- `mobile/`: Contém o aplicativo Flutter.

---

## Decisões de Projeto

Abaixo estão listadas as principais escolhas técnicas e arquiteturais adotadas para o desenvolvimento deste projeto.

### Mobile

- **Gerenciamento de Estado (Cubit):** Foi escolhido o padrão Cubit por ser melhor para projetos de menor complexidade, oferecendo uma separação simples entre a lógica de negócios e a UI. O Cubit foca nas validações de requisições e emissão de estados.
- **Flutter Hooks:** Utilizado para simplificar a criação de componentes de formulário e gestão do ciclo de vida deles, mantendo-os mais fáceis de criar e desacoplados do Cubit. Isso deixa o Cubit responsável apenas pela lógica de negócios e comunicação com o repositório.
- **Testes:** Foram inseridos Testes Unitários e de Widget para garantir a integridade dos dados ao longo do uso e validar o comportamento de cada tela de forma isolada.

### Backend

- **Express:** Utilizado para a criação dos controllers e gerenciamento de rotas.
- **Zod:** Adotado para a validação de schemas, garantindo que os dados recebidos estejam no formato correto.
- **Express Rate Limit:** Implementado para impedir que o usuário faça múltiplas requisições em um curto período de tempo, prevenindo o travamento do servidor.
- **Outras Ferramentas:**
  - **SQLite:** Banco de dados escolhido para salvar os dados de forma local enquanto o servidor estiver ativo.
  - **Morgan:** Para exibir logs de requisições HTTP.
  - **Cors:** Para controle de acesso HTTP.

---

## Backend

O backend é uma API REST construída com Node.js e Express, utilizando SQLite como banco de dados.

### Pré-requisitos

- Node.js (v18 ou superior recomendado)
- NPM (gerenciador de pacotes do Node)

### Instalação e Execução

1. Abra o terminal e navegue até a pasta do backend:

   ```bash
   cd backend/user_list
   ```

2. Instale as dependências:

   ```bash
   npm install
   ```

3. Inicie o servidor em modo de desenvolvimento:
   ```bash
   npm run dev
   ```

O servidor iniciará na porta **3000** (padrão) ou na porta definida no arquivo `.env`.
URL Base: `http://localhost:3000`

### Documentação da API

Todas as rotas da API são prefixadas com versionamento `/v1`.

#### 1. Criar Usuário

Cria um novo usuário no sistema.

- **Método:** `POST`
- **Rota:** `/v1/create-user`
- **Corpo da Requisição (JSON):**

  ```json
  {
    "name": "Nome Sobrenome",
    "email": "usuario@exemplo.com"
  }
  ```

  > **Nota:** O campo `name` deve conter pelo menos duas palavras (nome e sobrenome). O `email` deve ser um formato válido.

- **Respostas:**
  - **201 Created:** Usuário criado com sucesso.
    ```json
    {
      "id": "uuid-gerado",
      "name": "Nome Sobrenome",
      "email": "usuario@exemplo.com"
    }
    ```
  - **400 Bad Request:** Payload inválido (ex: nome incompleto ou email inválido).
    ```json
    {
      "error": "Ilia.user.invalid_payload",
      "details": [...]
    }
    ```
  - **409 Conflict:** Email já cadastrado.
    ```json
    {
      "error": "Ilia.user.email_already_exists"
    }
    ```

#### 2. Listar Usuários

Retorna a lista de todos os usuários cadastrados.

- **Método:** `GET`
- **Rota:** `/v1/users`
- **Respostas:**
  - **200 OK:** Lista de usuários.
    ```json
    [
      {
        "id": "uuid-1",
        "name": "Usuario 1",
        "email": "user1@example.com"
      },
      ...
    ]
    ```
  - **500 Internal Server Error:** Erro ao buscar usuários no banco de dados.

#### 3. Health Check

Verifica se a API está online.

- **Método:** `GET`
- **Rota:** `/health`
- **Resposta:**
  - **200 OK:**
    ```json
    { "status": "OK" }
    ```

### Exemplos de Requisições (cURL)

Abaixo estão exemplos de requisições que podem ser importadas no Postman, basta copiar e colar no campo da URl.

#### 1. Listar Usuários

```bash
curl --location 'http://localhost:3000/v1/users' \
--header 'Content-Type: application/json'
```

#### 2. Criar Usuário (Teste Com dados inválidos)

```bash
curl --location --request POST 'http://localhost:3000/v1/create-user' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "test",
    "email": "email"
}'
```

#### 3. Criar Usuário (Dados Válidos)

```bash
curl --location --request POST 'http://localhost:3000/v1/create-user' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "test test",
    "email": "email@test.com"
}'
```

#### 4. Teste de Segurança (Teste de Prevenção de SQL Injection)

```bash
curl --location --request POST 'http://localhost:3000/v1/create-user' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "Hacker'\''''); DROP TABLE users; -- Smith",
    "email": "hacker@test.com"
}'
```

---

## Mobile

### Pré-requisitos

- Flutter SDK instalado e configurado no PATH.
- Um emulador (Android/iOS) ou dispositivo físico conectado.

### Configuração de Rede (Importante)

Por padrão, o aplicativo tenta se conectar ao backend em `http://localhost:3000`. Dependendo de como você está rodando o app (emulador ou dispositivo físico), o `localhost` pode não funcionar corretamente, pois o `localhost` do dispositivo mobile não é o mesmo da sua máquina.

**Se tiver problemas de conexão (erro de conexão recusada ou timeout):**

1. Descubra o IP da sua máquina na rede local:
   - **Windows:** Abra o terminal (cmd ou PowerShell) e digite `ipconfig`. Procure pelo **Endereço IPv4** (ex: `192.168.1.15`).
   - **macOS/Linux:** Abra o terminal e digite `ifconfig` ou `ip a`.

2. Abra o arquivo de configuração no projeto mobile:
   Arquivo: `mobile/user_list/lib/modules/shared/config/ilia_base_endpoint.dart`

3. Atualize a constante `iliaBaseEndpoint`:
   - Encontre a linha:
     ```dart
     const iliaBaseEndpoint = 'http://localhost:3000';
     ```
   - Substitua `localhost` pelo seu IP. Exemplo:
     ```dart
     const iliaBaseEndpoint = 'http://192.168.1.15:3000';
     ```

### Instalação e Execução

1. Abra o terminal e navegue até a pasta do projeto mobile:

   ```bash
   cd mobile/user_list
   ```

2. Instale as dependências do Flutter:

   ```bash
   flutter pub get
   ```

3. Execute o aplicativo:
   ```bash
   flutter run
   ```
   > Se tiver múltiplos dispositivos conectados, use `flutter devices` para ver os IDs e rode `flutter run -d <device-id>`.
