#!/bin/bash

echo 'step1/7 --------> 构建镜像'
#构建镜像
docker build -t tensorflow-notebook .

imageVersion='202106071525'

#获取新镜像ID号
imageID=`docker images | grep -w "tensorflow-notebook" | awk -F " " '{print $3}' | head -n 1`

echo 'step2/7 -------> 镜像构建结果: '${imageID}

echo 'step3/7 -------> 重新tag镜像'
#重新tag镜像
imagePushUrl='harbor.neuedu.com.cn/cloudlab-staging/tensorflow-jupyterlab'
docker tag ${imageID} ${imagePushUrl}:${imageVersion}

echo 'step4/7 -------> 新tag镜像推送'
#推送镜像到仓库
docker push ${imagePushUrl}:${imageVersion}
sleep 5s

echo 'step5/7 -------> 清理新生成的临时镜像'
#删除临时镜像
docker rmi tensorflow-notebook:latest
docker rmi ${imagePushUrl}:${imageVersion}

echo 'step6/7 -------> 开始分发集群节点...'
#遍历集群节点登录分发
#每个节点需要手动输入root用户密码
ips=('172.17.68.12' '172.17.68.13' '172.17.68.14' '172.17.68.220')
for ip in ${ips[@]}
do
ssh root@${ip} > /dev/null 2>&1 << eeooff
docker rmi tensorflow-jupyterlab:${imageVersion}
docker pull ${imagePushUrl}:${imageVersion}
sleep 3s
docker tag ${imageID} tensorflow-jupyterlab:${imageVersion}
docker rmi ${imagePushUrl}:${imageVersion}
exit
eeooff
done

echo 'step7/7分发完成'
