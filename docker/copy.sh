#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh copy.sh"
	exit 1
}


# copy sql
echo "begin copy sql "
cp ../sql/ry_20210908.sql ./mysql/db
cp ../sql/ry_config_20220114.sql ./mysql/db

# copy html
echo "begin copy html "
cp -r ../fuxin-ui/dist/** ./nginx/html/dist


# copy jar
echo "begin copy fuxin-gateway "
cp ../fuxin-gateway/target/fuxin-gateway.jar ./ruoyi/gateway/jar

echo "begin copy fuxin-auth "
cp ../fuxin-auth/target/fuxin-auth.jar ./ruoyi/auth/jar

echo "begin copy fuxin-visual "
cp ../fuxin-visual/fuxin-monitor/target/fuxin-visual-monitor.jar  ./ruoyi/visual/monitor/jar

echo "begin copy fuxin-modules-system "
cp ../fuxin-modules/fuxin-system/target/fuxin-modules-system.jar ./ruoyi/modules/system/jar

echo "begin copy fuxin-modules-file "
cp ../fuxin-modules/fuxin-file/target/fuxin-modules-file.jar ./ruoyi/modules/file/jar

echo "begin copy fuxin-modules-job "
cp ../fuxin-modules/fuxin-job/target/fuxin-modules-job.jar ./ruoyi/modules/job/jar

echo "begin copy fuxin-modules-gen "
cp ../fuxin-modules/fuxin-gen/target/fuxin-modules-gen.jar ./ruoyi/modules/gen/jar

