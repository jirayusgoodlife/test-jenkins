pipeline {
    agent { label "robot" }

    environment {
        DISPLAY = ':99' // Xvfb virtual display
        PATH = "/home/jirayus/.local/bin:/usr/bin:${env.PATH}" // Include the Robot Framework path
    }
    stages {

        stage('Check PATH') {
            steps {
                sh 'echo $PATH' // Verify if the correct paths are available
            }
        }
        
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
