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
        stage('build Image ') {
            steps {
                sh 'docker build -t hsinemt/timesheet-devops:1.0.0 .'
             }
         }
        stage('deploy Image ') {
             steps {
                sh 'docker push hsinemt/timesheet-devops:1.0.0 .'
             }
         }

        // stage('MVN SONARQUBE') {
        //     steps {
        //         script {
        //             // Use the provided SonarQube token
        //             sh 'mvn sonar:sonar -Dsonar.token=squ_4d0ae395d64be775fc49cef3b0d43bc25f3a786a -Dmaven.skipTests=true'
        //         }
        //     }
        // }
          stage('MVN Nexus') {
            steps {
                sh 'mvn deploy -Dmaven.test.skip=true'
            }
        }
    }
}
