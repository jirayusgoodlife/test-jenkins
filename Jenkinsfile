pipeline {
    agent { label "robot" }

    environment {
        DISPLAY = ':99' // Xvfb virtual display
        PATH = "/usr/local/bin:${env.PATH}" // Ensure geckodriver is in PATH
    }

    stages {

        stage('Run Robot Framework Tests') {
            steps {
                echo 'Executing Robot Framework tests...'
                sh 'robot --outputdir results test.robot'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/*', allowEmptyArchive: true
            echo 'Test results archived.'
        }
        success {
            echo 'Tests passed!'
        }
        failure {
            echo 'Tests failed. Check the logs.'
        }
    }
}
