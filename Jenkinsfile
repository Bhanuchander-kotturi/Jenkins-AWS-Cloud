pipeline {
  agent any
  tools {
    jdk 'Java21'
    maven 'maven3'
  }
  stages {
    stage('Initialize Pipeline') {
      steps {
        echo "Initializing Pipeline..."
        sh 'java --version'
        sh 'mvn --version'
      }
    }
    stage('Checkout Github Codes'){
      steps {
        echo 'Cecking out github codes...'
      }
    }
    stage('Maven Build') {
      steps {
        echo 'Building java app with maven'
      }
    }
    stage('JUnit test of java app') {
      steps {
        echo 'Junit Testing...'
      }
    }
    stage('SonarQube Analysis') {
      steps {
        echo 'Running static code analysis'
      }
    }
    stage('Trivy FS scan') {
      steps {
        echo 'scanning file system with Trivy FS'
      }
    }
    stage('Build and Tag docker image') {
      steps {
        echo 'building java app docker image'
      }
    }
  }
}

