pipeline {
    agent any
    
    environment {
        DOCKER_USERNAME = 'joshuajoz123867'
        DOCKER_PASSWORD = 'dckr_pat_VZv-_SuI4XFS9x7v2YnhXYN1mHs'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Push to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'dckr_pat_VZv-_SuI4XFS9x7v2YnhXYN1mHs', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        // Build Docker image
                        dockerImage = docker.build('reactjs-app-web')

                        // Push Docker image to Docker Hub
                        docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_USERNAME', 'DOCKER_PASSWORD') {
                            dockerImage.push()
                        }
                    }
                }
            }
        }
    }
}

