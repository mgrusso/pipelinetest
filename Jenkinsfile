/* Requires the Docker Pipeline plugin */
pipeline {
    agent { label 'docker-agent-alpine' }
    stages {
        stage('build') {
            steps {
                sh 'go version'
            }
        }
    }
}
