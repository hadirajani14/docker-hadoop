#! /bin/bash
service ssh start

/hadoop/sbin/start-dfs.sh
/hadoop/sbin/start-yarn.sh

/bin/bash