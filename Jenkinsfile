pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/Sriram2004yadav/internal2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat """
                    docker build -t sriram040/internal2:latest .
                """
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat """
                        docker login -u %DOCKER_USER% -p %DOCKER_PASS%
                    """
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat """
                    docker push sriram040/internal2:latest
                """
            }
        }
    }

    post {
        always {
            bat "docker logout"
        }
    }
}
