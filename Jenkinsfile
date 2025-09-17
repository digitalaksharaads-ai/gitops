pipeline {
    agent any

    parameters {
        string(name: 'ENV', defaultValue: 'dev', description: 'Target environment (dev/qa/prod)')
        string(name: 'VERSION', defaultValue: '1.0.0', description: 'Build version')
    }

    environment {
        ARTIFACT_REPO = 'https://trial0vs3c7.jfrog.io/artifactory/digital-generic-local/'   // Change to your JFrog repo path
        BUILD_NAME = 'C-PROJECT'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'cppl', url: 'https://github.com/digitalaksharaads-ai/gitops.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building version ${params.VERSION} for ${params.ENV}"
                bat 'mingw32-make'
            }
        }

        stage('Test') {
            steps {
                echo "Running unit tests..."
                // If you have test scripts, call them here
                // bat 'tests\\run_tests.bat'
            }
        }

        stage('Upload to JFrog') {
            steps {
                bat """
					curl -udigitalaksharaads@gmail.com:cmVmdGtuOjAxOjE3ODkwNjY0OTc6ZWxoc0FBd1pYOFZEY0M4b3VyNEh5OFZra2RF -T app_${BUILD_NAME}_ {params.VERSION}.exe "https://trial0vs3c7.jfrog.io/artifactory/digital-generic-local/app_${BUILD_NAME}_ {params.VERSION}.exe"
                """
            }
        }
    }

    post {
        success {
            echo "✅ Build ${params.VERSION} for ${params.ENV} uploaded to JFrog successfully!"
        }
        failure {
            echo "❌ Build failed. Please check logs."
        }
    }
}
