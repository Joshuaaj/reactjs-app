pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('dockerHubUsername')
        DOCKER_PASSWORD = credentials('dockerHubPassword')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Push to Dev (dev branch)') {
            when {
                expression { BRANCH_NAME == 'dev' }
            }
            steps {
                sh '''
                docker build -t ${DOCKER_USERNAME}/dev:latest .
                docker login -u ${DOCKER_USERNAME} --password-stdin <<< ${DOCKER_PASSWORD}
                docker push ${DOCKER_USERNAME}/dev:latest
                '''
            }
        }

        stage('Build and Push to Prod (master branch)') {
            when {
                expression { BRANCH_NAME == 'master' }
            }
            steps {
                sh '''
                # Additional pre-build steps for production if needed (e.g., linting, tests)

                docker build -t ${DOCKER_USERNAME}/prod:latest .
                docker login -u ${DOCKER_USERNAME} --password-stdin <<< ${DOCKER_PASSWORD}
                docker push ${DOCKER_USERNAME}/prod:latest
                '''
            }
        }
    }
}
