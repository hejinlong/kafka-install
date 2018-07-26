# Kafka Install

One-click installation of Kafka cluster.

## Version List:
* java:1.8.0_131
* zookeeper:3.4.12
* kafka:2.12-1.1.1

## Installation Steps:

### 1.Edit the cluster server host (write to the corresponding IP)
```
vim /etc/hosts
192.168.253.130 server1
192.168.253.131 server2
192.168.253.132 server3
```

### 2.Run the installation script (there is only one parameter, which is 1, 2, 3,  represents the corresponding server id)
```
chmod +x install.sh 
./install.sh 1
```
> 1 is to install server1, 2 is to install server2, 3 is to install server3

Email:hello21st@gmail.com