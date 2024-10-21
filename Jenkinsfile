pipeline {

    agent any

    tools {
        maven "mvn"
    }

    environment {
        NAME="Rahul"
    }

    
    stages {
        stage('Build') {
            steps {
                sh '''
                    echo $NAME
                    mvn clean package
                '''
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deployment') {
            steps {
                sh 'java -jar /var/lib/jenkins/workspace/Project-1/target/*.jar'
            }
        }
    }
}
