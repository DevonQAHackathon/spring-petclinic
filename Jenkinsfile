pipeline {
    agent any

    stages {
        stage('CheckOut') {
            steps {
                // Get some code from a GitHub repository
                sh "echo starting the checkout process"
                //sh "git clone https://github.com/spring-projects/spring-petclinic.git"
                //git 'https://github.com/spring-projects/spring-petclinic.git'
                sh "ls -a"
                 sh "echo checkout process completed"
            }
        }
        stage('Build App') {
            steps{
                sh "echo Build and Package process started"
                sh "cd spring-petclinic/ && ./mvnw package"
                sh "echo Build and Package process completed"
            }
        }
        stage('Build Docker File') {
            steps{
                sh "echo Build docker File process started"
                sh "rm Dockerfile"
                sh "touch Dockerfile"
                writeFile file: "Dockerfile" , text: "FROM openjdk:8-jdk-alpine"+"\n"+"COPY spring-petclinic/target/*.jar ./*.jar"+"\n"+'ENTRYPOINT ["java","-jar","*.jar"]'+"\n"+"EXPOSE  8080 80 3306"
                sh "echo Build docker File process completed"
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