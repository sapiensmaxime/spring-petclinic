pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t petclinic2 .'
            }
        }
        stage('Test') {
            steps {
               jacoco( 
                      execPattern: 'target/*.exec',
                      classPattern: 'target/classes',
                      sourcePattern: 'src/main/java',
                      exclusionPattern: 'src/test*'
                      )
            }
        }
    }
}
