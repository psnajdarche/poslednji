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
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[ url: 'https://github.com/psnajdarche/poslednji.git']]])
                sh 'mvn -D maven.test.failure.ignore=true clean package'
                
            }
        }
       stage("Parsiranje odgovora"){
               steps{ 
                   script{ 
                    def  comm= readJSON text: "$ref"
                    def msg=readJSON text:["$x_github_event"]
                    echo comm.toString()
                    echo msg.toString()
                   
                    echo comm.toString()
                    echo 'Ovaj pull je ' + comm
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
