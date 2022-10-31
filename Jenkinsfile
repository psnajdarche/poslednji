pipeline {
    agent any
    
    environment{
        registry = "pavleche/maven-project"
        dockerImage = ''
        korImeILozinka = "dockerKorImeILozinka"
    }

   stages {
        stage('Checkout gita') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/psnajdarche/poslednji.git/']]])
                sh 'mvn -D maven.test.failure.ignore=true clean package'
                
            }
        }
        stage('Pravljenje docker image') {
            steps {
                script{
                  dockerImage =sh 'docker build registry '
                }
            }
        }
        stage('Pushovanje na dockerHub') {
            steps {
                script{
                  docker.withRegistry('',korImeLozinka){
                  dockerImage.push()
                }
                
                }
                
            }
         
        
    }
    
}
