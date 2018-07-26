#!/bin/sh
#-------------------------------
#author:Jinlong              -              -
#email:he-jinlong@qq.com -
#-------------------------------
echo -e "\033[32m{`date`}[Start] Initialize the installation.............................\033[0m"
if [ ! $1 ]
then
    echo -e "\033[32m{`date`}Please enter the number 1, 2, 3..............................\033[0m"
    exit 1
elif [ $1 -lt 1 ]
then
    echo -e "\033[32m{`date`}The number cannot be less than 1............................\033[0m"
    exit 2
elif [ $1 -gt 3 ]
then
    echo -e "\033[32m{`date`}The number cannot be greater than 3.............................\033[0m"
    exit 3
fi
cat host.conf >> /etc/hosts
cat sysctl.txt >> /etc/sysctl.conf
/sbin/sysctl -p
cat limits.txt >> /etc/security/limits.conf
echo -e "\033[32m{`date`}[End] Initialize the installation.............................\033[0m"
echo -e "\033[32m{`date`}[Start] Download Java8.............................\033[0m"
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
echo -e "\033[32m{`date`}[End] Download Java8.............................\033[0m"
echo -e "\033[32m{`date`}[Start] Install Java8.............................\033[0m"
chmod +x jdk-8u131-linux-x64.rpm 
rpm -ivh jdk-8u131-linux-x64.rpm
cat java.conf >> /etc/profile
source /etc/profile
java -version
echo -e "\033[32m{`date`}[End] Install Java8.............................\033[0m"
echo -e "\033[32m{`date`}[Start] Download Zookeeper.............................\033[0m"
http://mirror.bit.edu.cn/apache/zookeeper/stable/zookeeper-3.4.12.tar.gz
echo -e "\033[32m{`date`}[End] Download Zookeeper.............................\033[0m"
echo -e "\033[32m{`date`}[Start] Install Zookeeper.............................\033[0m"
tar -zxvf zookeeper-3.4.12.tar.gz 
mv zookeeper-3.4.12 /usr/local/zookeeper
mkdir /home/data/zookeeper
echo $1 > /home/data/zookeeper/myid
mv zoo.cfg /usr/local/zookeeper/conf/
nohup /usr/local/zookeeper/bin/zkServer.sh start >/dev/null 2>&1 &
echo -e "\033[32m{`date`}[End] Install Zookeeper.............................\033[0m"
echo -e "\033[32m{`date`}[Start] Download Kafka.............................\033[0m"
wget http://mirrors.hust.edu.cn/apache/kafka/1.1.1/kafka_2.12-1.1.1.tgz
echo -e "\033[32m{`date`}[End] Download Kafka.............................\033[0m"
echo -e "\033[32m{`date`}[Start] Install Kafka.............................\033[0m"
tar -zxvf kafka_2.12-1.1.1.tgz 
mv kafka_2.12-1.1.1 /usr/local/kafka
mkdir /home/data/kafka
mv -f server$1.properties /usr/local/kafka/config/server.properties
nohup /usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties >/dev/null 2>&1 &
echo -e "\033[32m{`date`}[End] Install Kafka.............................\033[0m"
