properties ([
        parameters ([
            string(defaultValue: '', description: 'user input', name : 'user_id'),
            string(defaultValue: 'master', description: 'git branch for building', name : 'branch_name')
        ])
])

pipeline {
    agent { 
        node {
            label 'docker-agent-python'
            }
      }
    // triggers {
    //     pollSCM '* * * * *'
    // }
    stages {
        stage('Login') {
                steps {
                    echo "Active user is now ${params.user_id}"
                }
        }
        
        stage('Build') {
            steps {
                echo "Building.."
                // input 'Continue to next stage?'
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
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                echo "doing delivery stuff.."
                '''
      
            }
        }
    }

      post {
        always {
            script {
                // Fetch the email address of the user who triggered the build
                // Make sure you have both the Email Extension Plugin and the Build User Vars Plugin    
                wrap([$class: 'BuildUser']) {
                    env.BUILD_USER_EMAIL = "${BUILD_USER_EMAIL}"
                }
                // Determine the build status
                def buildStatus = currentBuild.currentResult

                // Send email notification
                emailext (
                    to: "${env.BUILD_USER_EMAIL}",
                    subject: "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                    body: """
                        <html>
                        <p>Build Status: ${buildStatus}</p>
                        <p>Job: ${env.JOB_NAME} [${env.BUILD_NUMBER}]</p>
                        <p>Build URL: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>
                        <p>Changes:</p>
                        <pre>${env.CHANGES}</pre>
                        </html>
                    """,
                    mimeType: 'text/html'
                )
            }
        }
    }  
}
