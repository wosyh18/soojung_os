pipeline {
    agent any
        environment{
        PROJECT_ID = 'open-398701'
        CLUSTER_NAME = 'kuber'
        LOCATION = 'asia-northeast3-a'
        CREDENTIALS_ID ='0193e2c3-c654-4796-be29-173758f914e5'
    }
// git clone 역할 stage
    stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }
// 이미지 빌드 stage
        stage("Build image") {
            steps {
                script {
                myapp = docker.build("so21yeon11/my-image:${env.BUILD_ID}")
                }
            }
        }
 //이미지 푸쉬 stage
        stage("Push image") {
            steps {
                script {
                   docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                     myapp.push("latest")
                     myapp.push("${env.BUILD_ID}")
                       }
                    }
                }
            }
//deploy stage
        stage('Deploy to GKE') {
            when {
                branch 'main'
            }
            steps{
                sh "sed -i 's/so21yeon11\\/my-image:latest/so21yeon\\/my-image:${env.BUILD_ID}/g' deployment.yaml"
                sh 'export PATH=$PATH:/usr/local/bin'
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
        }
    }
}