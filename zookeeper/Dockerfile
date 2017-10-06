FROM zookeeper:3.4.10

COPY conf/* /conf/

CMD ["mkdir", "/zklog", "/datalog", "/data"]

# install timezone data
RUN apk update && apk add tzdata

# run zk
ADD entrypoint.sh /entrypoint.sh 
RUN chmod +x /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
