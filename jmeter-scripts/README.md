# Scripts JMeter

Este diretório contém os scripts do Apache JMeter utilizados neste projeto.

## `jsonplaceholder_load_test.jmx`

Este é o script principal para o teste de carga na API JSONPlaceholder.

**Detalhes do Teste:**
- **API Alvo:** `https://jsonplaceholder.typicode.com/posts`
- **Cenário:** Requisições GET para o endpoint `/posts`.
- **Configuração:** 500 usuários virtuais, ramp-up de 100 segundos, duração total de 5 minutos.

### Como Executar

1.  **PowerShell:**
    ```PowerShell
   ./run_jmeter_test.bat
    ```

### Pós-Execução

Após a execução, o arquivo `.jtl` (resultados brutos) e o dashboard HTML completo estarão disponíveis nos diretórios `test-results/raw-jtl-files/` e `test-results/html-dashboards/`, respectivamente.