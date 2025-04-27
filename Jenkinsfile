pipeline{
    agent any

    stages{
        stage('Git checkout code') {
            steps {
                git 'https://github.com/rahultiple31/simple-java-maven-app-may-24.git'
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
