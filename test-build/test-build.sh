#!/bin/sh
#cd ${WORKSPACE}/src
#docker build -t 121.199.10.99:81/python-redis-demo:b${BUILD_NUMBER} .
#docker push 121.199.10.99:81/python-redis-demo:b${BUILD_NUMBER}
#cd ${WORKSPACE}/test-build
sed -i 's/\$\$BUILD_NUMBER\$\$/'${BUILD_NUMBER}'/g' docker-compose.yml
sed -i 's/\$\$PORT_NUMBER\$\$/'`expr 5000 + ${BUILD_NUMBER}`'/g' docker-compose.yml
#chmod 777 ./rancher-compose
rancher-compose --url http://192.168.2.93:8080 --access-key 15A33DF17A44FA7DD156 --secret-key sdtCMjkpquoSLUfB3KzQdWwKhNaMF5WXhFV7b3co -p python-redis-demo-build${BUILD_NUMBER} up -d
#./rancher-compose --url http://10.0.0.5:8080 --access-key CA23527D9BE1E5855619 --secret-key GF6Q1vMsimqY8MHp6t17eqoZXcbQ8VEBcjU11z7H -p python-redis-demo-build27 up --pull -d --upgrade pyapp
# --confirm-upgrade
