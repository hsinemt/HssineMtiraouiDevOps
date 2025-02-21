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
                    sh 'mvn sonar:sonar -Dsonar.login=admin -Dsonar.password=Fcbcampnou1899.Leom10 -Dmaven.skipTests=true'
                }
            }
        }
 }

}
