stage 'Build-Docker-Image'
node("master") {
   echo 'Check out code'
   git 'https://github.com/martinliu/flask-demo'
   dir('./src') {
    // build new images
    echo 'Build new docker image'
    sh 'docker build -t 192.168.2.93:5002/proj1/python-redis-demo:b${BUILD_NUMBER} .'
}
}

stage 'Push-Image'
node("master") {
   echo 'Push new build to registory'
    sh 'docker push 192.168.2.93:5002/proj1/python-redis-demo:b${BUILD_NUMBER}'
    sh 'docker rmi 192.168.2.93:5002/proj1/python-redis-demo:b${BUILD_NUMBER}'
}

stage 'Build-testing'
node("master") {
   echo 'Build a testing evn for new build'
   dir('./test-build') {
    // run build file
    sh 'sh ./test-build.sh'
}
}
