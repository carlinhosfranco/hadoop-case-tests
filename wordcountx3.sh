#Script para executar as aplicações Hadoop
#Criado por: Carlos Alberto Franco Maron - 16/12/16
#Última atualização: Carlos - 16/12/16

HADOOP_DIR="/opt/hadoop/hadoop-2.7.3"
HADOOP_EXAMPLES="../share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.3.jar"
HADOOP_BIN="./hadoop jar"
LOG_DIR=/home/logs



        echo "----------------------------------------" >> $LOG_DIR/wordcountx3.log
        echo " " >> $LOG_DIR/wordcountx3.log
        echo Start in `date +%H:%M:%S--%d/%m/%Y` >> $LOG_DIR/wordcountx3.log

	$HADOOP_BIN $HADOOP_EXAMPLES wordcount base base_output 2>&1>> $LOG_DIR/app_wordcountx3.log
        ./hdfs dfs -rm -r -f  base_output >> $LOG_DIR/app_wordcountx3.log

        sleep 3
	
	echo End in `date +%H:%M:%S--%d/%m/%Y` >> $LOG_DIR/wordcountx3.log
        echo " " >> $LOG_DIR/wordcountx3.log
        echo "----------------------------------------" >> $LOG_DIR/wordcountx3.log

echo End Wordcount --- `date +%H:%M:%S--%d/%m/%Y` >> ./log_kill
