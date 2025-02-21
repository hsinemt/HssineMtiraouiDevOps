pipeline {

 agent any


 stages {

 stage('GIT') {

           steps {

               git branch: 'master',

               url: 'https://github.com/hsinemt/HssineMtiraouiDevOps.git'

          }

     }

 stage ('Compile Stage') {

 steps {

 sh 'mvn clean compile'

 }
 
 }
 stage('MVN SONARQUBE') {
            steps {
                script {
                    sh 'mvn sonar:sonar -Dsonar.login=squ_4d0ae395d64be775fc49cef3b0d43bc25f3a786a -Dsonar.password=Fcbcampnou1899. -Dmaven.skipTests=true'
                }
            }
        }
 }

}
