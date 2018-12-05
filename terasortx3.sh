#!/bin/bash
#Script para executar as aplicações Hadoop
#Criado por: Carlos Alberto Franco Maron - 16/12/16
#Última atualização: Carlos - 16/12/16

HADOOP_DIR="/opt/hadoop/hadoop-2.7.3"
HADOOP_EXAMPLES="../share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.3.jar"
HADOOP_BIN="./hadoop jar"
LOG_DIR=/home/logs


	
	echo "----------------------------------------" >> $LOG_DIR/terasortx3.log
	echo " " >> $LOG_DIR/terasortx3.log
	echo Start in `date +%H:%M:%S--%d/%m/%Y` >> $LOG_DIR/terasortx3.log
	
	$HADOOP_BIN $HADOOP_EXAMPLES terasort ./teragen-10GB ./terasort-10GB 2>&1>> $LOG_DIR/app_terasortx3.log
	./hdfs dfs -rm -r -f  terasort-10GB >> $LOG_DIR/app_terasortx3.log
	
	sleep 3 
	
	echo " " >> $LOG_DIR/terasortx3.log
	echo "----------------------------------------" >> $LOG_DIR/terasortx3.log

echo End terasort --- `date +%H:%M:%S--%d/%m/%Y` >> ./log_kill
