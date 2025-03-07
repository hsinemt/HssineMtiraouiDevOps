pipeline {
    agent any
    tools {
        jdk 'JAVA_HOME'
        maven 'M2_HOME'
    }
    stages {
        stage('GIT') {
            steps {
                git branch: 'master', url: 'https://github.com/hsinemt/HssineMtiraouiDevOps.git'
            }
        }
        stage('Compile Stage') {
            steps {
                sh 'mvn clean compile'
            }
        }
        stage('Package Stage') {
            steps {
                sh 'mvn package -DskipTests'
                sh 'ls -la target/'  // Debug: Check JAR file name
            }
        }
        stage('Debug Docker') {
            steps {
                sh 'docker --version'
                sh 'pwd'
                sh 'ls -la'  // List files in current directory
            }
        }
        stage('build Image') {
            steps {
                // Use --no-cache to ensure a fresh build
                sh 'docker build --no-cache -t hsinemt/timesheet-devops:1.0.0 . || (echo "Docker build failed with error code $?"; exit 1)'
            }
        }
        stage('Docker Login') {
            steps {
                // Use credentials from Jenkins
                withCredentials([string(credentialsId: 'docker-hub-password', variable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u hsinemt --password-stdin || (echo "Docker login failed"; exit 1)'
                }
                // Alternatively, if you don't have credentials set up:
                // sh 'docker login -u hsinemt -p your_password'
            }
        }
        stage('deploy Image') {
            steps {
                sh 'docker push hsinemt/timesheet-devops:1.0.0 || (echo "Docker push failed"; exit 1)'
            }
        }
        stage('MVN Nexus') {
            steps {
                sh 'mvn deploy -Dmaven.test.skip=true'
            }
        }
    }
    post {
        always {
            // Clean up after build
            sh 'docker logout || true'
        }
        failure {
            echo 'Pipeline failed! Check logs for details.'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
    }
}
