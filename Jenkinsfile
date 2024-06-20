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
                cd myapp
                pip install -r requirements.txt
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                cd myapp
                python3 hello.py
                python3 hello.py --name=Brad
                '''
            }
        }
        stage('sonarqube-analysis') {
           steps {
               withSonarQubeEnv('sonar-server') {
                   sh 'mvn clean verify sonar:sonar \
                   -Dsonar.projectKey=java \
                   -Dsonar.host.url=http://35.228.202.17/:9000 \
                   -Dsonar.login=squ_2b5035fd196f5084b47b217db9c3d0d09dcc31f8'
             }
             }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                echo "doing delivery stuff.."
                '''
            }
        }
    }
}
