#!/bin/bash
#Script para executar as aplicações Hadoop
#Criado por: Carlos Alberto Franco Maron - 16/12/16
#Última atualização: Carlos - 16/12/16

HADOOP_DIR="/opt/hadoop/hadoop-2.7.3"
HADOOP_EXAMPLES="../share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.3.jar"
HADOOP_BIN="./hadoop jar"
LOG_DIR=/home/logs
rm -rf log_kill
touch log_kill
sleep 2
LOG_KILL_IFSTAT=`wc -l log_kill | awk -F" " '{ print $1 }'`


hdfsio(){
        echo "----------------------------------------" >> $LOG_DIR/hdfsio.log
        echo " " >> $LOG_DIR/hdfsio.log
        echo Start in `date +%H:%M:%S--%d/%m/%Y` >> $LOG_DIR/hdfsio.log
	./exec_ifstat.sh hdfsio&

 	./hadoop jar ../share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.7.3-tests.jar TestDFSIO -write -nrFiles 48 -fileSize 512 2>&1>> $LOG_DIR/app_hdfsio.log
        sleep 3
        echo End in `date +%H:%M:%S--%d/%m/%Y` >> $LOG_DIR/hdfsio.log
	

	PID_KILL=`cat ./pid.txt`
        kill -9 $PID_KILL
	
	echo " " >> $LOG_DIR/hdfsio.log
        echo "----------------------------------------" >> $LOG_DIR/hdfsio.log

}


parallelx2(){

	echo "----------------------------------------" >> $LOG_DIR/parallelx2.log
        echo " " >> $LOG_DIR/parallelx2.log
        echo Start in `date +%H:%M:%S--%d/%m/%Y` >> $LOG_DIR/parallelx2.log
        ./exec_ifstat.sh parallelx2&

        #echo $LOG_KILL_IFSTAT   

        ./hdfsiox2-1.sh&
	sleep 30
	./hdfsiox2-2.sh&

while :
do
        #echo $LOG_KILL_IFSTAT
        if [ "$LOG_KILL_IFSTAT" -lt 2 ]
        then
                sleep 5
                LOG_KILL_IFSTAT=`wc -l log_kill | awk -F" " '{ print $1 }'`
        else

                PID_KILL=`cat ./pid.txt`

                kill -9 $PID_KILL
                echo End in `date +%H:%M:%S--%d/%m/%Y` >> $LOG_DIR/parallelx2.log

                echo " " >> $LOG_DIR/parallelx2.log
                echo "----------------------------------------" >> $LOG_DIR/parallelx2.log
		rm -rm log_kill
                break
        fi
done
	
}

parallelx3(){

        echo "----------------------------------------" >> $LOG_DIR/parallelx3.log
        echo " " >> $LOG_DIR/parallelx3.log
        echo Start in `date +%H:%M:%S--%d/%m/%Y` >> $LOG_DIR/parallelx3.log
        ./exec_ifstat.sh parallelx3&

        #echo $LOG_KILL_IFSTAT   

        ./hdfsiox3-1.sh&
	sleep 30
	./hdfsiox3-2.sh&
	sleep 30
	./hdfsiox3-3.sh&

while :
do
        echo $LOG_KILL_IFSTAT
        if [ "$LOG_KILL_IFSTAT" -lt 3 ]
        then
                sleep 5
                LOG_KILL_IFSTAT=`wc -l log_kill | awk -F" " '{ print $1 }'`
        else

                PID_KILL=`cat ./pid.txt`

                kill -9 $PID_KILL
                echo End in `date +%H:%M:%S--%d/%m/%Y` >> $LOG_DIR/parallelx3.log

                echo " " >> $LOG_DIR/parallelx3.log
                echo "----------------------------------------" >> $LOG_DIR/parallelx3.log
		rm -rm log_kill
                break
        fi
done

}	


#hdfsio
#sleep 2
#parallelx2
#sleep 2
parallelx3

