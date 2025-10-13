# Relatório de Teste de Carga - API JSONPlaceholder

## 1. Introdução

Este documento apresenta a análise dos resultados de um teste de carga realizado na API pública JSONPlaceholder, com o objetivo de avaliar a experiência na utilização da ferramenta Apache JMeter para testes de performance.

## 2. Configuração do Teste

### 2.1. Ferramentas Utilizadas
- **Ferramenta de Carga:** Apache JMeter 5.6.3
- **Outras Ferramentas:** VS Code, Git

### 2.2. Ambiente de Teste
- **API Alvo:** JSONPlaceholder (`https://jsonplaceholder.typicode.com/posts`)

### 2.3. Cenário de Teste
- **Cenário:** Simulação de requisições GET ao endpoint `/posts`.
- **Configuração do Thread Group:**
    - **Usuários Virtuais:** 500
    - **Período de Ramp-up:** 100 segundos
    - **Duração do Teste:** 5 minutos (300 segundos)
