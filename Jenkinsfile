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

                retry(3){
                    sh "df -h"
                    sh "sleep 20"
                }

                // timeout(){
                //     sh "sleep 20"
                // }

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
