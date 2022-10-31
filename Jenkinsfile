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
                  dockerImage =sh 'docker build registry /poslednji/Dockerfile '
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
        stage('Hello') {
            steps {
                echo 'Push1'
            }
        }
        stage("Parsiranje odgovora"){
            steps{
                echo 'Ovaj pull je ' + env.repo
            }
        }
        stage("Pokretanje drugog posla"){
            
            steps{
                script{
                    if(env.repo=="closed"){
                    build job:"PokrenutOdStraneDrugog"
                    }else{
                        echo "Job nije pokrenut"
                    }
                }
                
            }
            
        }
   }
}
