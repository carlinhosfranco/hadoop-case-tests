# Hadoop Case Tests
Scripts utilizados para a pesquisa de avaliação do desempenho de rede com a agregação de links. Detalhes sobre esta pesquisa, os resultados alcançados e as discussões realizadas podem ser encontradas no artigo publicado na conferência [**HPCS-2017**](https://ieeexplore.ieee.org/document/8035136/).

Os *scripts* foram criados para executar de forma automatizada as aplicações Hadoop, com o objetivo de gerar cargas na rede da infraestrutura. Além disso, também foram criados *scripts* para coletar de forma automatizada as métricas de desempenho. 

## Descrição dos arquivos do diretório

Os principais *scripts* deste diretório são: `apps_run.sh`,`hadoop_run.sh` e dentro do diretório `ifstat`. O restante dos arquivos são opcionas e podem ser variados. 

### apps_run.sh

*Script* que gerencia o ambiente de teste, responsável por executar todos os outros *scripts* e iniciar/encerrar o monitoramento da rede. 

### hadoop_run.sh

Realiza as mesmas funções que o *script* `apps_run.sh`, porém com aplicações diferentes. 

### [ifstat/ifstat_run.sh](ifstat/ifstat_run.sh)

*Script* que gerencia o monitoramento das métricas de desempenho de rede. O *script* inicia o `ifstat`, coleta e converte as métricas de desempenho, salvando os resultados em um arquivo de log.
