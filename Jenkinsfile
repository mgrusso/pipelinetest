node {
    def app
    
    stage('Clone repository') {
      /* Let's make sure we have the repository cloned to our workspace */
      checkout scm
    }

    stage('build image') {
      steps{
        app = docker.build "mgrusso/unificontroller"
      }
    }
}
