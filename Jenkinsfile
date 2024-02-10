pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Push to Dev') {
            when {
                expression { BRANCH_NAME == 'dev' }
            }
            steps {
                script {
                    // Your build and push to dev steps
                }
            }
        }

        stage('Build and Push to Prod') {
            when {
                expression { BRANCH_NAME == 'master' }
            }
            steps {
                script {
                    // Your build and push to prod steps
                }
            }
        }
    }
}

