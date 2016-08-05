#!/bin/sh
#cd ${WORKSPACE}/src
#docker build -t 192.168.99.50:5000/python-redis-demo:b${BUILD_NUMBER} .
#docker push 192.168.99.50:5000/python-redis-demo:b${BUILD_NUMBER}
#cd ${WORKSPACE}/test-build
sed -i '' 's/MYBUILD/'${BUILD_NUMBER}'/g' docker-compose.yml
sed -i '' 's/MYPORT/'`expr 5000 + ${BUILD_NUMBER}`'/g' docker-compose.yml
#chmod 777 ./rancher-compose
#./rancher-compose --url http://192.168.99.1:8080 --access-key FE362F3CA9E9BD8289E2 --secret-key yD2Uc789cCPzeEQySA1Q2UNMFKrSeq2SgzGYvAyp -p python-redis-demo-build${BUILD_NUMBER} up -d
#./rancher-compose --url http://10.0.0.5:8080 --access-key CA23527D9BE1E5855619 --secret-key GF6Q1vMsimqY8MHp6t17eqoZXcbQ8VEBcjU11z7H -p python-redis-demo-build27 up --pull -d --upgrade pyapp
# --confirm-upgrade
