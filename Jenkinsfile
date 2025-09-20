pipeline {
  agent any

  tools {
    jdk 'Java21'
    maven 'maven3'
  }

  environment {
    SONAR_SCANNER_HOME = tool 'sonar7'
  }

  stages {
    stage('Initialize Pipeline') {
      steps {
        echo "Initializing Pipeline..."
        sh 'java --version'
        sh 'mvn --version'
      }
    }

    stage('Checkout Github Codes') {
      steps {
        echo 'Checking out github codes...'
        checkout([
          $class: 'GitSCM',
          branches: [[name: '*/main']],
          doGenerateSubmoduleConfigurations: false,
          extensions: [],
          userRemoteConfigs: [[
            credentialsId: 'Github-Token',
            url: 'https://github.com/Bhanuchander-kotturi/Jenkins-AWS-Cloud.git'
          ]]
        ])
      }
    }

    stage('Maven Build') {
      steps {
        echo 'Building java app with maven'
        sh 'mvn clean package'
      }
    }

    stage('JUnit test of java app') {
      steps {
        echo 'Running JUnit tests...'
        sh 'mvn test'
      }
    }

    stage('SonarQube Analysis') {
      steps {
        echo 'Running static code analysis'
        withCredentials([string(credentialsId: 'Sonar-Token', variable: 'sonarToken')]) {
          withSonarQubeEnv('sonar') {
            sh '''
              ${SONAR_SCANNER_HOME}/bin/sonar-scanner \
              -Dsonar.projectKey=jenkinsgcp \
              -Dsonar.sources=. \
              -Dsonar.host.url=http://15.207.104.59:9000 \
              -Dsonar.java.binaries=target
