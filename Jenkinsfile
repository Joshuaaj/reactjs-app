pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t reactjs-app-web .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh 'docker push joshuajoz123867/dev/reactjs-app-web'
            }
        }
        stage('Deploy') {
            steps {
           	sh 'docker pull joshuajoz123867/dev/reactjs-app-web'
	    	sh 'docker stop reactjs-app-web || true'
	    	sh 'docker rm reactjs-app-web || true'
	    	sh 'docker run -d --name reactjs-app-web -p 80:80 joshuajoz123867/dev/reactjs-app-web:latest'
    }
        }
    }
}

