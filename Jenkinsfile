pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        sh 'chmod +x build.sh'
        sh './build.sh'
      }
    }
    
    stage('Deploy') {
    steps {
        withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
            sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
            sh 'docker push joshuajoz123867/prod:capstone'
        }
      }
    }
    
  }

post{
      always{
            sh 'chmod +x deploy.sh'
            sh './deploy.sh'
            
            
        }
    }

}
