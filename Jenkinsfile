/* Requires the Docker Pipeline plugin */
pipeline {
    agent { label 'docker-agent-go' }
    stages {
        stage('build') {
            steps {
                sh 'go version'
            }
        }
    }
}
