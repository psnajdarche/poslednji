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
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: , url: 'https://github.com/psnajdarche/poslednji.git']]])
                sh 'mvn -D maven.test.failure.ignore=true clean package'
                
            }
       
           stage("Parsiranje odgovora"){
               steps{ 
                   script{ 
                    def  comm= readJSON text: "$ref"
                    def msg=request.heders"[X_GitHub_Event]"
                    echo comm.toString()
                    echo 'Ovaj pull je ' + comm
                     
                   echo msg.toString()}
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
