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
                sh "docker build -t shankanth/spring-petclinic:latest ."
                sh "echo Build docker Image process completed"
            }
        }
		// stage('Run Docker Image') {
        //     steps{
        //         sh "echo Run docker Image process started"
        //         sh "docker run -d -p 80:8080 docker-ee-local/spring-petclinic:latest"
        //         sh "echo Run docker Image process completed"
        //     }
        // }
        stage('Push Docker Image') {
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockercred', passwordVariable: 'pass', usernameVariable: 'user')]) {
                sh "echo Push Docker Image process started"
                sh "docker login -u user -p pass"
                sh "docker push shankanth/spring-petclinic:latest"
                sh "echo Push Docker Image process completed"
                }

            }
        }
        stage('Run Ansible PlayBook') {
            steps{
                sh "echo Run Ansible PlayBook process started"
                sh ""
                sh "echo Run Ansible PlayBook process completed"
            }
        }

    }
}