pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages {

        stage('Checkout') {
            steps {
                // Grab source from Git
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Build with Maven
                sh "mvn clean package"
            }
        }

        stage('Test') {
            steps {
                sh "mvn test"
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }
}
