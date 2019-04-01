pipeline {
  agent any

  options {
    buildDiscarder(logRotator(daysToKeepStr: '7', numToKeepStr: '3'))
  }

  triggers {
    pollSCM('H/5 * * * *')
  }

  stages {
    stage('Clone repository') {
      steps {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
      }
    }
  }
}
node {
  def app

  stage('Build image') {
    /* This builds the actual image; synonymous to
    * docker build on the command line */
    app = docker.build("public/apache")
  }

  stage('Push image') {
    /* Finally, we'll push the image into Docker Hub */
    docker.withRegistry('https://spartan.example.com', 'registry') {
      app.push('2.4.39')
      app.push('latest')
    }
  }

  stage('Dangling Images') {
    sh 'docker images -q -f dangling=true  | xargs --no-run-if-empty docker rmi'
  }

  stage('Dangling Volumes') {
    sh 'docker volume ls -qf dangling=true | xargs -r docker volume rm'
  }
}