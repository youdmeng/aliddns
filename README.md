# 阿里云ddns docker版

基于 risfeng/aliyun-ddns-shell **shell脚本** 同步更新 [github](https://github.com/risfeng/aliyun-ddns-shell)

## 项目路径结构


```
ddns
├─ config
│  └─ config.cfg
├─ docker-compose.yml
└─ Dockerfile

```

* ./config.cfg   阿里云解析配置文件

## 使用方法

### 一、docker-compose 运行

#### 1.1 config.cfg

```
var_check_online_url="www.baidu.com"
var_check_online_retry_times=3
var_first_level_domain="host.com"
var_second_level_domain="www"
var_domain_record_type="A"
var_domian_ttl="600"
var_access_key_id="12345"
var_access_key_secret="12345678"
var_local_wan_ip="curl -s http://members.3322.org/dyndns/getip"
var_domian_server_ip="nslookup"
var_enable_message_push=false
var_push_message_access_token=""
var_push_message_secret=""
```

* var_first_level_domain           域名
* var_second_level_domain     主机记录（www/@等）
* var_domain_record_type      记录类型 必须是A
* var_access_key_id                   阿里云accessKey
* var_access_key_secret           阿里云accessKeySecret

#### 1.2 docker-compose.yml

```
version: "3"
services:
    aliddns:
        image:  youdmeng/aliddns
        container_name: aliddns
        restart: always
        volumes: 
            - ./config:/etc/aliyun-ddns/
            - ./logs:/etc/logs/
        command: crond -f
```

#### 1.3 启动 

docker-compose up -d


#### 二、docker run 命令运行

#### 2.1 config.cfg 

同上

#### 2.2启动命令

**docker run -v  ./config:/etc/aliyun-ddns/  -v ./logs:/etc/logs -it  youdmeng/aliddns  /bin/bash**
