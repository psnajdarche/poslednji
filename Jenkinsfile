pipeline {
    agent any
    
    environment{
        registry = "pavleche/maven-project"
        dockerImage = ''
        korImeILozinka = "dockerKorImeILozinka"
        comm=""
        msg=""
    }
     parameters {
        string(name: 'COMMENT', defaultValue: 'test-params', description: 'desc')
        string(name: 'BRANCH', defaultValue: 'main', description: 'desc')
    }


   stages {
        stage('Checkout gita') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/psnajdarche/poslednji.git/']]])
                sh 'mvn -D maven.test.failure.ignore=true clean package'
                
            }
        }
           stage("Parsiranje odgovora"){
            steps{  
                     comm = readJSON text: "$zen"
                    echo comm.toString()
                    echo 'Ovaj pull je ' + comm
                     msg=readJSON text:"$proso"
                    echo msg.toString()
            }
        }
        stage("Pokretanje drugog posla"){
            
            steps{
                script{
                    if(msg=="ping"){
                    build job:"PokrenutOdStraneDrugog"
                    }else{
                        echo "Job nije pokrenut"
                    }
                }
                
            }
            
        } 
   }
}
