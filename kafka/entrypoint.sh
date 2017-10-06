#!/bin/bash

host_id=$(cat /etc/hostname | sed -E "s:kf-([0-9]+):\1:")
KF_ID=$((host_id))

if [ -f /kflog/$ZK_ID ] 
then
    rm /kflog/$ZK_ID
fi

echo "log4j.appender.kafkaAppender.File=/kflog/$KF_ID/server.log" >> $KAFKA_HOME/config/log4j.properties 

exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties --override broker.id=$KF_ID

