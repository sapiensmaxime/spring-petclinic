pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Deploy') {
            steps {
                sh "sudo mv target/spring*.jar /home/vagrant/data/petclinic.jar"
                sh "sudo systemctl restart petclinic"
                
            }
        }
    }
}
