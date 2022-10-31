pipeline {
    agent any
    
    environment{
        registry = "pavleche/maven-project"
        dockerImage = ''
        korImeILozinka = "dockerKorImeILozinka"
        comm = readJSON text: "$zen"
        msg=readJSON text:"$X_GitHub_Event"
        
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
                  dockerImage =sh 'docker build registry .'
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
       
    
        
           stage("Parsiranje odgovora"){
            steps{  
                    
                    echo comm.toString()
                    echo 'Ovaj pull je ' + comm
                     
                    echo msg.toString()
            }
        }
        stage("Pokretanje drugog posla"){
            
            steps{
                script{
                    if(msg=="closed"){
                    build job:"PokrenutOdStraneDrugog"
                    }else{
                        echo "Job nije pokrenut"
                    }
                }
                
            }
            
        } 
    }
   }     
}
