pipeline{
    agent any

    environment{
        STAGE="PROD"
        USER="DEV"
        PASS=credentials('PASS')
    }

    stages{
        stage('Git checkout code') {
            steps {
                git 'https://github.com/rahultiple31/spring-boot-war-example-jenkins.git'
            }
        }

        stage("environment"){
            steps{
                sh '''
                echo "$STAGE"
                echo "uaername $USER and password $PASS"
                '''
            }
        }

        stage("build code"){
            steps{
                sh '''
                mvn clean package
                echo "$BUILD_ID"
                '''
            }
        }

        stage("test"){
            steps{
                 sh 'mvn test'
            }

            post { 
                always { 
                    echo "test done"
            }

        }

        stage("build docket images"){
            steps{
                 sh '''
                 docker rmi -f app:latest
                 docker build -t app .
                 '''
            }
        }

        stage("deloyment"){
            steps{
                 sh '''
                 docker rm -f bash_container
                 docker run -itd --name bash_container app /bin/bash
                 '''
            }
        }


    }
    post{
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}
