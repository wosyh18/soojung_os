pipeline {
    agent any

    

    stages {
        stage('git clone'){
            steps{
                git branch: 'main',
                credentialsId: 'so21yeon11',
                url: 'https://github.com/wosyh18/soojung_os.git'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t my-image:latest .'
            }
        }
        stage('Push') {
            steps {
                sh 'docker tag my-image so21yeon11/my-image'
                sh 'docker push so21yeon11/my-image:latest'
            }
        }
    }
}
