#!/bin/bash

# ZK_ID from env_var
# ZK_SERVERS from env_var

# set id
host_id=$(cat /etc/hostname | sed -E "s:zk-([0-9]+):\1:")
ZK_ID=$((host_id += 1))
echo "$ZK_ID" > $ZOO_DATA_DIR/myid

# set log path
mkdir -p /zklog/$ZK_ID
echo "zookeeper.log.dir=/zklog/$ZK_ID" >> $ZOO_CONF_DIR/log4j.properties
echo "zookeeper.tracelog.dir=/zklog/$ZK_ID" >> $ZOO_CONF_DIR/log4j.properties

IFS=',' read -r -a ZK_SERVER_ARRAY <<< "$ZK_SERVERS"

ZK_SERVER_CONFIG=
for idx in "${!ZK_SERVER_ARRAY[@]}"
do
    node_id=$(($idx+1))
    node_ip=${ZK_SERVER_ARRAY[idx]}

    if [ $node_id == $ZK_ID ]
    then
        node_ip=0.0.0.0
    fi

    ZK_SERVER_CONFIG="$ZK_SERVER_CONFIG"$'\n'"server.$node_id=$node_ip:2888:3888"
done

# append the config
echo "$ZK_SERVER_CONFIG" >> $ZOO_CONF_DIR/zoo.cfg

/bin/bash /zookeeper-3.4.10/bin/zkServer.sh start-foreground >> /zklog/$ZK_ID/zk.out
