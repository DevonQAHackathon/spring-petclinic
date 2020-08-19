pipeline {
    agent any

    stages {
        stage('Build App') {
            steps{
                sh "echo Build and Package process started"
                sh "./mvnw package"
                sh "echo Build and Package process completed"
            }
        }
		stage('Build Docker Image') {
            steps{
                sh "echo Build docker Image process started"
                sh "docker build -t docker-ee-local/spring-petclinic:latest ."
                sh "echo Build docker Image process completed"
            }
        }
		stage('Run Docker Image') {
            steps{
                sh "echo Run docker Image process started"
                sh "docker run -d -p 80:8080 docker-ee-local/spring-petclinic:latest"
                sh "echo Run docker Image process completed"
            }
        }

    }
}