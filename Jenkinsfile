pipeline {
    agent any

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

        stage('MVN SONARQUBE') {
            steps {
                script {
                    // Use the provided SonarQube token
                    sh 'mvn sonar:sonar -Dsonar.token=squ_4d0ae395d64be775fc49cef3b0d43bc25f3a786a -Dmaven.skipTests=true'
                }
            }
        }
    }
}
