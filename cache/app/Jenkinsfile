#!groovy

pipeline {
    agent {
        docker {
            image 'python:3.7'
        }
    }

    stages {
        stage('Environment preparation') {
            steps {
                echo "-=- preparing project environment -=-"
                // Python dependencies
                sh '''
                cd myapp
                python3 --version
                pip install -r requirements.txt
                '''
            }
        }
        stage('Compile') {
            steps {
                echo "-=- compiling project -=-"
                sh "python -m compileall ."
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
