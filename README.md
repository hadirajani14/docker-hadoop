# docker-hadoop

## Versions

- JDK8
- Hadoop 3.3.4

### Deployment Steps

#### 1. Clone the repo

```
git clone https://github.com/hadirajani14/docker-hadoop
```

#### 2. Download a distro of Hadoop 3.3.4

Download hadoop compressed files from this [URL](https://www.apache.org/dyn/closer.cgi/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz) and place it inside the cloned repository

#### 3. Start it up

```
docker-compose up -d --build
```

#### 4. Run HDFS commands

```
docker exec -it hadoop /bin/bash
hdfs dfs -ls /
```
