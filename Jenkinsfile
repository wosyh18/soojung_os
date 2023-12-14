pipeline {
    agent any
    

    stages {

        //git clone
        stage('git clone'){
            steps{
                git branch: 'main',
                credentialsId: '4ec798f6-b601-41a2-8d8a-38a06ae986a7',
                url: 'https://github.com/wosyh18/soojung_os.git'
                }
            }
        

        stage('Build image') {
            steps {
                script{
                app = docker.build("so21yeon11")
                }
            }
        }
        
       stage('Push image') {
            steps {
                script{
                    docker.withRegistry('https://registry.hub.docker.com', 'so21yeon11') {
                            app.push("latest")
                    }
                }
            }

        }  
        stage('sh') {
            steps {
                script{
                    try(){
                        
                        sh "exit 1"
                    }catch(Exeption err){

                    }
                }
            }
        }      
    }
}