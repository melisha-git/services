eval $(minikube docker-env)
kubectl exec deploy/wordpress-deployment -- pkill nginx
kubectl exec deploy/wordpress-deployment -- pkill telegraf
kubectl exec deploy/wordpress-deployment -- pkill php-fpm
kubectl exec deploy/phpmyadmin -- pkill nginx
kubectl exec deploy/phpmyadmin -- pkill telegraf
kubectl exec deploy/phpmyadmin -- pkill php-fpm
kubectl exec deploy/nginx-deployment -- pkill nginx
kubectl exec deploy/nginx-deployment -- pkill telegraf
kubectl exec deploy/nginx-deployment -- pkill sshd
kubectl exec deploy/mysql -- pkill mysqld
kubectl exec deploy/mysql -- pkill telegraf
kubectl exec deploy/influxdb -- pkill telegraf
kubectl exec deploy/influxdb -- pkill influxd
kubectl exec deploy/grafana-deployment -- pkill telegraf
kubectl exec deploy/grafana-deployment -- pkill grafana
kubectl exec deploy/ftps -- pkill telegraf
kubectl exec deploy/ftps -- pkill vsftpd