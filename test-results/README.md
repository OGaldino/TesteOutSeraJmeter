# Resultados dos Testes de Performance

Este diretório contém os resultados da execução dos testes de carga.

## Estrutura

- **`raw-jtl-files/`**: Armazena os arquivos `.jtl` gerados pelo JMeter, que contêm os dados brutos de cada requisição.
- **`html-dashboards/`**: Contém os dashboards HTML interativos gerados a partir dos arquivos `.jtl`, fornecendo uma visão sumarizada e gráfica dos resultados.
- **`screenshots/`**: (Opcional) Pode ser usado para armazenar capturas de tela de gráficos ou seções específicas dos dashboards que você queira destacar no relatório.

## Como Visualizar os Resultados

1.  **Dashboards HTML:** Após a execução do teste em modo não-GUI (conforme descrito em `jmeter-scripts/README.md`), um diretório com o dashboard HTML será criado em `html-dashboards/`. Abra o arquivo `index.html` dentro desse diretório no seu navegador para visualizar o relatório completo.

2.  **Arquivos .jtl:** Os arquivos `.jtl` podem ser abertos no JMeter em um `Listener` como `View Results Tree` ou `Aggregate Report` para uma análise mais detalhada (principalmente para depuração). Para isso, adicione o Listener desejado, e use o botão "Browse..." para carregar o arquivo `.jtl`.