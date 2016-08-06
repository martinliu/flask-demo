stage 'Build'
node("master") {
   echo 'Check out code'
   git 'https://github.com/martinliu/flask-demo'
   dir('./src') {
    // build new images
    echo 'Build new docker image'
    sh 'docker build -t localhost:5000/python-redis-demo:b${BUILD_NUMBER} .'
}
}

stage 'Push'
node("master") {
   echo 'Push new build to registory'
    sh 'docker push localhost:5000/python-redis-demo:b${BUILD_NUMBER}'
    sh 'docker rmi localhost:5000/python-redis-demo:b${BUILD_NUMBER}'
}

stage 'RegSrvPot'
node("master") {
   echo 'Registry a new port for testing'
   dir('./test-build') {
    // change port and build for docker-compose.yml file
    sh 'sh ./test-build.sh'
}
}

stage 'Deploy2QA'
node("master") {
   echo 'Deploy to QA nodes'
   dir('./test-build') {
       //burning up a new release
    sh '/Users/martin/bin/rancher-compose --url http://192.168.99.102:8080 --access-key 0F7DD2AE7DF85934B443 --secret-key YmpQjsxt5PrPXxPR99GMUkLRvud8vyNz3DLrsqVR -p flask-demo-build${BUILD_NUMBER} up -d'
}
}
