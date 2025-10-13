@echo off
setlocal

:: =================================================================================
:: CONFIGURACOES OBRIGATORIAS (ATENCAO: EDITE ESTES CAMINHOS PARA OS SEUS CAMINHOS REAIS!)
:: =================================================================================

:: 1. Caminho para a pasta 'bin' da sua instalacao do JMeter.
::    Exemplo: C:\apache-jmeter-5.6.3\bin
set "JMETER_BIN_DIR=C:\Users\Ozeas\Downloads\apache-jmeter-5.6.3\apache-jmeter-5.6.3\bin"

:: 2. Caminho raiz do seu projeto no VS Code (onde esta a pasta 'jmeter-scripts', 'test-results', etc.)
::    Exemplo: C:\Users\Ozeas\TesteOutSeraJmeter\Jmeter-1
set "PROJECT_ROOT_DIR=C:\Users\Ozeas\TesteOutSeraJmeter\Jmeter-1"

:: =================================================================================
:: NAO E NECESSARIO EDITAR ABAIXO DESTA LINHA
:: =================================================================================

echo.
echo ===================================================================
echo  Iniciando Preparacao para Teste de Performance JMeter
echo ===================================================================
echo.

:: Garante que as pastas de resultados existam
echo Verificando e criando pastas de resultados...
if not exist "%PROJECT_ROOT_DIR%\test-results\raw-jtl-files" (
    mkdir "%PROJECT_ROOT_DIR%\test-results\raw-jtl-files"
    echo Pasta criada: %PROJECT_ROOT_DIR%\test-results\raw-jtl-files
)
if not exist "%PROJECT_ROOT_DIR%\test-results\html-dashboards" (
    mkdir "%PROJECT_ROOT_DIR%\test-results\html-dashboards"
    echo Pasta criada: %PROJECT_ROOT_DIR%\test-results\html-dashboards
)
echo Pastas verificadas.

:: =================================================================================
:: CORRECAO: GERACAO DE TIMESTAMP UNICO PARA NOME DE ARQUIVO E PASTA
:: =================================================================================
:: Obter data e hora formatados para o nome da pasta e arquivo JTL de forma robusta (YYYYMMDD_HHMMSS)
for /f "usebackq tokens=2 delims==" %%a in (`wmic os get LocalDateTime /value ^| find "="`) do (
    set "DATETIME_RAW=%%a"
)
set "TIMESTAMP=%DATETIME_RAW:~0,8%_%DATETIME_RAW:~8,6%"
set "DASHBOARD_FOLDER_NAME=dashboard_run_%TIMESTAMP%"

:: Define os caminhos completos dos arquivos e diretorios que serao usados no comando JMeter
set "JMETER_JMX_FILE=%PROJECT_ROOT_DIR%\jmeter-scripts\jsonplaceholder_load_test.jmx"
:: CORRECAO: Arquivo JTL agora tera um nome unico com TIMESTAMP
set "JMETER_JTL_FILE=%PROJECT_ROOT_DIR%\test-results\raw-jtl-files\jsonplaceholder_results_%TIMESTAMP%.jtl"
set "JMETER_DASHBOARD_OUTPUT_DIR=%PROJECT_ROOT_DIR%\test-results\html-dashboards\%DASHBOARD_FOLDER_NAME%"

echo.
echo ===================================================================
echo  Detalhes da Execucao
echo ===================================================================
echo.
echo Caminho do JMeter BIN: %JMETER_BIN_DIR%
echo Arquivo JMX (Plano de Teste): %JMETER_JMX_FILE%
echo Arquivo JTL (Resultados Brutos - Unico): %JMETER_JTL_FILE%
echo Pasta de Saida do Dashboard HTML (Unica): %JMETER_DASHBOARD_OUTPUT_DIR%
echo.

:: Muda para o diretorio bin do JMeter para que o comando 'jmeter.bat' seja encontrado
:: PUSHD e POPD sao usados para voltar ao diretorio original automaticamente no final.
pushd "%JMETER_BIN_DIR%"
if %ERRORLEVEL% NEQ 0 (
    echo ERRO: Nao foi possivel mudar para o diretorio do JMeter: "%JMETER_BIN_DIR%"
    echo Verifique se o caminho JMETER_BIN_DIR esta correto no script.
    goto :eof
)

:: Verifica se o arquivo jmeter.bat existe no diretorio JMETER_BIN_DIR
if not exist "jmeter.bat" (
    echo ERRO: O arquivo 'jmeter.bat' nao foi encontrado em "%JMETER_BIN_DIR%".
    echo Verifique se a instalacao do JMeter esta correta e o caminho JMETER_BIN_DIR aponta para a pasta 'bin' do JMeter.
    popd
    goto :eof
)

echo.
echo ===================================================================
echo  Executando JMeter em Modo Nao-GUI...
echo  Isso pode levar alguns minutos (5 minutos de teste + tempo de ramp-up e geracao do relatorio).
echo ===================================================================
echo.

:: Executa o JMeter em modo non-GUI
:: CALL jmeter.bat e usado para garantir que o script .bat do JMeter seja executado corretamente
call jmeter.bat -n -t "%JMETER_JMX_FILE%" -l "%JMETER_JTL_FILE%" -e -o "%JMETER_DASHBOARD_OUTPUT_DIR%"

:: Volta para o diretorio original onde o .bat foi executado
popd

echo.
echo ===================================================================
echo  Teste de Performance JMeter Concluido!
echo ===================================================================
echo.
echo Verifique o relatorio HTML detalhado em:
echo %JMETER_DASHBOARD_OUTPUT_DIR%\index.html
echo.

pause
endlocal