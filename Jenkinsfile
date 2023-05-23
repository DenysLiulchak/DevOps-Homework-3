pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                   sh 'docker-compose build'
                   sh 'docker-compose push'
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                sh 'ssh youremail@example.com "docker-compose pull && docker-compose up -d"'
            }
        }

        stage('Cleanup') {
            steps {
                deleteDir()
            }
        }
    }
}