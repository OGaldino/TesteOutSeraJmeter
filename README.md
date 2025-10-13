# Jmeter# Projeto de Testes de Performance

## Objetivo

Este projeto tem como objetivo avaliar a experiência com testes de performance e ferramentas de carga, como Apache JMeter. O foco está na criação, execução e análise de um teste de carga básico em uma API pública.

## Estrutura do Projeto

- **`jmeter-scripts/`**: Contém os scripts JMeter (.jmx) e documentação relacionada.
- **`test-results/`**: Armazena os resultados brutos (.jtl), dashboards HTML e screenshots dos testes.
- **`docs/`**: Contém o relatório final de análise dos testes de performance.

## Tarefas

### Tarefa 1: Teste de Carga Básico com JMeter

- **Ferramenta:** Apache JMeter
- **API Alvo:** JSONPlaceholder (`https://jsonplaceholder.typicode.com/posts`)
- **Configuração:** 500 usuários simultâneos por 5 minutos.
- **Local do Script:** `jmeter-scripts/jsonplaceholder_load_test.jmx`

### Tarefa 2: Geração de Relatório e Análise

- **Local do Relatório:** `docs/Performance_Test_Report.md`

## Como Iniciar

1.  **Pré-requisitos:** Certifique-se de ter o [Apache JMeter](https://jmeter.apache.org/download_jmeter.cgi) e o [JDK](https://www.oracle.com/java/technologies/downloads/) instalados e configurados.
2.  **Clonar o Repositório:**
    ```bash
    git clone https://github.com/OGaldino/Jmeter.git
    cd performance-testing-project
    ```
3.  **Configurar o JMeter:** Abra o script `.jmx` em `jmeter-scripts/` com o JMeter para revisão.
4.  **Executar o Teste:** Siga as instruções em `jmeter-scripts/README.md` para executar o teste de carga em modo non-GUI.
5.  **Analisar e Documentar:** Consulte `docs/Performance_Test_Report.md` para a estrutura do relatório e preencha com sua análise.