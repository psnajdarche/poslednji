pipeline {
    agent any
    
    environment{
        registry = "pavleche/maven-project"
        dockerImage = ''
        korImeILozinka = "dockerKorImeILozinka"
        comm= readJSON text: "$ref"
        
    }
   
     


   stages {
       
        
        stage('Checkout gita') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[ url: 'https://github.com/psnajdarche/poslednji.git']]])
                sh 'mvn -D maven.test.failure.ignore=true clean package'
                
            }
        }
       stage("Parsiranje odgovora"){
               steps{ 
                   script{ 
                    
                   
                    echo comm.toString()
                    echo 'Ovaj pull je ' + comm
                    }
            }
        }
       stage("Pokretanje drugog posla"){
            
            steps{
                script{
                    if(msg=="push"){
                    build job:"PokrenutOdStraneDrugog"
                    }else{
                        echo "Job nije pokrenut"
                    }
                }
                
            }
            
        } 

     
 }
}
