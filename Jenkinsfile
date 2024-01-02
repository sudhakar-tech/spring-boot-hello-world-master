pipeline {
  agent any
  tools {
    maven 'MAVEN'
  }
  stages {
    stage('Checkout Code') {
      steps {
        checkout scmGit(branches: [
          [name: '*/main']
        ], extensions: [], userRemoteConfigs: [
          [url: 'https://github.com/sudhakar-tech/spring-boot-hello-world-master']
        ])
      }
    }
    stage('Compile Code') {
      steps {
        bat 'mvn compile'
      }
    }
    stage('Test Code') {
      steps {
        bat 'mvn test'
      }
    }
    stage('Build Code') {
      steps {
        bat 'mvn package'
      }
    }
    stage('Build Docker Image') {
      steps {
        bat 'docker build -t ksreddy570/spring-hello-world .'
      }
    }
    stage('Push Docker Image') {
      steps {
        script {
          withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
            bat 'docker login -u ksreddy570 -p ksreddy570'
          }
          bat 'docker push ksreddy570/spring-hello-world:latest'
        }
      }
    }
  }
}