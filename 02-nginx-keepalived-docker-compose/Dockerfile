FROM ubuntu:16.04

RUN apt-get update 

RUN apt-get install  curl ipvsadm iproute2 keepalived nginx -y 
    
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
