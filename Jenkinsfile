pipeline{

    agent any
    environment {
        DOCKERHUB_CREDENTIALS=credentials('dockerhub-credentials')
    }

    stages {
        
        stage('gitclone') {

            steps {
                git 'https://github.com/Joshuaaj/reactjs-app.git'
            }
        }

        stage('Build') {

            steps {
                sh 'docker build -t Joshuaaj/reactjs-app:latest .'
            }
        }

        stage('Login') {

            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push') {

            steps {
                sh 'docker push Joshuaaj/reactjs-app:latest'
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }

}
