pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t frontend-app:${BUILD_NUMBER} .'
            }
        }

        stage('Deploy to Minikube') {
            steps {
                sh 'kubectl set image deployment/frontend frontend=frontend-app:${BUILD_NUMBER}'
                sh 'kubectl apply -f service.yaml'
            }
        }

        stage('Verify') {
            steps {
                sh 'kubectl get pods'
                sh 'kubectl get svc'
            }
        }
    }
}
