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
                sh "docker build -t shankanth/spring-petclinic:v2 ."
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
                script{
                withDockerRegistry(credentialsId: 'dockercred', url: 'hub.docker.com') {
                sh "echo Push Docker Image process started"
                sh "docker push shankanth/spring-petclinic:v2"
                sh "echo Push Docker Image process completed"
                }
            }

            }
        }
        stage('Run Ansible PlayBook') {
            steps{
                sh "echo Run Ansible PlayBook process started"
                sh "ansible-playbook webserver.yml"
                sh "echo Run Ansible PlayBook process completed"
            }
        }

    }
}