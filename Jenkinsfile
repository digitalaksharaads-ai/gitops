pipeline {
    agent { label 'windows' }

    stages {
        stage('Checkout') {
            steps { checkout scm }
        }

        stage('Build') {
            steps {
                bat 'mingw32-make clean'
                bat 'mingw32-make'
            }
        }

        stage('Test Run') {
            steps {
                bat 'app.exe'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'app.exe', fingerprint: true
        }
    }
}
