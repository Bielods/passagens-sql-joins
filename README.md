Modelo Físico, Consultas SQL e Junções — Sistema de Passagens

📌 **Sobre o projeto**

Este repositório contém uma atividade prática desenvolvida para a disciplina de Banco de Dados, com o objetivo de praticar:

- Criação do **modelo físico** a partir das tabelas Cliente, Passagem e Rota;
- Definição de chaves primárias, chaves estrangeiras e restrições;
- Inserção de registros (mínimo 5 por tabela);
- Elaboração de consultas SQL envolvendo:
  - Seleção específica
  - Ordenação
  - Comparação de valores e strings (LIKE, BETWEEN, etc.)
  - **Junções (JOIN)** entre duas e três tabelas

🗂️ **Contexto do sistema**

O banco de dados simula um sistema simples de venda de passagens aéreas, contendo:

- **Cliente**: dados pessoais e endereço
- **Passagem**: informações da compra (valor, poltrona, cartão, etc.)
- **Rota**: número do voo e destino, vinculada a uma passagem

🏗️ **Estrutura das tabelas**

| Tabela     | Descrição                                              |
|------------|--------------------------------------------------------|
| cliente    | Dados dos clientes (código, nome, CPF, endereço)       |
| passagem   | Passagens compradas (número, valor, poltrona, cliente) |
| rota       | Rotas/voos vinculados a uma passagem                   |

⚙️ **O que o script .sql contempla**

1. Criação das três tabelas com chaves primárias e estrangeiras
2. Inserção de no mínimo 5 registros em cada tabela
3. 15 consultas SQL organizadas e comentadas, incluindo:
   - Filtros com LIKE, BETWEEN e condições compostas
   - Ordenação crescente e decrescente
   - Junções (JOIN) entre cliente + passagem e cliente + passagem + rota

🎓 **Finalidade**

Projeto exclusivamente acadêmico, desenvolvido como exercício de fixação sobre modelo físico e consultas SQL com junções, sem finalidade comercial.
