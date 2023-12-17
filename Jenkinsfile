pipeline {
    agent any
    environment{
        PROJECT_ID = 'open-398701'
        CLUSTER_NAME = 'kuber'
        LOCATION = 'asia-northeast3-a'
        CREDENTIALS_ID ='0193e2c3-c654-4796-be29-173758f914e5'
    }
    stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }
        stage("Build image") {
            steps {
                script {
                    myapp = docker.build("so21yeon11/my-image:${env.BUILD_ID}")
                }
            }
        }
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
        stage('Deploy to GKE') {
			when {
				branch 'main'
			}
            steps{
                sh "sed -i 's/my-image:latest/my-image:${env.BUILD_ID}/g' deployment.yaml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
        }
    }
}
