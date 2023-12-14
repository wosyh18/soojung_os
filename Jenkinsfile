pipeline {
    agent any
    

    stages {

        //git clone
        stage('git clone'){
            steps{
                git 'https://github.com/wosyh18/soojung_os.git'
                }
            }
        

        stage('Build image') {
            steps {
                script{
                app = docker.build("so21yeon11/dt3")
                }
            }
        }
        
        stage('Push image') {
            steps {
                
                    docker.withRegistry('https://registry.hub.docker.com', 'so21yeon11') {
                            app.push("${env.BUILD.NUMBER}")
                            app.push("latest")
                    }
                
            }

        }        
    }
}