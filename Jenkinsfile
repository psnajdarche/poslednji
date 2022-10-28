pipeline{
    agent any

    tools {
         maven 'mvn'
         jdk 'java'
    }

    stages{
        
         stage('build'){
             steps{
                 sh'  mvn -B -DskipTests clean package'
             }         }
        //just to test webhook 3
    }
}
