pipeline {

    agent any

    tools {
        maven "mvn"
    }

    environment {
        NAME="Rahul"
        PASS=credentials('PASS')
        DOCKER_USER="rahultipledocker"
    }

    
    stages {

        stage('Git checkout code') {
            steps {
                git 'https://github.com/rahultiple31/simple-java-maven-app-may-24.git'
            }
        }

        stage('Build') {
            steps {
                sh '''
                    echo $NAME
                    echo $PASS
                    mvn clean package
                '''

                retry(3){
                    sh "df -h"
                }

                // timeout(time:5, unit:'SECONDS'){
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

        stage('Build docker image') {
            steps {
                sh '''
                    docker build -t rahultipledocker/java_pro .
                '''
            }
        }

        stage('push docker image to dockerhub repo') {
            steps {

                withCredentials([gitUsernamePassword(credentialsId: 'DockerHub', gitToolName: 'Default')]) {    
                sh 'docker login -u ${DOCKER_USER} -p ${Default}'
                sh 'docker push rahultipledocker/java_pro:latest'
                sh 'docker logout'
                }   
            }
        }

        // stage('Approval') {
        //     steps {
        //         input 'Approval Deployment to Production'
        //     }
        // }


        stage('Deployment') {
            steps {
                sh 'java -jar /var/lib/jenkins/workspace/Project-1/target/*.jar'
            }
        }
    }
}
