FROM centos:7
WORKDIR /root
COPY ./openssl-1.0.2k.tar.gz /root/
RUN yum update -y && \
    yum install wget.x86_64 perl-core make gcc -y 
RUN tar -xzvf openssl-1.0.2k.tar.gz
WORKDIR /root/openssl-1.0.2k
RUN ./config --prefix=/opt/openssl --openssldir=/usr/local/ssl
RUN make && \
    make install
RUN cp -a /opt/openssl/bin/openssl /bin/openssl && \
    rm -rf /root/*
WORKDIR /root