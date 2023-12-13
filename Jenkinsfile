pipeline {
    agent any

    stages {
        state('git clone'){
            steps(){
                git 'https://github.com/wosyh18/soojung_os.git'
            }
        }

        stage('Build image') {
            steps {
                app = docker.build("so21yeon11")
            }
        }
        
       stage('Push image') {
            steps {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            app.push("latest")
                            app.push("${env.BUILD_ID}")
                    }
            }

        }        
    }
}