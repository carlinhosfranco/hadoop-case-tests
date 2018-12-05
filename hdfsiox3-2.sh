#!/bin/bash
#Script para executar as aplicações Hadoop
#Criado por: Carlos Alberto Franco Maron - 16/12/16
#Última atualização: Carlos - 16/12/16

HADOOP_DIR="/opt/hadoop/hadoop-2.7.3"
HADOOP_EXAMPLES="../share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.3.jar"
HADOOP_BIN="./hadoop jar"
LOG_DIR=/home/logs


	
	echo "----------------------------------------" >> $LOG_DIR/hdfsiox3-2.log
	echo " " >> $LOG_DIR/hdfsiox3-2.log
	echo Start in `date +%H:%M:%S--%d/%m/%Y` >> $LOG_DIR/hdfsiox3-2.log

	./hadoop jar ../share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.7.3-tests.jar TestDFSIO -write -nrFiles 48 -fileSize 512 2>&1>> $LOG_DIR/app_hdfsiox3-2.log 
	sleep 1
	echo End in `date +%H:%M:%S--%d/%m/%Y` >> $LOG_DIR/hdfsiox3-2.log

	echo " " >> $LOG_DIR/hdfsiox3-2.log
	echo "----------------------------------------" >> $LOG_DIR/hdfsiox3-2.log

echo End HDFSIO --- `date +%H:%M:%S--%d/%m/%Y` >> ./log_kill
