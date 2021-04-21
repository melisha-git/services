#!/bin/sh

minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
sleep 2
minikube ssh 'sudo mkdir /mnt/influxdb; sudo chmod 777 /mnt/influxdb'
#Default setup
eval $(minikube docker-env)
minikube addons enable metallb
minikube addons enable metrics-server
kubectl apply -f ./srcs/configmap.yaml

echo "nginx setup 🥺"
docker build -t nginx_image ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml
echo "😇 nginx RUN"

echo "mysql setup 🥺"
docker build -t mysql_image ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml
echo "😇 mysql RUN"

echo "phpmyadmin setup 🥺"
docker build -t phpmyadmin_image ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
echo "😇 phpmyadmin RUN"

echo "wordpress setup 🥺"
docker build -t wordpress_image ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml
echo "😇 wordpress RUN"

echo "ftps setup 🥺"
docker build -t ftps_image srcs/ftps
kubectl apply -f srcs/ftps/ftps.yaml
echo "😇 ftps RUN"

echo "influxdb setup 🥺"
docker build -t influxdb_image srcs/influxdb
kubectl apply -f ./srcs/influxdb/influxdb.yaml
echo "😇 influxdb RUN"

echo "grafana setup 🥺"
docker build -t grafana_image srcs/grafana
kubectl apply -f ./srcs/grafana/grafana.yaml
echo "😇 grafana RUN"

echo "DASHBOARD 🥺"
sleep 2
minikube dashboard