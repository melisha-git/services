# services
Echole 42 project
Перед запуском проекта убедитесь, что у вас установлен minikube( minikube status )

<div aligne="center">
  <p>Данный проект направлен на изучение настроек конфигов для web-services</p>
  <br>
  <p>Что бы собрать проект запустите <b>sh setup.sh</b></p>
  <br>
  <p>Проект учит работать с сервисом nginx. Поднятие данного пода научило меня редиректам, reverse_proxy, а так же более детальной настройке nginx.conf
  При поднятии пода mysql в yaml файле я создавал volume, что бы при убийстве my-sql-svc база данных не теряла предыдущие записи. Так же в этом проекте я для
  себя узнал, как происходит взаимодействия между telegraf, grafana и influxdb</p>
</div>

