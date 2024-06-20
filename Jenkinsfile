pipeline {
    agent any
    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                echo "Building is done"
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                echo "Testing is done"
                '''
            }
        }
        node {
          stage('SCM') {
            checkout scm
             }
        stage('SonarQube Analysis') {
            def mvn = tool 'Default Maven';
                withSonarQubeEnv() {
                      sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=01-Pipeline-GitRepo"
                                  }
                                }
            }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                echo "doing delivery stuff"
                '''
            }
        }
    }
}
