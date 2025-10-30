pipeline {
    agent any
    
    environment {
        IMAGE_NAME = "sriram2004yadav/internal2"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Sriram2004yadav/internal2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %IMAGE_NAME%:latest ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', 
                    usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    bat """
                    echo %PASSWORD% | docker login -u %USERNAME% --password-stdin
                    """
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat "docker push %IMAGE_NAME%:latest"
            }
        }
    }

    post {
        always {
            bat "docker logout"
        }
    }
}

