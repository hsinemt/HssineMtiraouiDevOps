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
        stage('Compile & Package') {
            steps {
                sh 'mvn clean package -Dmaven.test.skip=true' // Builds the JAR
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t hsinemt/timesheet-devops:1.0.0 .'
            }
        }
        stage('Push Docker Image') {
            steps {
                sh 'docker push hsinemt/timesheet-devops:1.0.0' // Removed trailing dot
            }
        }
        stage('Deploy to Nexus') {
            steps {
                sh 'mvn deploy -Dmaven.test.skip=true' // Deploy to Nexus
            }
        }
    }
}
