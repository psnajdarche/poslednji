pipeline {
    agent any
    
    environment{
        registry = "pavleche/maven-project"
        dockerImage = ''
        korImeILozinka = "dockerKorImeILozinka"
        comm = readJSON text: "$zen"
        msg=readJSON text:"$X_GitHub_Event"
        
    }
     parameters {
        string(name: 'COMMENT', defaultValue: 'test-params', description: 'desc')
        string(name: 'BRANCH', defaultValue: 'main', description: 'desc')
    }


   stages {
       
        
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
