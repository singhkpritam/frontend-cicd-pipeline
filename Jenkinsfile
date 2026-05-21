pipeline {
    agent any

    environment {
        IMAGE_NAME = "frontend-app"
        TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                docker build -t ${IMAGE_NAME}:${TAG} .
                """
            }
        }

        stage('Deploy to Kubernetes (Minikube)') {
            steps {
                sh """
                kubectl apply -f deployment.yaml
                kubectl set image deployment/frontend frontend=${IMAGE_NAME}:${TAG}
                kubectl apply -f service.yaml
                """
            }
        }

        stage('Verify Deployment') {
            steps {
                sh "kubectl get pods"
                sh "kubectl get svc"
            }
        }
    }
}
