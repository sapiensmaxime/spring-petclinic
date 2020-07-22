pipeline {
    agent any
    
    stages {
        stage ('Checkout') {
          steps {
            git 'https://github.com/sapiensmaxime/spring-petclinic.git'
          }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}
