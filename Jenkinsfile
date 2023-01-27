/* Requires the Docker Pipeline plugin */
pipeline {
    agent { 
        docker { 
            image 'golang:1.19.1-alpine'
            label 'docker-capable' 
        }
    }
    stages {
        stage('build') {
            steps {
                sh 'go version'
                sh 'go env'
            }
        }
    }
}
